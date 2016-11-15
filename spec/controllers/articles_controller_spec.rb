require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe '#index' do

    context "when there are no Articles" do

      before { expect(Article.count).to eq 0 }

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

    context "when there are a few Articles" do

      before do
        3.times { FactoryGirl.create :article }
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

    context "when there are a enough Articles to cause pagination" do

      before do
        (ArticlesController::ARTICLES_PER_PAGE + 1).times { FactoryGirl.create :article }
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

    let(:reference_article){ FactoryGirl.build(:article) }
    let(:article_params){
      {article:
        {
          title: reference_article.title,
          description: reference_article.description,
          image: fixture_file_upload('blank.png', 'image/png')
        }
      }
    }

    context "signed in" do
      sign_as
      it "works" do
        expect {
          post :create, article_params
        }.to change {
          Article.count
        }.by(1)
      end
    end

    context "signed out" do
      it "is unauthorized" do
        expect {
          post :create, article_params
        }.to_not change {
          Article.count
        }
        expect_unauthorized
      end
    end

  end

  describe '#show' do

    let(:article) { FactoryGirl.create :article }

    context "signed in" do
      sign_as
      it "works" do
        get :show, params: {id: article.id}
        controller_ok
      end
    end

    context "signed out" do
      it "works too" do
        get :show, params: {id: article.id}
        controller_ok
      end
    end

  end

  describe '#upvote' do

    let(:article) { FactoryGirl.create :article }

    context "signed in" do

      sign_as
      it "works" do
        expect {
          put :upvote, params: {id: article.id}
        }.to change {
          article.reload.votes_for.size
        }.by(1)
      end

      context "when I already have voted" do

        before do
          article.upvote_by user
        end

        it "doesn't let me to upvote twice" do
          expect {
            put :upvote, params: {id: article.id}
          }.to_not change {
            article.reload.votes_for.size
          }
          expect(flash[:error]).to include("You already liked this article")
        end

      end

    end

    context "signed out" do
      it "is unauthorized" do
        expect {
          put :upvote, params: {id: article.id}
        }.to_not change {
          article.reload.votes_for.size
        }
        expect_unauthorized
      end
    end

  end

  describe '#edit' do

    let!(:article){ FactoryGirl.create(:article, user: user) }
    let(:article_params){
      {
        id: article.id
      }
    }

    context "signed in" do
      sign_as
      it "loads correctly" do
        get :edit, params: article_params
        controller_ok
      end

      context "attempting to edit an article I don't own" do

        let!(:article){ FactoryGirl.create(:article) }

        it "redirects me somewhere else" do
          get :edit, params: article_params
          controller_ok 302
        end

      end

    end

    context "signed out" do
      let!(:article){ FactoryGirl.create(:article) }
      it "is unauthorized" do
        get :edit, article_params
        expect_unauthorized
      end
    end

  end

  describe '#update' do

    let!(:article){ FactoryGirl.create(:article, user: user) }
    let(:reference_article){ FactoryGirl.build(:article) }
    let(:article_params){
      {
        id: article.id,
        article: {
          title: reference_article.title,
          description: reference_article.description,
        }
      }
    }

    context "signed in" do

      sign_as

      it "works" do
        expect {
          put :update, article_params
        }.to change {
          article.reload.updated_at
        }.and change {
          article.reload.title
        }.and change {
          article.reload.description
        }
      end

      context "attempting to update an Article I don't own" do

        let!(:article){ FactoryGirl.create(:article) }

        it "returns 404" do
          expect {
            put :update, params: article_params
          }.to_not change {
            Article.pluck :updated_at
          }
          controller_ok(404)
        end

      end

    end

    context "signed out" do
      let!(:article){ FactoryGirl.create(:article) }
      it "is unauthorized" do
        expect {
          put :update, article_params
        }.to_not change {
          Article.pluck :updated_at
        }
        expect_unauthorized
      end
    end

  end

  describe '#destroy' do

    let!(:article){ FactoryGirl.create(:article, user: user) }
    let(:article_params){ {id: article.id} }

    context "signed in" do

      sign_as
      it "works" do
        expect {
          delete :destroy, article_params
        }.to change {
          Article.count
        }.by(-1)
      end

      context "attempting to delete an article I don't own" do

        let!(:article){ FactoryGirl.create(:article) }

        it "is forbidden" do
          expect {
            delete :destroy, article_params
          }.to_not change {
            Article.count
          }
        end

      end

    end

    context "signed out" do

      let!(:article){ FactoryGirl.create(:article) }

      it "is forbidden" do
        expect {
          delete :destroy, article_params
        }.to_not change {
          Article.count
        }
      end

    end

  end

end
