require 'rails_helper'


describe ProductsController, type: :controller do
  context 'GET #index' do
    it 'renders the index page' do 
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end
end