require 'test/unit'

class HomepageTest < Test::Unit::TestCase
  
  def setup
    File.delete("myfile.txt") if File.exists?("myfile.txt")
  end
  
  def test_writing_file
    assert !File.exists?("myfile.txt")
    
    File.open("myfile.txt", "w") {|f| f.write("hello world") }

    assert File.exists?("myfile.txt")

    value = File.open("myfile.txt", "r") {|f| f.read }

    assert_equal "hello world", value
  end
end