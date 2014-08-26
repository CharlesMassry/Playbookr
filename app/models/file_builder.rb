class FileBuilder
  def initialize(file)
    @file = file || NullFile.new
  end

  def build
    if file.content_type =~ /\Aimage\/.*\Z/
      Image.new(file: file)
    elsif file.content_type =~ /\Avideo\/.*\Z/
      Video.new(file: file)
    end
  end

  private
  attr_reader :file
end
