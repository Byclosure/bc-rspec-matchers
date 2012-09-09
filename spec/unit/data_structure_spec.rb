require 'spec_helper'

require "bc-rspec-matchers/data_structure"

describe Bc::RSpec::Matchers::DataStructure do
  describe "created with nil" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new(nil)
  	end

  	it { should match_to(nil) }
  	it { should_not match_to("") }
  	it { should_not match_to({}) }
  	it { should_not match_to([]) }

  	its(:description) { should == "match to nil" }
  	
  	describe "after matches?(\"\")" do
  	  before { subject.matches?("") }
  	  
      its(:failure_message_for_should) { should == "expected DataStructure(nil) to match to \"\". Fragment nil didn't match to \"\"." }
  	end

    describe "after matches?(nil)" do
      before { subject.matches?(nil) }

      its(:failure_message_for_should_not) { should == "expected DataStructure(nil) not to match to nil" }
    end
  end

  describe "created with 'string'" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new("string")
  	end

  	it { should match_to("string") }
  	it { should_not match_to(:string) }
  	it { should_not match_to(nil) }

  	its(:description) { should == "match to \"string\"" }

    describe "after matches?(:symbol)" do
      before { subject.matches?(:symbol) }

      its(:failure_message_for_should) { should == "expected DataStructure(\"string\") to match to :symbol. Fragment \"string\" didn't match to :symbol." }
    end

    describe "after matches?(\"string\")" do
      before { subject.matches?("string") }

      its(:failure_message_for_should_not) { should == "expected DataStructure(\"string\") not to match to \"string\"" }
    end
  end

  describe "created with :symbol" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new(:symbol)
  	end

  	it { should match_to(:symbol) }
  	it { should_not match_to("symbol") }
  	it { should_not match_to(nil) }

  	its(:description) { should == "match to :symbol" }
  end

  describe "created with []" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new([])
  	end

  	it { should match_to([]) }
  	it { should_not match_to([nil]) }
  	it { should_not match_to(["every", :array]) }
  	it { should_not match_to(nil) }
  	it { should_not match_to({}) }

  	its(:description) { should == "match to []" }
  end

  describe "created with ['string']" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new(["string"])
  	end

  	it { should match_to(["string"]) }
  	it { should_not match_to([:symbol, "string"]) }
  	it { should_not match_to(["string", :symbol]) }
  	it { should_not match_to([:string]) }
  	it { should_not match_to("string") }
  	it { should_not match_to(nil) }
  	it { should_not match_to([]) }
  	it { should_not match_to({}) }

  	its(:description) { should == "match to [\"string\"]" }
  end

  describe "created with {}" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new({})
  	end

  	it { should match_to({}) }
  	it { should match_to({:every => "hash"}) }
  	it { should_not match_to([]) }
  	it { should_not match_to(nil) }
  end
end