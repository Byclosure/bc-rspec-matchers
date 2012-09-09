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
  end

  describe "created with 'string'" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new("string")
  	end

  	it { should match_to("string") }
  	it { should_not match_to(:string) }
  	it { should_not match_to(nil) }
  end

  describe "created with :symbol" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new(:symbol)
  	end

  	it { should match_to(:symbol) }
  	it { should_not match_to("symbol") }
  	it { should_not match_to(nil) }
  end

  describe "created with []" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new([])
  	end

  	it { should match_to([]) }
  	it { should match_to([nil]) }
  	it { should match_to(["string", :symbol]) }
  	it { should_not match_to(nil) }
  	it { should_not match_to({}) }
  end

  describe "created with ['string']" do
  	subject do
  	  Bc::RSpec::Matchers::DataStructure.new(["string"])
  	end

  	it { should match_to(["string"]) }
  	it { should match_to([:symbol, "string"]) }
  	it { should match_to(["string", :symbol]) }
  	it { should_not match_to([:string]) }
  	it { should_not match_to("string") }
  	it { should_not match_to(nil) }
  	it { should_not match_to([]) }
  	it { should_not match_to({}) }
  end

  describe "created with "
end