require File.expand_path("../../../spec_helper", __FILE__)

class Sample; end;

describe Aidmock::Frameworks::RSpec do
  framework = Aidmock::Frameworks::RSpec

  context ".mocks" do
    context "caller class" do
      it "return the class object" do
        obj = Sample.new
        obj.stub(:some_method)

        framework.mocks[0].klass.should == Sample
      end
    end

    context "method name" do
      it "return the method name as a symbol" do
        obj = mock
        obj.stub(:some_method)

        framework.mocks[0].method.should == :some_method
      end
    end

		context "method result" do
      before :each do
        @obj = mock
      end

      it "return an blank array if no return is defined" do
        @obj.stub(:some_method)
        framework.should have_mock_result([])
      end

      it "return an array with the valid argument if one is passed" do
        @obj.stub(:some_method).and_return("one")
        framework.should have_mock_result(["one"])
      end

      it "return an array with all the returns in case of a multiple return" do
        @obj.stub(:some_method).and_return("one", "two", "three")
        framework.should have_mock_result(["one", "two", "three"])
      end

      it "return the value if it's used as a block" do
        @obj.stub(:some_method) { "value" }
        framework.should have_mock_result(["value"])
      end

      it "handles params for return" do
        @obj.stub(:some_method) { |param| "#{param.haha} messed up"}

        framework.should have_mock_result([" messed up"])
      end
		end

    context "method arguments" do
      it "return empty list if has no arguments"
      it "return a list of arguments if they exists"
    end
  end
end
