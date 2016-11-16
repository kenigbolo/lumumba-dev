require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe '#index' do

    context "when there are no Products" do

      before { expect(Product.count).to eq 0 }

      it 'loads correctly' do
        get :index
        controller_ok
      end

      context "signed in" do
        sign_as :admin
        it 'loads correctly too' do
          get :index
          controller_ok
        end
      end

    end

    context "when there are a few Products" do

      before do
        3.times { FactoryGirl.create :product }
      end

      it 'loads correctly' do
        get :index
        controller_ok
      end

      context "signed in" do
        sign_as :admin
        it 'loads correctly too' do
          get :index
          controller_ok
        end
      end

    end

    context "when there are a enough Products to cause pagination" do

      before do
        (ProductsController::ARTICLES_PER_PAGE + 1).times { FactoryGirl.create :product }
      end

      it 'loads correctly' do
        get :index
        controller_ok
      end

      context "signed in" do
        sign_as :admin
        it 'loads correctly too' do
          get :index
          controller_ok
        end
      end

    end

  end

  describe '#new' do
    context "signed in" do
      sign_as :admin
      it 'loads correctly' do
        get :new
        controller_ok
      end
    end
    context "signed out" do
      it 'is unauthorized' do
        get :new
        expect_unauthorized
      end
    end
  end

  describe '#create' do

    let(:reference_product){ FactoryGirl.build(:product) }
    let(:product_params){
      {product:
        {
          name: reference_product.name,
          price: reference_product.price,
          description: reference_product.description,
          designer: reference_product.designer,
          main_image: fixture_file_upload('blank.png', 'image/png'),
          first_thumbnail: fixture_file_upload('blank.png', 'image/png'),
          second_thumbnail: fixture_file_upload('blank.png', 'image/png'),
          third_thumbnail: fixture_file_upload('blank.png', 'image/png')
        }
      }
    }

    context "signed in" do
      sign_as :admin
      it "works" do
        expect {
          post :create, params: product_params
        }.to change {
          Product.count
        }.by(1)
      end
    end

    context "signed out" do
      it "is unauthorized" do
        expect {
          post :create, params: product_params
        }.to_not change {
          Product.count
        }
        expect_unauthorized
      end
    end

  end

  describe '#show' do

    let(:product) { FactoryGirl.create :product }

    context "signed in" do
      sign_as :admin
      it "works" do
        get :show, params: {id: product.id}
        controller_ok
      end
    end

    context "signed out" do
      it "works too" do
        get :show, params: {id: product.id}
        controller_ok
      end
    end

  end

  describe '#edit' do

    let!(:product){ FactoryGirl.create(:product) }
    let(:product_params){
      {
        id: product.id
      }
    }

    context "signed in" do
      sign_as :admin
      it "loads correctly" do
        get :edit, params: product_params
        controller_ok
      end

    end

    context "signed out" do
      let!(:product){ FactoryGirl.create(:product) }
      it "is unauthorized" do
        get :edit, params: product_params
        expect_unauthorized
      end
    end

  end

  describe '#update' do

    let!(:product){ FactoryGirl.create(:product) }
    let(:reference_product){ FactoryGirl.build(:product) }
    let(:product_params){
      {
        id: product.id,
        product: {
          name: reference_product.name,
          price: reference_product.price,
          description: reference_product.description,
          designer: reference_product.designer,
          main_image: fixture_file_upload('blank.png', 'image/png'),
          first_thumbnail: fixture_file_upload('blank.png', 'image/png'),
          second_thumbnail: fixture_file_upload('blank.png', 'image/png'),
          third_thumbnail: fixture_file_upload('blank.png', 'image/png')
        }
      }
    }

    context "signed in" do

      sign_as :admin

      it "works" do
        expect {
          put :update, params: product_params
        }.to change {
          product.reload.updated_at
        }.and change {
          product.reload.name
        }.and change {
          product.reload.price
        }.and change {
          product.reload.description
        }.and change {
          product.reload.designer
        }
      end

    end

    context "signed out" do
      let!(:product){ FactoryGirl.create(:product) }
      it "is unauthorized" do
        expect {
          put :update, params: product_params
        }.to_not change {
          Product.pluck :updated_at
        }
        expect_unauthorized
      end
    end

  end

  describe '#destroy' do

    let!(:product){ FactoryGirl.create(:product) }
    let(:product_params){ {id: product.id} }

    context "signed in" do

      sign_as :admin
      it "works" do
        expect {
          delete :destroy, params: product_params
        }.to change {
          Product.count
        }.by(-1)
      end

    end

    context "signed out" do

      let!(:product){ FactoryGirl.create(:product) }

      it "is forbidden" do
        expect {
          delete :destroy, params: product_params
        }.to_not change {
          Product.count
        }
      end

    end

  end

end
