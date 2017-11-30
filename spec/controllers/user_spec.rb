require 'rails_helper'

describe UsersController, type: :controller do
  @user = FactoryBot.create(:user)

 # let(:user) { User.create!(email: 'sss@ss.com', password: '1234') }

  describe 'GET #show' do
     context 'when a user is logged in' do
     	before do
        sign_in @user
      end
      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq @user
        expect(response).to have_http_status(200)
      end

     end

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: @user.id }
         expect(response).to redirect_to("http://test.host/")
       end
     end
  end

end