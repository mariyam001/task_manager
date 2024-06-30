# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:current_user) { create(:user) }
  before do
    sign_in current_user
  end
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:task) { create(:task) }

    it "returns a success response" do
      get :show, params: { id: task.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let(:task) { create(:task) }

    it "returns a success response" do
      get :edit, params: { id: task.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) { { task: attributes_for(:task) } }

      it "creates a new Task" do
        expect {
          post :create, params: valid_params
        }.to change(Task, :count).by(1)
      end

      it "redirects to the tasks index" do
        post :create, params: valid_params
        expect(response).to redirect_to(tasks_url)
      end
    end
  end

  describe "PATCH #update" do
    let(:task) { create(:task) }

    context "with valid params" do
      let(:new_attributes) { { title: "Updated Title" } }

      it "updates the requested task" do
        patch :update, params: { id: task.to_param, task: new_attributes }
        task.reload
        expect(task.title).to eq("Updated Title")
      end

      it "redirects to the tasks index" do
        patch :update, params: { id: task.to_param, task: new_attributes }
        expect(response).to redirect_to(tasks_url)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:task) { create(:task) }

    it "destroys the requested task" do
      expect {
        delete :destroy, params: { id: task.to_param }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks index" do
      delete :destroy, params: { id: task.to_param }
      expect(response).to redirect_to(tasks_url)
    end
  end
end
