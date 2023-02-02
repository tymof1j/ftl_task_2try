# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Spendings', type: :request do
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
      get spending_path(spending)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get new_spending_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get edit_spending_path(spending)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Spending' do
        expect { post spendings_path, params: { spending: attributes_for(:spending) } }.to change(Spending, :count).by(1)
      end

      it 'redirects to the created spending' do
        post spendings_path, params: { spending: attributes_for(:spending) }
        expect(response).to redirect_to(Spending.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post spendings_path, params: { spending: { amount: nil } }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { amount: 100 } }

      it 'updates the requested spending' do
        put spending_path(spending), params: { spending: new_attributes }
        spending.reload
        expect(spending.amount).to eq(100)
      end

      it 'redirects to the spending' do
        put spending_path(spending), params: { spending: new_attributes }
        expect(response).to redirect_to(spending)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
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
