require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  describe "GET 'show'" do
    it "successful show renders show page" do
      cat = Cat.create(name: "name", owner_id: 1)
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
    end
  end

  describe "POST 'create'" do
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
end
