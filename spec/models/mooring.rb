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
      reservation = FactoryGirl.create(:reservation, mooring: mooring)
      result = mooring.is_reserved?('2014/7/1', '2014/7/10')
      expect(result).to eq false
    end

    it "should return false if no reservations" do
      mooring = FactoryGirl.create(:mooring)
      result = mooring.is_reserved?(Date.today, Date.tomorrow)
      expect(result).to eq false
    end

    it "should return true if dates match reservation" do
      mooring = FactoryGirl.create(:mooring)
      reservation = FactoryGirl.create(:reservation, mooring: mooring)
      result = mooring.is_reserved?(reservation.check_in, reservation.check_out)
      expect(result).to eq true
    end

    it "should return true if dates if overlap at start of reservation" do
      mooring = FactoryGirl.create(:mooring)
      reservation = FactoryGirl.create(:reservation, mooring: mooring, check_in: '2014/7/4', check_out: '2014/7/30')
      result = mooring.is_reserved?('2014/7/1', '2014/7/20')
      expect(result).to eq true
    end

    it "should return true if dates if overlap at end of reservation" do
      mooring = FactoryGirl.create(:mooring)
      reservation = FactoryGirl.create(:reservation, mooring: mooring, check_in: '2014/7/4', check_out: '2014/7/30')
      result = mooring.is_reserved?('2014/7/6', '2014/8/20')
      expect(result).to eq true
    end

    it "should return true if dates if fit within an existing reservation" do
      mooring = FactoryGirl.create(:mooring)
      reservation = FactoryGirl.create(:reservation, mooring: mooring, check_in: '2014/7/4', check_out: '2014/7/30')
      result = mooring.is_reserved?('2014/7/6', '2014/7/20')
      expect(result).to eq true
    end
  end
end
