require 'spec_helper'

PROJECT = "#{WZ_PROJECT_DIR}/test_project"

describe "thor tasks" do
  describe "task: project test_project" do
    before :each do
      `thor project test_project`
    end

    it "creates a directory for the new project in projects" do
      Dir.exists?(PROJECT).should be_true
    end

    describe ".gitignore" do
      it "creates a .gitignore file" do
        File.exists?("#{PROJECT}/.gitignore").should be_true
      end

      it "fills the .gitignore file" do
        File.open("#{PROJECT}/.gitignore").readline.strip.should =~ /\\#*/
      end
    end

    after :each do
      `rm -rf #{WZ_PROJECT_DIR}/test_project` if File.exists? "#{WZ_PROJECT_DIR}/test_project"
    end
  end
end
