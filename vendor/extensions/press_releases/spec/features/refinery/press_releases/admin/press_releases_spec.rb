# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PressReleases" do
    describe "Admin" do
      describe "press_releases" do
        refinery_login_with :refinery_user

        describe "press_releases list" do
          before do
            FactoryGirl.create(:press_release, :title => "UniqueTitleOne")
            FactoryGirl.create(:press_release, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.press_releases_admin_press_releases_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.press_releases_admin_press_releases_path

            click_link "Add New Press Release"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PressReleases::PressRelease.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::PressReleases::PressRelease.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:press_release, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.press_releases_admin_press_releases_path

              click_link "Add New Press Release"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PressReleases::PressRelease.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:press_release, :title => "A title") }

          it "should succeed" do
            visit refinery.press_releases_admin_press_releases_path

            within ".actions" do
              click_link "Edit this press release"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:press_release, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.press_releases_admin_press_releases_path

            click_link "Remove this press release forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PressReleases::PressRelease.count.should == 0
          end
        end

      end
    end
  end
end
