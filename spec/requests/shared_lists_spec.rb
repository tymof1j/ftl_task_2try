require 'rails_helper'

RSpec.describe 'SharedLists', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:owner) { create(:user) }
    let!(:shared_list) { create(:shared_list, owner_id: owner.id, viewer_id: user.id) }
    let!(:spending) { create(:spending, user_id: owner.id) }

    before do
      sign_in user
    end

    it 'assigns @shared_lists' do
      get shared_lists_path
      expect(assigns(:shared_lists)).to eq [shared_list]
    end

    it 'assigns @shared_lists_by_me' do
      get shared_lists_path
      expect(assigns(:shared_lists_by_me)).to eq []
    end

    it 'assigns @spendings' do
      get shared_lists_path
      expect(assigns(:spendings)).to eq [spending]
    end

    it 'renders the index template' do
      get shared_lists_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    it 'assigns @shared_list with owner_id set to current_user.id' do
      get new_shared_list_path
      expect(assigns(:shared_list).owner_id).to eq user.id
    end

    it 'renders the new template' do
      get new_shared_list_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:shared_list) { create(:shared_list, owner_id: owner.id, viewer_id: user.id) }
    before do
      sign_in user
    end
    context 'with valid params' do
      it 'creates a new SharedList' do
        expect do
          post shared_lists_path, params: { shared_list: { viewer_id: user.id } }
        end.to change(SharedList, :count).by(1)
      end

      it 'assigns a newly created shared_list as @shared_list' do
        post shared_lists_path, params: { shared_list: { viewer_id: user.id } }
        expect(assigns(:shared_list)).to be_a(SharedList)
        expect(assigns(:shared_list)).to be_persisted
      end

      it 'redirects to the created shared_list' do
        post shared_lists_path, params: { shared_list: { viewer_id: user.id } }
        expect(response).to redirect_to(assigns(:shared_list))
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved shared_list as @shared_list' do
        post shared_lists_path, params: { shared_list: { viewer_id: nil } }
        expect(assigns(:shared_list)).to be_a_new(SharedList)
      end

      it "re-renders the 'new' template" do
        post shared_lists_path, params: { shared_list: { viewer_id: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:owner) { create(:user) }
    let(:shared_list) { create(:shared_list, owner_id: owner.id, viewer_id: user.id) }
    before do
      sign_in user
    end

    it 'assigns the requested shared_list to @shared_list' do
      get shared_list_path(shared_list), params: { id: shared_list.id }
      expect(assigns(:shared_list)).to eq shared_list
    end

    it 'assigns the spendings of the owner of the shared list to @spendings' do
      spending = create(:spending, user_id: shared_list.owner_id)
      get shared_list_path(shared_list), params: { id: shared_list.id }
      expect(assigns(:spendings)).to eq [spending]
    end

    it 'renders the :show template' do
      get shared_list_path(shared_list), params: { id: shared_list.id }
      expect(response).to render_template(:show)
    end
  end
end
