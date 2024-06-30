# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User factory or fixture set up
  let(:valid_attributes) {
    { title: "Task title", description: "Task description", state: "Backlog", deadline: Time.now + 1.day, user_id: user.id }
  }
  let(:invalid_attributes) {
    { title: "", description: "Task description", state: "Backlog", deadline: Time.now + 1.day, user_id: user.id }
  }

  before do
    sign_in user # Sign in the user before each example
  end

  describe "GET #index" do
    it "returns a success response" do
      task = Task.create! valid_attributes
      get :index, format: :html
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      task = Task.create! valid_attributes
      get :show, params: { id: task.to_param }, format: :html
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, format: :html
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      task = Task.create! valid_attributes
      get :edit, params: { id: task.to_param }, format: :html
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: { task: valid_attributes }, format: :html
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: { task: valid_attributes }, format: :html
        expect(response).to redirect_to(tasks_url)
      end
    end

    context "with invalid params" do
      it "does not create a new Task" do
        expect {
          post :create, params: { task: invalid_attributes }, format: :html
        }.to_not change(Task, :count)
      end

      it "renders the 'new' template" do
        post :create, params: { task: invalid_attributes }, format: :html
        expect(response).to render_template("new")
      end
    end
  end
end