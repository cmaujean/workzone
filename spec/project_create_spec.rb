require 'spec_helper'

describe "thor project:create" do
  it "creates a directory for the new project in projects" do
    `thor project create test_project`
    File.exists?("#{WZ_PROJECT_DIR}/test_project").should be_true
  end
  
  after :each do
    `rm -rf #{WZ_PROJECT_DIR}/test_project` if File.exists? "#{WZ_PROJECT_DIR}/test_project"
  end
end
