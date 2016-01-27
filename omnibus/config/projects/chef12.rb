# This is a clone of the Chef project that we can install on the Chef build and
# test machines. As such this project definition is just a thin wrapper around
# `config/project/chef.rb`.
#
chef_project_contents = IO.read(File.expand_path("../chef.rb", __FILE__))
self.instance_eval chef_project_contents

name "chef12"
friendly_name "Special chef12 build"

if windows?
  # NOTE: Ruby DevKit fundamentally CANNOT be installed into "Program Files"
  #       Native gems will use gcc which will barf on files with spaces,
  #       which is only fixable if everyone in the world fixes their Makefiles
  install_dir "#{default_root}/opscode/#{name}"
  package_name "chef12"
else
  install_dir "#{default_root}/#{name}"
end

resources_path "#{resources_path}/../chef"

msi_upgrade_code = "D7FDDC1A-7668-404E-AD2F-61F875632A9C"
project_location_dir = "chef12"
