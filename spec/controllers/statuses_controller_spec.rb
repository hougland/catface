require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  let(:owner) do
    Owner.create(name: "name", city: "seattle")
  end

  let(:cat) do
    Cat.create(name: "fluffy", owner_id: 1)
  end
  describe "GET 'index'" do
    it "successful index renders index page" do
      get :index, owner_id: owner.id, cat_id: cat.id
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end
end
