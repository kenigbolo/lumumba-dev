require 'rails_helper'

RSpec.describe DesignsController, type: :controller do

    describe '#index' do

      context "when there are no Designs" do

        before { expect(Design.count).to eq 0 }

        it 'loads correctly' do
          get :index
          controller_ok
        end

        context "signed in" do
          sign_as
          it 'loads correctly too' do
            get :index
            controller_ok
          end
        end

      end

      context "when there are a few Designs" do

        before do
          3.times { FactoryGirl.create :design }
        end

        it 'loads correctly' do
          get :index
          controller_ok
        end

        context "signed in" do
          sign_as
          it 'loads correctly too' do
            get :index
            controller_ok
          end
        end

      end

      context "when there are a enough Designs to cause pagination" do

        before do
          (DesignsController::ARTICLES_PER_PAGE + 1).times { FactoryGirl.create :design }
        end

        it 'loads correctly' do
          get :index
          controller_ok
        end

        context "signed in" do
          sign_as
          it 'loads correctly too' do
            get :index
            controller_ok
          end
        end

      end

    end

    describe '#new' do
      context "signed in" do
        sign_as
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

      let(:reference_design){ FactoryGirl.build(:design) }
      let(:design_params){
        {design:
          {
            image_desc: reference_design.image_desc,
            first_garment_desc: reference_design.first_garment_desc,
            second_garment_desc: reference_design.second_garment_desc,
            third_garment_desc: reference_design.third_garment_desc,

            image: fixture_file_upload('blank.png', 'image/png'),

            first_garment_design: fixture_file_upload('blank.png', 'image/png'),
            second_garment_design: fixture_file_upload('blank.png', 'image/png'),
            third_garment_design: fixture_file_upload('blank.png', 'image/png'),

            first_garment_print_design: fixture_file_upload('blank.png', 'image/png'),
            second_garment_print_design: fixture_file_upload('blank.png', 'image/png'),
            third_garment_print_design: fixture_file_upload('blank.png', 'image/png'),

            first_garment_technical_design: fixture_file_upload('blank.png', 'image/png'),
            second_garment_technical_design: fixture_file_upload('blank.png', 'image/png'),
            third_garment_technical_design: fixture_file_upload('blank.png', 'image/png'),

            first_garment_model_design: fixture_file_upload('blank.png', 'image/png'),
            second_garment_model_design: fixture_file_upload('blank.png', 'image/png'),
            third_garment_model_design: fixture_file_upload('blank.png', 'image/png')
          }
        }
      }

      context "signed in" do
        sign_as
        it "works" do
          expect {
            post :create, params: design_params
          }.to change {
            Design.count
          }.by(1)
        end
      end

      context "signed out" do
        it "is unauthorized" do
          expect {
            post :create, params: design_params
          }.to_not change {
            Design.count
          }
          expect_unauthorized
        end
      end

    end

    describe '#show' do

      let(:design) { FactoryGirl.create :design }

      context "signed in" do
        sign_as
        it "works" do
          get :show, params: {id: design.id}
          controller_ok
        end
      end

      context "signed out" do
        it "is forbidden" do
          get :show, params: {id: design.id}
          expect_unauthorized
        end
      end

    end

    describe '#upvote' do

      let(:design) { FactoryGirl.create :design }

      context "signed in" do

        sign_as
        it "works" do
          expect {
            put :upvote, params: {id: design.id}
          }.to change {
            design.reload.votes_for.size
          }.by(1)
        end

        context "when I already have voted" do

          before do
            design.upvote_by user
          end

          it "doesn't let me to upvote twice" do
            expect {
              put :upvote, params: {id: design.id}
            }.to_not change {
              design.reload.votes_for.size
            }
            expect(flash[:error]).to include("You already liked this design")
          end

        end

      end

      context "signed out" do
        it "is unauthorized" do
          expect {
            put :upvote, params: {id: design.id}
          }.to_not change {
            design.reload.votes_for.size
          }
          expect_unauthorized
        end
      end

    end

    describe '#edit' do

      let!(:design){ FactoryGirl.create(:design, user: user) }
      let(:design_params){
        {
          id: design.id
        }
      }

      context "signed in" do
        sign_as
        it "loads correctly" do
          get :edit, params: design_params
          controller_ok
        end

        context "attempting to edit an design I don't own" do

          let!(:design){ FactoryGirl.create(:design) }

          it "redirects me somewhere else" do
            get :edit, params: design_params
            controller_ok 302
          end

        end

      end

      context "signed out" do
        let!(:design){ FactoryGirl.create(:design) }
        it "is unauthorized" do
          get :edit, params: design_params
          expect_unauthorized
        end
      end

    end

    describe '#update' do

      let!(:design){ FactoryGirl.create(:design, user: user) }
      let(:reference_design){ FactoryGirl.build(:design) }
      let(:design_params){
        {
          id: design.id,
          design: {
            image_desc: reference_design.image_desc,
            first_garment_desc: reference_design.first_garment_desc,
            second_garment_desc: reference_design.second_garment_desc,
            third_garment_desc: reference_design.third_garment_desc
          }
        }
      }

      context "signed in" do
        sign_as
        it "works" do
          expect {
            put :update, params: design_params
          }.to change {
            design.reload.image_desc
          }.and change {
            design.reload.first_garment_desc
          }.and change {
            design.reload.second_garment_desc
          }.and change {
            design.reload.third_garment_desc
          }
        end
      end

      context "signed out" do
        let!(:design){ FactoryGirl.create(:design) }
        it "is unauthorized" do
          expect {
            put :update, params: design_params
          }.to_not change {
            Design.pluck :updated_at
          }
          expect_unauthorized
        end
      end

    end

    describe '#destroy' do

      let!(:design){ FactoryGirl.create(:design, user: user) }
      let(:design_params){ {id: design.id} }

      context "signed in" do

        sign_as
        it "works" do
          expect {
            delete :destroy, params: design_params
          }.to change {
            Design.count
          }.by(-1)
        end

        context "attempting to delete an design I don't own" do

          let!(:design){ FactoryGirl.create(:design) }

          it "is forbidden" do
            expect {
              delete :destroy, params: design_params
            }.to_not change {
              Design.count
            }
          end

        end

      end

      context "signed out" do

        let!(:design){ FactoryGirl.create(:design) }

        it "is forbidden" do
          expect {
            delete :destroy, params: design_params
          }.to_not change {
            Design.count
          }
        end

      end

    end


end
