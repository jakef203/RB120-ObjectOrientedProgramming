class File
  attr_accessor :name, :byte_content, :format

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md

  # def format # Can do this or change to <self.class::FORMAT> on line 20 above
  #   FORMAT 
  # end
  # When Ruby resolves a constant, it looks it up in its lexical scope, in this case in the File class as well as in all of its ancestor classes. 
  # Since it doesn't find it in any of them, it throws a NameError.

  # Or you can use a <format> method in each subclass instead of a CONSTANT
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
# blog_post.write('Content will be added soon!'.bytes)
blog_post.write("Content will be added soon!".bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true
puts blog_post
puts blog_post.read
puts ""
puts copy_of_blog_post
puts copy_of_blog_post.read

