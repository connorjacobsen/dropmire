require 'spec_helper'

describe Dropmire::Soundex do
  describe "#soundex" do
    context "String" do
      context "Robert" do
        it "returns R163" do
          expect(Dropmire::Soundex.soundex("Robert")).to eql 'R163'
        end
      end

      context "Rupert" do
        it "returns R163" do
          expect(Dropmire::Soundex.soundex("Rupert")).to eql 'R163'
        end
      end

      context "Rubin" do
        it "returns R150" do
          expect(Dropmire::Soundex.soundex("Rubin")).to eql 'R150'
        end
      end

      context "Ashcraft" do
        it "returns A261" do
          expect(Dropmire::Soundex.soundex("Ashcraft")).to eql 'A261'
        end
      end

      context "Ashcroft" do
        it "returns A261" do
          expect(Dropmire::Soundex.soundex("Ashcroft")).to eql 'A261'
        end
      end

      context "Tymczak" do
        it "returns T522" do
          expect(Dropmire::Soundex.soundex("Tymczak")).to eql 'T522'
        end
      end

      context "Pfister" do
        it "returns P236" do
          expect(Dropmire::Soundex.soundex("Pfister")).to eql 'P236'
        end
      end
    end

    context "Array" do
      it "returns an Array of Soundexs" do
        name_ary = %w(Robert Rupin Ashcroft Pfister)
        answers  = %w(R163 R150 A261 P236)

        expect(Dropmire::Soundex.soundex(name_ary)).to eql answers
      end
    end
  end

  describe "#build_code_for" do
    context "Robert" do
      it "returns R163" do
        expect(Dropmire::Soundex.build_code_for("Robert")).to eql 'R163'
      end
    end

    context "Rupert" do
      it "returns R163" do
        expect(Dropmire::Soundex.build_code_for("Rupert")).to eql 'R163'
      end
    end

    context "Rubin" do
      it "returns R150" do
        expect(Dropmire::Soundex.build_code_for("Rubin")).to eql 'R150'
      end
    end

    context "Ashcraft" do
      it "returns A261" do
        expect(Dropmire::Soundex.build_code_for("Ashcraft")).to eql 'A261'
      end
    end

    context "Ashcroft" do
      it "returns A261" do
        expect(Dropmire::Soundex.build_code_for("Ashcroft")).to eql 'A261'
      end
    end

    context "Tymczak" do
      it "returns T522" do
        expect(Dropmire::Soundex.build_code_for("Tymczak")).to eql 'T522'
      end
    end

    context "Pfister" do
      it "returns P236" do
        expect(Dropmire::Soundex.build_code_for("Pfister")).to eql 'P236'
      end
    end
  end

  describe "#get code" do
    context "when code is 1" do
      it "B" do
        expect(Dropmire::Soundex.get_code('B')).to eql '1'
      end

      it "F" do
        expect(Dropmire::Soundex.get_code('F')).to eql '1'
      end

      it "P" do
        expect(Dropmire::Soundex.get_code('P')).to eql '1'
      end

      it "V" do
        expect(Dropmire::Soundex.get_code('V')).to eql '1'
      end
    end

    context "when code is 2" do
      it "C" do
        expect(Dropmire::Soundex.get_code('C')).to eql '2'
      end

      it "G" do
        expect(Dropmire::Soundex.get_code('G')).to eql '2'
      end

      it "J" do
        expect(Dropmire::Soundex.get_code('J')).to eql '2'
      end

      it "K" do
        expect(Dropmire::Soundex.get_code('K')).to eql '2'
      end

      it "Q" do
        expect(Dropmire::Soundex.get_code('Q')).to eql '2'
      end

      it "S" do
        expect(Dropmire::Soundex.get_code('S')).to eql '2'
      end

      it "X" do
        expect(Dropmire::Soundex.get_code('X')).to eql '2'
      end

      it "Z" do
        expect(Dropmire::Soundex.get_code('Z')).to eql '2'
      end
    end

    context "when code is 3" do
      it "D" do
        expect(Dropmire::Soundex.get_code('D')).to eql '3'
      end

      it "T" do
        expect(Dropmire::Soundex.get_code('T')).to eql '3'
      end
    end

    context "when code is 4" do
      it "L" do
        expect(Dropmire::Soundex.get_code('L')).to eql '4'
      end
    end

    context "when code is 5" do
      it "M" do
        expect(Dropmire::Soundex.get_code('M')).to eql '5'
      end

      it "N" do
        expect(Dropmire::Soundex.get_code('N')).to eql '5'
      end
    end

    context "when code is 6" do
      it "R" do
        expect(Dropmire::Soundex.get_code('R')).to eql '6'
      end
    end
  end
end