require 'rubygems'
require 'bundler/setup'

describe "file" do
  
  FILE_NAME = "myfile.txt"  
  
  before(:each) do
    reset_system
  end
  
  context "when doesn't exist" do
    before(:each) do
     File.should_not exist(FILE_NAME)
    end
    
    it "should create a file and have content 'hello world'" do
      write_string_to_file "hello world"

      File.should exist(FILE_NAME)

      file_contents.should == "hello world"
    end
    
    it "should create a file and have content 'goodbye world'" do
      write_string_to_file "goodbye world"

      File.should exist(FILE_NAME)

      file_contents.should == "goodbye world"
    end
  end
  
private

  def reset_system
    File.delete(FILE_NAME) if File.exists?(FILE_NAME)
  end
  
  def write_string_to_file(string)
    File.open(FILE_NAME, "w") {|f| f.write(string) }
  end
  
  def file_contents
    File.open("myfile.txt", "r") {|f| f.read }
  end  
end