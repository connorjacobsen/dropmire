require 'spec_helper'

describe Dropmire::NameEncoder do

  subject { Dropmire::NameEncoder }

  describe "#encode" do
    context "William Andrew Fakename" do
      it "returns correct value" do
        expect(subject.encode("William", "Andrew")).to eql "921"
      end
    end

    context "Connor Alan Jacobsen" do
      it "returns correct value" do
        expect(subject.encode("Connor", "Alan")).to eql "101"
      end
    end
  end

  describe "#generate_fcode" do
    context "first name NotFound" do
      it "uses first initial" do
        expect(subject.generate_fcode("Connor")).to eql 100
      end
    end

    context "first name found" do
      it "returns correct value" do
        expect(subject.generate_fcode("Alice")).to eql 20
      end
    end
  end

  describe "#initial" do
    context "when not nil" do
      it "returns a single char" do
        expect(subject.initial('Connor').size).to eql 1
      end

      it "returns the correct char" do
        expect(subject.initial('Connor')).to eql 'c'
      end
    end

    context "when nil" do
      it "returns nil" do
        expect(subject.initial(nil)).to eql nil
      end
    end
  end

  describe "#first_names" do
    it "has class Hash" do
      expect(subject.first_names.class).to eql Hash
    end

    it "is not empty" do
      expect(subject.first_names.empty?).to eql false
    end

    describe "sanity check" do
      context "alice" do
        it "returns 20" do
          expect(subject.first_names["alice"]).to eql 20
        end
      end

      context "donald" do
        it "returns 180" do
          expect(subject.first_names["donald"]).to eql 180
        end
      end
    end
  end

  describe "#first_initials" do
    it "has class Hash" do
      expect(subject.first_initials.class).to eql Hash
    end

    it "is not empty" do
      expect(subject.first_initials.empty?).to eql false
    end

    describe "sanity check" do
      context "C" do
        it "returns 100" do
          expect(subject.first_initials["C"]).to eql 100
        end
      end

      context "J" do
        it "returns 420" do
          expect(subject.first_initials["J"]).to eql 420
        end
      end
    end
  end

  describe "#middle_initials" do
    it "has class Hash" do
      expect(subject.middle_initials.class).to eql Hash
    end

    it "is not empty" do
      expect(subject.middle_initials.empty?).to eql false
    end

    describe "sanity check" do
      context "C" do
        it "returns 3" do
          expect(subject.middle_initials["C"]).to eql 3
        end
      end

      context "J" do
        it "returns 10" do
          expect(subject.middle_initials["J"]).to eql 10
        end
      end
    end
  end

  describe "#find" do
    context "first_names" do
      context "when in YAML" do
        it "returns correct value" do
          expect(subject.find(:first_names, "donald")).to eql 180
        end
      end

      context "when not in YAML" do
        it "returns nil" do
          expect(subject.find(:first_names, "connor")).to eql nil
        end
      end
    end

    context "first_initials" do
      context "when in YAML" do
        it "returns correct value" do
          expect(subject.find(:first_initials, "A")).to eql 0
        end
      end

      context "when not in YAML" do
        it "returns nil" do
          expect(subject.find(:first_initials, "AB")).to eql nil
        end
      end
    end

    context "middle_initials" do
      context "when in YAML" do
        it "returns correct value" do
          expect(subject.find(:middle_initials, "A")).to eql 1
        end
      end

      context "when not in YAML" do
        it "returns nil" do
          expect(subject.find(:middle_initials, "AB")).to eql nil
        end
      end
    end
  end
end
