require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Owner.new(name:"name")).to be_valid
      expect(Owner.new(name: nil)).to be_invalid
    end
  end
end
