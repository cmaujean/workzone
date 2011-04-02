class Project < Thor::Group
  include Thor::Actions
  include Workzone
  
  argument :name, {
    :desc => "The name of your new project.",
    :type => :string,
    :required => true,
    :banner => "project_name"
  }


  def create_project_dir
    empty_directory(project)
  end

  def create_gitignore_file
    template("project/gitignore.tt", "#{project}/.gitignore")
  end

  no_tasks do
    def project
        @project ||= "#{WZ_PROJECT_DIR}/#{name}"
        @project
    end
  end  

  def self.source_root
    File.expand_path(File.dirname(__FILE__))
  end
end
