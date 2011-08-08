require 'test/unit/assertions'

class FileTester
  include Test::Unit::Assertions

  def run_tests
    File.delete("myfile.txt") if File.exists?("myfile.txt")
    
    assert !File.exists?("myfile.txt")
    
    File.open("myfile.txt", "w") {|f| f.write("hello world") }

    assert File.exists?("myfile.txt")

    value = File.open("myfile.txt", "r") {|f| f.read }

    assert_equal "hello world", value
  end
end

FileTester.new.run_tests
