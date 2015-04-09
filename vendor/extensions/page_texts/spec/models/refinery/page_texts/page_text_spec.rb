require 'spec_helper'

module Refinery
  module PageTexts
    describe PageText do
      describe "validations" do
        subject do
          FactoryGirl.create(:page_text,
          :key => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:key) { should == "Refinery CMS" }
      end
    end
  end
end
