require 'rails_helper'

describe Homevisit do
  it "is valid with a departure, return, and user_id" do
    homevisit = build(:homevisit)
    homevisit.valid?
    expect(homevisit).to be_valid
  end
  it "is not valid without a departure" do
    homevisit = build(:homevisit, date_of_departure: nil)
    homevisit.valid?
    expect(homevisit.errors[:date_of_departure]).to include("can't be blank")
  end
  it "is not valid without a return" do
    homevisit = build(:homevisit, date_of_return: nil)
    homevisit.valid?
    expect(homevisit.errors[:date_of_return]).to include("can't be blank")
  end
  it "is not valid without a client_id" do
    homevisit = build(:homevisit, client_id: nil)
    homevisit.valid?
    expect(homevisit.errors[:client_id]).to include("can't be blank")
  end
  it "has a valid date format"
  xit "does not allow duplicate homevisits per client" do
    create(:homevisit, date_of_departure: "2000-1-1", date_of_return: 2000-1-3, client_id: 1)
    duplicate_hv = build(:homevisit, date_of_departure: "2000-1-1", date_of_return: 2000-1-3, client_id: 1)
    duplicate_hv.valid?
    expect(duplicate_hv).not_to be_valid
  end
end
