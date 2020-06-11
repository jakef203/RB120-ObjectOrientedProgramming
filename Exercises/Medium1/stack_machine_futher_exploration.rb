
require 'set'

CENTIGRADE_TO_FAHRENHEIT =
'5 PUSH DEGREES PUSH 9 MULT DIV PUSH 32 ADD PRINT'
FAHRENHEIT_TO_CENTIGRADE = 
'9 PUSH 5 PUSH 32 PUSH DEGREES SUB MULT DIV PRINT'


class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT DEGREES)

  def initialize(program)
    @program = program
  end

  def eval(degrees_c:)
    @stack = []
    @register = 0
    @program = @program.sub('DEGREES', degrees_c.to_s)
    @program.split.each { |token| eval_token(token) }
    rescue MinilangError => error
      puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end

minilang = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
# minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 212)
# 32
# minilang.eval(degrees_c: -40)
#

# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 100)).eval
# # 212
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 0)).eval
# # 32
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: -40)).eval