
task :default => [:test, :gen_doc]

#===============================================================================
desc "Run Unit Test"
task :test do
  ruby "./test/ts_suite.rb"
end

#===============================================================================
desc "Build Gem"
task :build_gem do
  `gem build st.gemspec`
  `mv *.gem pkg/`
end

#===============================================================================
desc "Generate HTML documentation with rdoc"
task :gen_doc do
  `yardoc lib/**/*.rb`  #-- build documentation
  `rm -rf .yardoc/`
end



