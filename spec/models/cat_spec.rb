require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe ".validates" do
    it "must have a name and owner_id" do
      expect(Cat.new(name:"name", owner_id: 1)).to be_valid
      expect(Cat.new(name: nil, owner_id: 1)).to be_invalid
      expect(Cat.new(name: "name", owner_id: nil)).to be_invalid
    end
  end
end
