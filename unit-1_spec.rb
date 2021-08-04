require 'spec_helper'

describe Workflow do
  describe '#deactivate workflow' do
    let(:workflow) { Workflow.new }
    let(:workflow_obj) { workflow.instance_variable_get(:@workflow_object) }
    let(:current_user) { FactoryBot.create(:user, email: 'current_user@mdsol.com', admin: 1) }
    let(:user) { FactoryBot.create(:user, email: 'user@mdsol.com') }
    let(:alias_user_1) { FactoryBot.create(:user, email: 'user+100@mdsol.com') }
    let(:alias_user_2) { FactoryBot.create(:user, email: 'user+101@mdsol.com') }
    context 'when primary account has alias accounts' do
      before do
        @arr = [alias_user_1, alias_user_2]
        workflow.deactivate_user(current_user.id, user.id)
        [user, alias_user_1, alias_user_2].map(&:reload)
      end

      context 'when primary account and alias accounts are deactivated successfully' do
        it 'returns true' do
          [user, alias_user_1, alias_user_2].each { |local_user| expect(local_user.deactivated?).to eq(true) }
        end
        it 'returns success message' do
          if user.deactivated? && alias_user_1.deactivated? && alias_user_2.deactivated?
            user_status_hash = {
              deactivated: ['user@mdsol.com', 'user+100@mdsol.com', 'user+101@mdsol.com'],
              not_deactivated: []
            }
          end

          note_text = workflow.status_message_creation(user_status_hash, current_user.locale)
          expected_text = ['Your request to deactivate user@mdsol.com',
                           'and its associated sub-accounts user+100@mdsol.com, user+101@mdsol.com',
                           'has been successfully processed.'].join(' ')
          expect(note_text).to eq(expected_text)
        end
      end
    end

    context 'when acccount itself is alias' do
      before do
        @arr1 = [current_user, alias_user_1]
        workflow.deactivate_user(current_user.id, alias_user_1.id)
        alias_user_1.reload
      end

      context 'when alias account is deactivated successfully' do
        it 'returns true' do
          expect(alias_user_1.deactivated?).to eq(true)
        end

        it 'returns success message' do
          user_status_hash = { deactivated: ['user+100@mdsol.com'], not_deactivated: [] } if alias_user_1.deactivated?

          note_text = workflow.status_message_creation(user_status_hash, current_user.locale)
          expect(note_text).to eq('Your request to deactivate user+100@mdsol.com has been successfully processed.')
        end
      end
    end
  end
end
