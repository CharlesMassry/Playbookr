class FileBuilder
  def self.new(file)
    file ||= NullFile.new
    if file.content_type =~ /\Aimage\/.*\Z/
      Image.new(file: file)
    elsif file.content_type =~ /\Avideo\/.*\Z/
      Video.new(file: file)
    end
  end
end
