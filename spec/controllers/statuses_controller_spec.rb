require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  let(:owner) do
    Owner.create(name: "name", city: "seattle")
  end

  let(:cat) do
    Cat.create(name: "fluffy", owner_id: 1)
  end

  let(:status) do
    Status.create(status: "something", cat_id: cat.id)
  end

  let(:good_params) do
    { status:
      { status: "something else", cat_id: cat.id },
      cat_id: cat.id, owner_id: owner.id }
  end

  describe "GET 'index'" do
    it "successful index renders index page" do
      get :index, owner_id: owner.id, cat_id: cat.id
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET 'show'" do
    it "successful show renders show page" do
      status
      expect(Status.all.length).to eq 1
      get :show, owner_id: owner.id, cat_id: cat.id, id: status.id
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "successfully renders new page" do
      get :new, owner_id: owner.id, cat_id: cat.id
      expect(response.status).to eq 200
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    it "redirects to status' show page" do
      post :create, good_params
      expect(subject).to redirect_to owner_cat_path(owner_id: owner.id, id: cat.id)
    end
    it "given good parameters, successfully creates new status" do
      expect(Status.all.length).to eq 0
      post :create, good_params
      expect(Status.all.length).to eq 1
    end
    it "given bad parameters, does not create new status" do
      expect(Status.all.length).to eq 0
      post :create, { status: { status: nil, cat_id: cat.id }, cat_id: cat.id, owner_id: owner.id }
      expect(Status.all.length).to eq 0
      post :create, { status: { status: "something more", cat_id: nil }, cat_id: cat.id, owner_id: owner.id }
      expect(Status.all.length).to eq 0
    end
  end

  describe "DELETE 'destroy'" do
    it "successfully destroys instance of status" do
      status
      expect(Status.all.length).to eq 1
      delete :destroy, owner_id: cat.owner_id, cat_id: status.cat.id, id: status.id
      expect(Status.all.length).to eq 0
    end
    it "redirects to owner's show page" do
      status
      delete :destroy, owner_id: cat.owner_id, cat_id: status.cat.id, id: status.id
      expect(subject).to redirect_to owner_cat_path(owner_id: status.cat.owner_id, id: cat.id)
    end
  end
end
