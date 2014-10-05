require 'spec_helper'

describe Dropmire::Identity do
  @demo_text = """%FLTALLAHASSEE^JACOBSEN$CONNOR$ALAN^1234 MAIN ST^                            ?;6360101021210193207=1506199306070=?+! 123454522  E               1602                                   ECCECC00000?"""
  identity = Dropmire::Identity.new(@demo_text)
  subject { identity }

  describe "#first_name" do
    it "returns correct value" do
      expect(subject.first_name).to eql "Connor"
    end
  end

  describe "#middle_name" do
    it "returns correct value" do
      expect(subject.middle_name).to eql "Alan"
    end
  end

  describe "#last_name" do
    it "returns correct value" do
      expect(subject.last_name).to eql "Jacobsen"
    end
  end

  describe "#names" do
    names = {first: "Connor", middle: "Alan", last: ""}
  end

  describe "#address" do
  end

  describe "#city" do
    it "returns correct value" do
      expect(subject.city).to eql "Tallahassee"
    end
  end

  describe "#state" do
    it "returns correct value" do
      expect(subject.state).to eql "FL"
    end
  end

  describe "#street" do
    it "returns correct value" do
      expect(subject.street).to eql "1234 Main St"
    end
  end

  describe "#zipcode" do
    it "returns correct value" do
      expect(subject.zipcode).to eql "12345"
    end
  end

  describe "#drivers_license_number" do
    it "returns correct value" do
      expect(subject.drivers_license_num).to eql "J21210193207"
    end
  end

  describe "#drivers_license_iin" do
    it "returns correct value" do
      expect(subject.drivers_license_iin).to eql "636010"
    end
  end

  describe "#drivers_license_expiration_date" do
    it "returns correct value" do
      expect(subject.drivers_license_expiration_date).to eql "2015-06"
    end
  end

  describe "#date_of_birth" do
    it "returns correct value" do
      expect(subject.date_of_birth).to eql "1993-06-07"
    end
  end
end