# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Qas" do
    describe "Admin" do
      describe "qas" do
        refinery_login_with :refinery_user

        describe "qas list" do
          before do
            FactoryGirl.create(:qa, :page_text => "UniqueTitleOne")
            FactoryGirl.create(:qa, :page_text => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.qas_admin_qas_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.qas_admin_qas_path

            click_link "Add New Qa"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Page Text", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Qas::Qa.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Page Text can't be blank")
              Refinery::Qas::Qa.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:qa, :page_text => "UniqueTitle") }

            it "should fail" do
              visit refinery.qas_admin_qas_path

              click_link "Add New Qa"

              fill_in "Page Text", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Qas::Qa.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:qa, :page_text => "A page_text") }

          it "should succeed" do
            visit refinery.qas_admin_qas_path

            within ".actions" do
              click_link "Edit this qa"
            end

            fill_in "Page Text", :with => "A different page_text"
            click_button "Save"

            page.should have_content("'A different page_text' was successfully updated.")
            page.should have_no_content("A page_text")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:qa, :page_text => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.qas_admin_qas_path

            click_link "Remove this qa forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Qas::Qa.count.should == 0
          end
        end

      end
    end
  end
end
