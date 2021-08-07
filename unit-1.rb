class WorkflowObject
  def deactivate_user(current_user_id, user_to_deactivate_id)
    user_status = { deactivated: [], not_deactivated: [] }
    note_text = ''
    begin
      locale = User.where(id: current_user_id).pluck(:locale)
      set_audit_thread_for_user(current_user_id)
      user = User.find(user_to_deactivate_id)
      user_status = if user.is_alias_account?
                      deactivate_account(user, user_status)
                    else
                      deactivate_account_with_alias(user, user_status)
                    end
      note_text = status_message_creation(user_status, locale)
    rescue StandardError => e
      Rails.logger.error("Error while deactivating user with email #{user.email}: #{e.class}: #{e.message}")
    end
    if note_text.present?
      DeactivationNotification.create(user_id: current_user_id,
                                      note_text: note_text,
                                      parent_id: user_to_deactivate_id)
    end
  ensure
    WorkflowDescription.find_by_uuid(self.uuid).try(:delete)
  end

  def deactivate_account(user, user_status)
    user.deactivate! ? (user_status[:deactivated] << user.email) : (user_status[:not_deactivated] << user.email)
    user_status
  end

  def deactivate_account_with_alias(user, user_status)
    user_status = deactivate_account(user, user_status)
    user.reload
    alias_emails = user.alias_accounts.map(&:email)
    if user.deactivated? && alias_emails.present? && DEACTIVATE_ALIAS_ACCOUNT_FF.present?
      Rails.logger.info("Deactivating #{user.email} and its alias accounts #{alias_emails.join(', ')}")
      user_status_alias_acc = user.deactivate_aliases
      user_status[:deactivated] += user_status_alias_acc[:deactivated]
      user_status[:not_deactivated] += user_status_alias_acc[:not_deactivated]
    end
    user_status
  end

  # s_emails = Emails deactivated successfully
  # f_emails - Emails NOT deactivated successfully

  def status_message_creation(user_status, locale)
    if user_status[:deactvated].present? && user_status[:not_deactivated].present?
      s_emails = user_status[:deactivated].join(', ')
      f_emails = user_status[:not_deactivated].join(', ')
      note_text = I18n.t('admin.users.deactivate.success', email: s_emails, locale: locale)
      note_text += ' and ' + I18n.t('admin.users.deactivate.error', email: f_emails, locale: locale)
    elsif user_status[:deactivated].count <= 0
      note_text = status_message_error(user_status, locale)
    elsif user_status[:not_deactivated].count <= 0
      note_text = status_message_success(user_status, locale)
    end
    note_text
  end

  def status_message_error(user_status, locale)
    main_email = user_status[:not_deactivated].delete_at(0)
    if user_status[:not_deactivated].count.positive?
      f_emails = user_status[:not_deactivated].join(', ')
      I18n.t('admin.users.deactivate.error_alias', email: main_email, error_alias: f_emails, locale: locale)
    else
      I18n.t('admin.users.deactivate.error', email: main_email, locale: locale)
    end
  end

  def status_message_success(user_status, locale)
    main_email = user_status[:deactivated].delete_at(0)
    if user_status[:deactivated].count.positive?
      s_emails = user_status[:deactivated].join(', ')
      I18n.t('admin.users.deactivate.success_alias', email: main_email, alias_emails: s_emails, locale: locale)
    else
      I18n.t('admin.users.deactivate.success', email: main_email, locale: locale)
    end
  end

  handle_asynchronously :deactivate_user, priority: 0, queue: 'default'
end
