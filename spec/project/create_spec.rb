require 'spec_helper'
require 'grit'

PROJECT = "#{WZ_PROJECT_DIR}/test_project"

describe "project" do
  describe "task: project test_project" do

    it "creates a directory for the new project in projects" do
      init_project
      Dir.exists?(PROJECT).should be_true
    end

    describe "git" do

      describe "default" do
        it "initializes a git repository" do
          init_project
          head = ""
          expect { 
            repo = Grit::Repo.new(PROJECT) 
            head = repo.commits.first
            }.to_not raise_error
          head.message.should == "initial commit"
        end
      end
      
      describe "with --no-git" do
        it "does not initialize a git repository" do
          init_project("--no-git")
          expect {
            repo = Grit::Repo.new(PROJECT)
          }.to raise_error(Grit::InvalidGitRepositoryError)
        end
      end
      
      describe ".gitignore" do
        it "creates a .gitignore file" do
          init_project
          File.exists?("#{PROJECT}/.gitignore").should be_true
        end

        it "fills the .gitignore file" do
          init_project
          File.open("#{PROJECT}/.gitignore").readline.strip.should =~ /\\#*/
        end
        
        describe "with --no-git" do
          it "does not create a .gitignore file" do
            init_project("--no-git")
            File.exists?("#{PROJECT}/.gitignore").should be_false
          end
        end
      end
    end

    after :each do
      `rm -rf #{PROJECT}` if Dir.exists? "#{PROJECT}"
    end
  end
end
