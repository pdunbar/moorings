require 'rails_helper'

describe Mooring do
  it {should have_many(:reservations)}
  it {should belong_to(:user)}
  it {should belong_to(:harbor)}

  it {should have_valid(:latitude).when(45.222222)}
  it {should_not have_valid(:latitude).when(nil, "")}

  describe "is_reserved?" do
    it "should return false if not reserved" do
      mooring = FactoryGirl.create(:mooring)
      result = mooring.is_reserved?(Date.today, Date.tomorrow)
      expect(result).to eq false
    end
  end
end
