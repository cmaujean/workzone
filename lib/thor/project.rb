class Project < Thor
  include Thor::Actions

  desc "works", "Thor works?"
  def works
    puts "Thor Works!"
  end
end
