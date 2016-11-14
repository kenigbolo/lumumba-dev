require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  [true, false].each do |signed_in|

    context "when the user is #{'not' unless signed_in} signed in" do

      if signed_in
        sign_as
      end

      describe '#index' do
        it 'loads correctly' do
          get :index
          controller_ok
        end
      end

      describe '#leaderboard' do
        context 'when there are no designs' do
          before { expect(Design.count).to eq 0 }
          it 'loads correctly' do
            get :leaderboard
            controller_ok
          end
        end
        context 'when there are a few designs' do
          before do
            3.times do
              FactoryGirl.create :design, for_competition: true
            end
          end
          it 'loads correctly' do
            get :leaderboard
            controller_ok
          end
        end
      end

      describe '#competition' do
        context 'when there are no designs' do
          before { expect(Design.count).to eq 0 }
          it 'loads correctly' do
            get :competition
            controller_ok
          end
        end
        context 'when there are a few designs' do
          before do
            3.times do
              FactoryGirl.create :design, for_competition: true
            end
          end
          it 'loads correctly' do
            get :competition
            controller_ok
          end
        end
        context 'when there are enough designs to use pagination' do
          before do
            n = described_class::DESIGNS_PER_COMPETITION_PAGE + 1
            n.times do
              FactoryGirl.create :design, for_competition: true
            end
          end
          it 'loads correctly' do
            get :competition
            controller_ok
          end
        end
      end

      describe '#contact' do
        it 'loads correctly' do
          get :contact
          controller_ok
        end
      end

      describe 'The static pages' do

        %i(themes guide about faq privacy).each do |static_page|
          describe "/#{static_page}" do
            it 'loads correctly' do
              get static_page
              controller_ok
            end
          end
        end

      end

      describe '#contact_us' do
        let(:params) { { message: FactoryGirl.build(:message).attributes.with_indifferent_access.slice(:name, :email, :message) } }
        describe 'success' do
          before do
            deliver = double
            expect(deliver).to receive(:deliver)
            expect(UserMailer).to receive(:contact_us).and_return(deliver)
          end
          it 'works' do
            expect do
              post :contact_us, params: params
            end.to change {
              Message.count
            }.by(1)
            controller_ok(302)
          end
        end
        describe 'when the message cannot be sent' do
          before do
            message = Message.new
            expect(message).to receive(:save).and_return false
            expect(controller).to receive(:new_message).and_return(message)
            expect(UserMailer).to_not receive(:contact_us)
          end
          it 'responds correctly' do
            expect do
              post :contact_us, params: params
            end.to_not change {
              Message.count
            }
            controller_ok
          end
        end
      end

    end

  end

end
