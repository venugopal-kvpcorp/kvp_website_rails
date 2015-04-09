require 'spec_helper'

module Refinery
  module Qas
    describe Qa do
      describe "validations" do
        subject do
          FactoryGirl.create(:qa,
          :page_text => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:page_text) { should == "Refinery CMS" }
      end
    end
  end
end
