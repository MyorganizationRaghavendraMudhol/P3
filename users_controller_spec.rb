require 'spec_helper'

describe Admin::UsersController do
  before do
    allow(CASClient::Frameworks::Rails::Filter).to receive(:filter).and_return(true)
    current_user = mock_model(User, locale: 'eng', time_zone: 'Eastern Time (US & Canada)', uuid: SecureRandom.uuid)
    allow(current_user).to receive(:admin?).and_return(true)
    allow(@controller).to receive(:current_user).and_return(current_user)
    allow(@controller).to receive(:check_eula).and_return(true)
    allow(@controller).to receive(:check_password_almost_expired).and_return(false)
    allow(current_user).to receive(:two_factor_compliant?).and_return(true)
    allow(current_user).to receive(:superadmin?)
  end
  describe 'deactivate' do
    it "maps { controller: 'admin/users', action: 'deactivate' } to admin/users/deactivate" do
      expect(put: 'admin/users/3c466c4f92b90574ccfd1097569ae57d629f3852/deactivate').to route_to(controller:
        'admin/users', action: 'deactivate', id: '3c466c4f92b90574ccfd1097569ae57d629f3852')
    end
    it "deactivate flow" do
      user = stub_model(User, activation_code: '333', login: 'jsmith', uuid: SecureRandom.uuid)
      expect(User).to receive(:find).and_return(user)

      put :deactivate, id: '3c466c4f92b90574ccfd1097569ae57d629f3852'
      expect(response).to redirect_to(controller: 'admin/users', action: 'index')
    end
  end
#end 
end
