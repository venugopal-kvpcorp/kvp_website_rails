# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PageTexts" do
    describe "Admin" do
      describe "page_texts" do
        refinery_login_with :refinery_user

        describe "page_texts list" do
          before do
            FactoryGirl.create(:page_text, :key => "UniqueTitleOne")
            FactoryGirl.create(:page_text, :key => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.page_texts_admin_page_texts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.page_texts_admin_page_texts_path

            click_link "Add New Page Text"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Key", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PageTexts::PageText.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Key can't be blank")
              Refinery::PageTexts::PageText.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:page_text, :key => "UniqueTitle") }

            it "should fail" do
              visit refinery.page_texts_admin_page_texts_path

              click_link "Add New Page Text"

              fill_in "Key", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PageTexts::PageText.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:page_text, :key => "A key") }

          it "should succeed" do
            visit refinery.page_texts_admin_page_texts_path

            within ".actions" do
              click_link "Edit this page text"
            end

            fill_in "Key", :with => "A different key"
            click_button "Save"

            page.should have_content("'A different key' was successfully updated.")
            page.should have_no_content("A key")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:page_text, :key => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.page_texts_admin_page_texts_path

            click_link "Remove this page text forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PageTexts::PageText.count.should == 0
          end
        end

      end
    end
  end
end
