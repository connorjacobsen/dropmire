require 'dropmire'
# require 'spec_helper'

describe Dropmire::Parser do
  @demo_text = ENV['DL_STRING']
  parser = Dropmire::Parser.new(@demo_text)
  subject { parser }

  it "has correct class" do
    expect(subject.class).to eql Dropmire::Parser
  end

  describe "#address" do
    it "returns the address section" do
      expect(subject.address).to eql "%FLTALLAHASSEE"
    end
  end

  describe "#state" do
    it "returns the correct state" do
      addr = subject.address

      expect(subject.state(addr)).to eql "FL"
    end
  end

  describe "#city" do
    it "returns the correct city" do
      addr = subject.address

      expect(subject.city(addr)).to eql "Tallahassee"
    end
  end

  describe "#parse_address" do
    it "returns correct values" do
      expect(subject.parse_address).to eql ["Tallahassee", "FL"]
    end
  end
end