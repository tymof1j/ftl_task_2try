# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Spendings', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }
  let(:spending) { create(:spending, user_id: user.id) }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns a success response' do
      get spendings_path
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      # spending = create(:spending)
      get spending_path(spending)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      # sign_in create(:user)
      get new_spending_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      # spending = create(:spending)
      # sign_in spending.user
      get edit_spending_path(spending)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Spending' do
        # sign_in create(:user)
        expect { post spendings_path, params: { spending: attributes_for(:spending) } }.to change(Spending, :count).by(1)
      end

      it 'redirects to the created spending' do
        # sign_in create(:user)
        post spendings_path, params: { spending: attributes_for(:spending) }
        expect(response).to redirect_to(Spending.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        # sign_in create(:user)
        post spendings_path, params: { spending: { amount: nil } }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { amount: 100 } }

      it 'updates the requested spending' do
        # spending = create(:spending)
        # sign_in spending.user
        put spending_path(spending), params: { spending: new_attributes }
        spending.reload
        expect(spending.amount).to eq(100)
      end

      it 'redirects to the spending' do
        # spending = create(:spending)
        # sign_in spending.user
        put spending_path(spending), params: { spending: new_attributes }
        expect(response).to redirect_to(spending)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        # spending = create(:spending)
        # sign_in spending.user
        put spending_path(spending), params: { spending: { amount: nil } }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the requested spending' do
      spending = create(:spending, user_id: user.id)
      expect {
        delete spending_path(spending)
      }.to change(Spending, :count).by(-1)
    end

    it 'redirects to the spendings list' do
      spending = create(:spending, user_id: user.id)
      delete spending_path(spending)
      expect(response).to redirect_to(spendings_path)
    end
  end

end

# RSpec.describe 'Spendings', type: :request do
#   include Devise::Test::ControllerHelpers
#
#   # Setup test data using Factory Bot
#   let(:user) { create(:user) }
#   let(:spending) { create(:spending, user_id: user.id) }
#
#   # Set Devise authentication for each test
#   before { sign_in user }
#
#   describe 'GET #index' do
#     it 'returns a success response' do
#       binding.pry
#       get :index
#       expect(response).to be_successful
#     end
    #
    # it 'renders the index template' do
    #   get :index
    #   expect(response).to render_template('index')
    # end
    #
    # it "assigns only the current user's spendings" do
    #   # Create a spending for a different user
    #   other_user = create(:user)
    #   other_spending = create(:spending, user: other_user)
    #
    #   get :index
    #   expect(assigns(:spendings)).to eq([spending])
    # end
  # end

#   describe 'GET #show' do
#     it 'returns a success response' do
#       get :show, params: { id: spending.to_param }
#       expect(response).to be_successful
#     end
#
#     it 'renders the show template' do
#       get :show, params: { id: spending.to_param }
#       expect(response).to render_template('show')
#     end
#
#     it "assigns only the current user's spending" do
#       # Create a spending for a different user
#       other_user = create(:user)
#       other_spending = create(:spending, user: other_user)
#
#       get :show, params: { id: spending.to_param }
#       expect(assigns(:spending)).to eq(spending)
#     end
#   end
#
#   describe 'GET #new' do
#     it 'returns a success response' do
#       get :new
#       expect(response).to be_successful
#     end
#
#     it 'renders the new template' do
#       get :new
#       expect(response).to render_template('new')
#     end
#   end
#
#   describe 'GET #edit' do
#     it 'returns a success response' do
#       get :edit, params: { id: spending.to_param }
#       expect(response).to be_successful
#     end
#
#     it 'renders the edit template' do
#       get :edit, params: { id: spending.to_param }
#       expect(response).to render_template('edit')
#     end
#
#     it "assigns only the current user's spending" do
#       # Create a spending for a different user
#       other_user = create(:user)
#       other_spending = create(:spending, user: other_user)
#
#       get :edit, params: { id: spending.to_param }
#       expect(assigns(:spending)).to eq(spending)
#     end
#   end
# end
