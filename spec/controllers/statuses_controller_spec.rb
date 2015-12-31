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
    it "redirects to cat's show page" do
      post :create, { status: { status: "something else", cat_id: cat.id }, cat_id: cat.id, owner_id: owner.id }
      expect(subject).to redirect_to owner_cat_path(owner_id: owner.id, id: cat.id)
    end
    # it "given good parameters, successfully creates new cat" do
    #   expect(Cat.all.length).to eq 0
    #   post :create, { cat: { name: "name", owner_id: 1 }, owner_id: 1 }
    #   expect(Cat.all.length).to eq 1
    # end
    # it "given bad parameters, does not create new cat" do
    #   expect(Cat.all.length).to eq 0
    #   post :create, { cat: { name: nil, owner_id: nil }, owner_id: 1 }
    #   expect(Cat.all.length).to eq 0
    # end
  end
end
