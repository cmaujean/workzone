require 'thor/group'
require 'grit'

module Workzone
  module Tasks
    class Project < Thor::Group
      include Thor::Actions
      include Workzone::Constants

      argument :name, {
        :desc => "The name of your new project.",
        :type => :string,
        :required => true,
        :banner => "project_name"
      }
      
      class_option :no_git, {
        :desc => "Do not create a git repo in this directory",
        :required => false,
        :type => :boolean,
        :banner => "--no-git - Do not create a git repo in this project"
      }

      def create_project_dir
        empty_directory(project)
      end

      def create_gitignore_file
        unless options[:no_git]
          template("project/gitignore.tt", "#{project}/.gitignore")
        end
      end

      # this method should remain last (unless you want to leave some 
      # uncommitted files in the dir?)
      def init_git
        unless options[:no_git]
          # grit can't init a repo yet. hopefully this happens some day
          inside(project) do
            `git init`
            repo = Grit::Repo.new(project)
        
            repo.add(".")
            repo.commit_all("initial commit")
          end
        end
      end

      no_tasks do
        def project
            @project ||= "#{WZ_PROJECT_DIR}/#{name}"
            @project
        end
      end  

      def self.source_root
        File.expand_path(File.dirname(__FILE__) + "/..")
      end
    end
  end
end
