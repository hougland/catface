require 'rails_helper'

RSpec.describe Status, type: :model do
  describe ".validates" do
    it "must have a status and cat_id" do
      expect(Status.new(status:"name", cat_id: 1)).to be_valid
      expect(Status.new(status: nil, cat_id: 1)).to be_invalid
      expect(Status.new(status: "name", cat_id: nil)).to be_invalid
    end
  end
end
