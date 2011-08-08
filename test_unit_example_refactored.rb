require 'test/unit'

class HomepageTest < Test::Unit::TestCase
  FILE_NAME = "myfile.txt"
  
  def setup
    reset_system
  end
  
  def test_writing_file
    assert file_doesnt_exist?
    
    write_string_to_file "hello world"

    assert file_exists?
    
    assert_equal "hello world", file_contents
  end

private

  def reset_system
    File.delete(FILE_NAME) if File.exists?(FILE_NAME)
  end
  
  def file_exists?
    File.exists?(FILE_NAME)
  end
  
  def file_doesnt_exist?
    !file_exists?
  end
  
  def write_string_to_file(string)
    File.open(FILE_NAME, "w") {|f| f.write(string) }
  end
  
  def file_contents
    File.open(FILE_NAME, "r") {|f| f.read }
  end
end