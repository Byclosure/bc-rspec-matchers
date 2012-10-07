require 'spec_helper'

require "bc-rspec-matchers/content_type"

describe Bc::RSpec::Matchers::ContentType do
  shared_examples_for "format" do |format, options|
    it { should match_to("Content-Type" => "application/#{format}; charset=utf-8") }
    it { should match_to("Content-Type" => "application/#{format};charset=utf-8") }
    
    wrong_formats = options && options[:wrong_formats]
    wrong_formats && wrong_formats.each do |wrong_format|
      it { should_not match_to("Content-Type" => "application/#{wrong_format}; charset=utlf-8") }
    end
  end
  
  describe "created with :json" do
    subject do
      Bc::RSpec::Matchers::ContentType.new(:json)
    end
    it_should_behave_like "format", "json", :wrong_formats => ["xml"]
  end
  
  describe "created with 'json'" do
    subject do
      Bc::RSpec::Matchers::ContentType.new('json')
    end
    it_should_behave_like "format", "json", :wrong_formats => ["xml"]
  end
end