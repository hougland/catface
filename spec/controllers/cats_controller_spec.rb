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
end
