require 'rubygems'
require 'bundler/setup'
require 'test/unit/assertions'



describe "file" do
  include Test::Unit::Assertions
  
  FILE_NAME = "myfile.txt"  
  
  before(:each) do
    reset_system
  end
  
  context "when doesn't exist" do
    before(:each) do
      assert file_doesnt_exist?
    end
    
    it "should create a file and have content 'hello world'" do
      write_string_to_file "hello world"

      assert file_exists?

      assert_equal "hello world", file_contents
    end
    
    it "should create a file and have content 'goodbye world'" do
      write_string_to_file "goodbye world"

      assert file_exists?

      assert_equal "goodbye world", file_contents
    end
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
    File.open("myfile.txt", "r") {|f| f.read }
  end  
end