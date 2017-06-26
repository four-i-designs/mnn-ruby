
class TestUtils < Test::Unit::TestCase
  
  def log_banner()
    puts ""
    c_name = self.class.name.split('::').last.gsub("Test","")
    c_method = caller_locations(1,1)[0].label.gsub("test_","")
    banner = ""
    str = "Testing #{c_name}::#{c_method}"
    str.length.times { banner += "="}
    puts banner
    puts str
    puts banner
  end
  
  def log_result(result, msg)
    puts "#{result}: #{msg}"
  end
  
end
