require 'rails_helper'


describe ProductsController, type: :controller do
  context 'GET #index' do
    it 'renders the index page' do 
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end


    context 'POST #create' do
    it 'is an invalid product' do
    @product = FactoryBot.build(:product, name: "")
    expect(@product).not_to be_valid
    end
  end

  context 'GET #show' do
    it 'renders the show page' do
      product = FactoryBot.create(:product)
      get :show, id: product.id
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context "DELETE #destroy" do
    before do
      @user = FactoryBot.build(:admin)
      sign_in @user
    end

    it "should allow admin to delete product" do
      product = FactoryBot.create(:product)
      delete :destroy, id: product.id
      expect(response).to redirect_to products_path
    end
  end

  context "put #update" do
    before do
      @product = FactoryBot.create(:product)
      @user = FactoryBot.build(:user)
      sign_in @user
    end
    it "successfully updates a product" do
      @update = { name:@product.name, image_url:"images.com", id:@product.id, price:@product.price, colour: "brown"}
      put :update, params: { id: @product.id, product: @update}
      @product.reload
      expect(@product.colour).to eq "brown"
    end
  end

end




