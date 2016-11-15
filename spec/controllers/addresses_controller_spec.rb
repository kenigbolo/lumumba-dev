require 'rails_helper'

RSpec.describe AddressesController, type: :controller do

  describe '#index' do

    context "signed out" do

      it "is unauthorized" do
        get :index
        expect_unauthorized
      end

    end

    context "signed in" do

      sign_as

      context "when the user has an Address created" do

        before { FactoryGirl.create :address, user: user }

        it "loads correctly" do
          get :index
          controller_ok
        end

      end

      context "when the user does not have an Address created" do

        before { expect(Address.count).to be_zero }

        it "loads correctly" do
          get :index
          controller_ok
        end

      end

    end
  end

  describe '#new' do

    context "signed out" do

      it "is unauthorized" do
        get :new
        expect_unauthorized
      end

    end

    context "signed in" do

      sign_as

      it "loads correctly" do
        get :new
        controller_ok
      end

    end
  end

  describe '#create' do

    let(:reference_address){ FactoryGirl.build(:address) }
    let(:address_params){
      {address:
        {
          street_address: reference_address.street_address,
          city: reference_address.city,
          state: reference_address.state,
          country: reference_address.country,
          zip_code: reference_address.zip_code
      }
      }
    }

    context "signed in" do
      sign_as
      it "works" do
        expect {
          post :create, address_params
        }.to change {
          Address.count
        }.by(1)
      end
    end

    context "signed out" do
      it "is unauthorized" do
        expect {
          post :create, address_params
        }.to_not change {
          Address.count
        }
        expect_unauthorized
      end
    end

  end

  describe '#update' do

    let!(:address){ FactoryGirl.create(:address, user: user) }
    let(:reference_address){ FactoryGirl.build(:address) }
    let(:address_params){
      {
        id: address.id,
        address: {
          street_address: reference_address.street_address,
          city: reference_address.city,
          state: reference_address.state,
          country: reference_address.country,
          zip_code: reference_address.zip_code
        }
      }
    }

    context "signed in" do
      sign_as
      it "works" do
        expect {
          put :update, address_params
        }.to change {
          address.reload.updated_at
        }.and change {
          address.reload.street_address
        }.and change {
          address.reload.city
        }.and change {
          address.reload.state
        }.and change {
          address.reload.country
        }.and change {
          address.reload.zip_code
        }
      end
    end

    context "signed out" do
      let!(:address){ FactoryGirl.create(:address) }
      it "is unauthorized" do
        expect {
          put :update, address_params
        }.to_not change {
          Address.pluck :updated_at
        }
        expect_unauthorized
      end
    end

  end

  describe '#destroy' do

    let!(:address){ FactoryGirl.create(:address, user: user) }
    let(:address_params){ {id: address.id} }

    context "signed in" do

      sign_as
      it "works" do
        expect {
          delete :destroy, address_params
        }.to change {
          Address.count
        }.by(-1)
      end

      context "attempting to delete an address I don't own" do

        let!(:address){ FactoryGirl.create(:address) }

        it "is forbidden" do
          expect {
            delete :destroy, address_params
          }.to_not change {
            Address.count
          }
        end

      end

    end

    context "signed out" do

      let!(:address){ FactoryGirl.create(:address) }

      it "is forbidden" do
        expect {
          delete :destroy, address_params
        }.to_not change {
          Address.count
        }
      end

    end

  end

end
