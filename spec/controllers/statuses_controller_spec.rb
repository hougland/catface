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
end
