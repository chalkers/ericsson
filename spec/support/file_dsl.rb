module FileDsl
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