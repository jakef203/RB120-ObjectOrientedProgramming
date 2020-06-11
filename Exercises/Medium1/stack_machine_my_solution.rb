
class Minilang 
  COMMAND_TO_FUNCTION = { 'PUSH' => :push_val, 'ADD' => :add_val, 'SUB' => :subtract_val, 'MULT' => :multiply_val, 
                         'DIV' => :divide_val, 'MOD' => :mod_val, 'POP' => :pop_val, 'PRINT' => :print_val }
  
  attr_accessor :register, :stack
  def initialize(command_string)
    @register = 0
    @stack = []
    @command_list = command_string.split 
  end

  def push_val
    @stack << @register 
  end 

  def add_val 
    # popped_val = @stack.pop 
    self.register += @stack.pop
  end

  def subtract_val 
    self.register -= @stack.pop 
  end 

  def multiply_val 
    self.register *= @stack.pop 
  end
  
  def divide_val 
    self.register /= @stack.pop 
  end 

  def mod_val 
    self.register %= @stack.pop
  end

  def pop_val
    if @stack.size == 0
      return "Empty stack!"
    else
      self.register = @stack.pop 
    end
  end

  def print_val 
    puts register 
  end

  def is_an_integer?(command)
    command == command.to_i.to_s
  end

  def eval 
    @command_list.each do |command|
      return_val = eval_single_command(command)
        if return_val.is_a?(String)
          puts return_val
          return nil
        end
    end
  end
      
  def eval_single_command(command)
    if is_an_integer?(command)
      self.register = command.to_i
    elsif COMMAND_TO_FUNCTION.key?(command)
      self.send(COMMAND_TO_FUNCTION[command])
    else 
      "Invalid token: #{command}"
    end
  end
end

          # case COMMAND_TO_FUNCTION
      # when 'PUSH' then push_val 
      # when 'ADD' then add_val
      # when 'SUB' then subtract_val 
      # when 'MULT' then multiply_val 
      # when 'DIV' then divide_val 
      # when 'MOD' then mod_val 
      # when 'POP' then pop_val 
      # when 'PRINT' then print_val 
      # else            "Invalid token: #{command}"
  
# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)


# lan = Minilang.new('3')
# lan.eval_single_command('3')
# puts lan.register
# p lan.stack
# lan.eval_single_command('PUSH')
# puts lan.register
# p lan.stack
# lan.eval_single_command('5')
# puts lan.register 
# p lan.stack
# lan.eval_single_command('ADD')
# puts lan.register
# p lan.stack
# lan.eval_single_command('PUSH')
# lan.eval_single_command('10')
# puts lan.register
# p lan.stack 

# puts lan.eval_single_command('PO')
# puts lan.register
# p lan.stack






# def func 
#   puts "hello"
# end

# h = { '1' => func }

# h['1']