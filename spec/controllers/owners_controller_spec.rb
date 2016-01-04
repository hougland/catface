RSpec.describe OwnersController, type: :controller do

  before(:each) do
    @owner = Owner.create(name: "Test", city: "Seattle")
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @cat = Cat.create(name: "Grumpy Cat", owner_id: @owner.id)
      @status = Status.create(status: "meow", cat_id: @cat.id)
    end

    it "renders show view" do
      get :show, id: @owner.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do

    let(:owner_params) do
      {
        owner: {
          name: "Cat Lover"
        }
      }
    end
    it "successful create redirects to show page" do
      post :create, owner_params
      expect(response.status).to eq 302
      expect(subject).to redirect_to owner_path(Owner.last.id)
    end
  end

  describe "GET 'edit'" do

    it "renders edit view" do
      get :edit, id: @owner.id
      expect(response.status).to eq 200
    end
  end

  describe "PATCH 'update'" do
    let(:update_params) do
      {
        owner: {
          name: "Claire The Great"
        }
      }
    end

    it "updates an owner" do
      patch :update, { id: @owner.id }.merge(update_params)
      @owner.reload
      expect(Owner.find(@owner.id).name).to eq "Claire The Great"
    end

    it "redirects to the owner page" do
      patch :update, { id: @owner.id }.merge(update_params)
      @owner.reload
      expect(response).to redirect_to owner_path(@owner.id)
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to the root path" do
      delete :destroy, id: @owner.id
      expect(response.status).to eq 302
      expect(subject).to redirect_to root_path
    end
  end


  describe "GET 'select'" do
    it "redirects to the owner page of selected owner" do
      get :select, owner_name: @owner.name
      expect(subject).to redirect_to owner_path(@owner.id)
    end
  end
end
