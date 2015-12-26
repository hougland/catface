require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  let(:cat) do
    Cat.create(name: "name", owner_id: 1)
  end
  describe "GET 'show'" do
    it "successful show renders show page" do
      cat
      expect(Cat.all.length).to eq 1
      get :show, owner_id: cat.owner_id, id: cat.id
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "successfully renders new page" do
      get :new, owner_id: 1
      expect(response.status).to eq 200
      expect(subject).to render_template :new
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    it "redirects to owner's show page" do
      post :create, { cat: { name: "name", owner_id: 1 }, owner_id: 1 }
      expect(subject).to redirect_to owner_path(1)
    end
    it "given good parameters, successfully creates new cat" do
      expect(Cat.all.length).to eq 0
      post :create, { cat: { name: "name", owner_id: 1 }, owner_id: 1 }
      expect(Cat.all.length).to eq 1
    end
    it "given bad parameters, does not create new cat" do
      expect(Cat.all.length).to eq 0
      post :create, { cat: { name: nil, owner_id: nil }, owner_id: 1 }
      expect(Cat.all.length).to eq 0
    end
  end

  describe "DELETE 'destroy'" do
    it "successfully destroys instance of cat" do
      cat
      expect(Cat.all.length).to eq 1
      delete :destroy, owner_id: cat.owner_id, id: cat.id
      expect(Cat.all.length).to eq 0
    end
    it "redirects to owner's show page" do
      delete :destroy, owner_id: cat.owner_id, id: cat.id
      expect(subject).to redirect_to owner_path(1)
    end
  end

  describe "GET 'edit'" do
    it "successfully renders edit page" do
      get :edit, owner_id: cat.owner_id, id: cat.id
      expect(response.status).to eq 200
      expect(subject).to render_template :edit
    end
  end
end
