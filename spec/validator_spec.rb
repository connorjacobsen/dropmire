require 'spec_helper'

describe Dropmire::Validator do

  context "validates corrext regex" do
    it "doesnt raise exception" do
      @text1 = """%FLTALLAHASSEE^JACOBSEN$CONNOR$ALAN^6357 SINKOLA DR^                            ?;6360101021210193207=1506199306070=?+! 323124522  E               1602                                   ECCECC00000?"""
      expect { Dropmire::Validator.new(@text1) }.to_not raise_error
    end
  end

  context "validates corrext regex" do
    it "raises exception" do
      @text2 = """%FLTALLAHASSEEJACOBSEN$CONNOR$ALAN^6357 SINKOLA DR^                            ?;6360101021210193207=1506199306070=?+! 323124522  E               1602                                   ECCECC00000?"""
      expect { Dropmire::Validator.new(@text2) }.to raise_error
    end
  end
end