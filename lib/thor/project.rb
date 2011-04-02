class Project < Thor
  include Thor::Actions
  include Workzone
  
  desc "create", "Create a new project with git and an rvmrc"
  def create(name)
    Dir.mkdir("#{WZ_PROJECT_DIR}/#{name}")
  end
  
end
