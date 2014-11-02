require 'spec_helper'

describe Dropmire::Parser do
  @demo_text = """%FLTALLAHASSEE^JACOBSEN$CONNOR$ALAN^6357 SINKOLA DR^                            ?;6360101021210193207=1506199306070=?+! 323124522  E               1602                                   ECCECC00000?"""
  parser = Dropmire::Parser.new(@demo_text)
  subject { parser }

  it "has correct class" do
    expect(subject.class).to eql Dropmire::Parser
  end

  describe "#address" do
    it "returns the address section" do
      expect(subject.address(subject.instance_variable_get(:@text))).to eql "%FLTALLAHASSEE"
    end

    context "when city is two words" do
      it "returns the address section" do
        @demo_text2 = """%FLPALM CITY^JACOBSEN$CONNOR$ALAN^6357 SINKOLA DR^                            ?;6360101021210193207=1506199306070=?+! 323124522  E               1602                                   ECCECC00000?"""
        expect(subject.address(@demo_text2)).to eql "%FLPALM CITY"
      end
    end
  end

  describe "#state" do
    it "returns the correct state" do
      addr = subject.address(subject.instance_variable_get(:@text))

      expect(subject.state(addr)).to eql "FL"
    end
  end

  describe "#city" do
    it "returns the correct city" do
      addr = subject.address(subject.instance_variable_get(:@text))

      expect(subject.city(addr)).to eql "Tallahassee"
    end
  end

  describe "#parse_address" do
    it "returns correct values" do
      expect(subject.parse_address).to eql ["Tallahassee", "FL"]
    end
  end

  describe "#carrot_string" do
    it "returns the correct array" do
      carrot_arr = ["JACOBSEN$CONNOR$ALAN", "6357 SINKOLA DR"]
      @demo_text = """%FLPALM CITY^JACOBSEN$CONNOR$ALAN^6357 SINKOLA DR^                            ?;6360101021210193207=1506199306070=?+! 323124522  E               1602                                   ECCECC00000?"""
      expect(subject.carrot_string(@demo_text)).to eql carrot_arr
    end
  end

  describe "#names" do
    it "returns the correct array of strings" do
      name_arr = %w(Connor Alan Jacobsen)
      expect(subject.names(%w(JACOBSEN CONNOR ALAN))).to eql name_arr
    end

    context "when middle name not present" do
      it "returns the correct hash" do
        @demo_text = """%FLPALM CITY^JACOBSEN$CONNOR$^6357 SINKOLA DR^                            ?;6360101021210193207=1506199306070=?+! 323124522  E               1602                                   ECCECC00000?"""
        carrot_arr = subject.carrot_string(@demo_text)
        name_string = carrot_arr.first
        name_arr = subject.split_name(name_string)
        val = ["Connor", nil, "Jacobsen"]
        expect(subject.names(name_arr)).to eql val
      end
    end
  end

  describe "street" do
    it "returns the correct string" do
      the_street = "6357 SINKOLA DR"
      expect(subject.street(the_street)).to eql "6357 Sinkola Dr"
    end
  end

  describe "#zipcode" do
    it "returns correct zipcode" do
      expect(subject.zipcode).to eql "32312"
    end
  end

  describe "#id_string" do
    it "returns the correct string" do
      expect(subject.id_string).to eql "6360101021210193207"
    end
  end

  describe "#iin" do
    it "returns correct iin" do
      id_str = subject.id_string
      expect(subject.iin(id_str)).to eql "636010"
    end
  end

  describe "#license_num" do
    context "Florida" do
      it "returns the correct string" do
        id_str = subject.id_string
        expect(subject.license_num(id_str)).to eql "J21210193207"
      end
    end
  end

  describe "#license_class" do
    it "returns correct license_class" do
      expect(subject.license_class).to eql "E"
    end
  end

  describe "#expiration_date" do
    it "returns the correct date" do
      expect(subject.expiration_date("=1506199306070")).to eql "2015-06-07"
    end
  end

  describe "#transform_date" do
    it "returns Unix format" do
      expect(subject.transform_date("1707")).to eql "2017-07"
    end
  end

  describe "#date_of_birth" do
    context "Florida" do
      it "returns correct date_of_birth" do
        expect(subject.date_of_birth("=1506199306070")).to eql "1993-06-07"
      end
    end
  end
end