
# Part 1
# class Book
#   attr_reader :author, :title  ## This line was added as solution
  
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   # def title  ## These are what line 4 does above
#   #   @title
#   # end
  
#   # def author
#   #   @author
#   # end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# Part 2

class Book
  attr_accessor :title, :author  ## This line was added as solution
  
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)