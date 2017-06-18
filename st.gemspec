spec = Gem::Specification.new do |s|
  s.name = 'mnn-ruby'
  s.version = '0.0.1'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README', 'LICENSE']
  s.summary = 'MNN Ruby Prototype'
  s.description = 'Ruby prototype for implementing Mesh Neural Networks'
  s.author = 'Steven M. Lyles'
  s.email = 'steven.lyles@gmail.com'
  s.homepage = 'http://www.stevenlyles.net'
  # s.executables = ['your_executable_here']
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{bin,lib,spec}/**/*")
  s.require_path = "lib"
  s.bindir = "bin"
  s.license = "GPL-3.0"
end
