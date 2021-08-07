describe 'deactivate_based_on_ff' do
	let(:user) { FactoryBot.create(:user, email: 'user@mdsol.com') }
    let(:alias_user_1) { FactoryBot.create(:user, email: 'user+100@mdsol.com') }
    let(:alias_user_2) { FactoryBot.create(:user, email: 'user+101@mdsol.com') }
    let(:user_alias_emails) { [user_alias_1.email, user_alias_2.email] }
    context 'deactivates users accounts depending on feature flag ' do

    it 'Deactivate primary and alias accounts, when FF is True' do
		let(:DEACTIVATE_ALIAS_ACCOUNT_FF){ "true" }
    	expect(deactivate_based_on_ff(user,user_alias_emails)).to eq('Your request to deactivate %{user.email} and its associated sub-accounts %{alias_user_1} has been successfully processed.')
	end

    it 'Deactivate only primary account,when FF is False' do
    	let(:DEACTIVATE_ALIAS_ACCOUNT_FF){ "false" }
    	expect(deactivate_based_on_ff(user,user_alias_emails)).to eq('Your request to deactivate %{user.email} has been successfully processed.')
    end
  end
end

describe ' ' do
	let(:user) { FactoryBot.create(:user, email: 'user@mdsol.com') }
	let(:user1) { FactoryBot.create(:user, email: 'user1@mdsol.com') }
    let(:alias_user_1) { FactoryBot.create(:user, email: 'user+100@mdsol.com') }
    let(:alias_user_2) { FactoryBot.create(:user, email: 'user+101@mdsol.com') }
    let(:user_alias_emails) { [user_alias_1.email, user_alias_2.email] }
    context ' ' do
    	it 'when the user has alias_accounts' do
    		expect(deactivate_account_with_aliases(user)).to eq('Your request to deactivate %{user.email} and its associated sub-accounts %{alias_user_1} has been successfully processed.')
		end
    	it 'when the user has only primary account' do
    		expect(deactivate_account_with_aliases(user1)).to eq('Your request to deactivate %{user1.email} has been successfully processed.')
    	end
    end
end

describe ' ' do
	let(:user) { FactoryBot.create(:user, email: 'user@mdsol.com') }
	context 'deactivate user account ' do
		it 'deactivate user account 'do
		expect(deactivate_account(user)).to eq('Your request to deactivate %{user.email} has been successfully processed.')
	end
	end
end


