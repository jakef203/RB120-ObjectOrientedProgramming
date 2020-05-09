
# class SecretFile
#   attr_reader :data, :logged_info

#   def initialize(secret_data)
#     @data = secret_data
#     @logged_info = SecurityLogger.new
#   end
# end

# class SecurityLogger
#   attr_reader :time, :filesize
#   def create_log_entry(filesize)
#     @time = Time.now
#     @filesize = filesize 
#   end
# end

# file = SecretFile.new('secrets')
# p file
# p file.instance_variables
# file.logged_info.create_log_entry(20)
# p file.logged_info.filesize
# p file.logged_info.time
# p file.logged_info.instance_variables

class SecretFile
  attr_reader :logger

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  attr_reader :time, :log_count
  def initialize
    @log_count = 0
  end
  def create_log_entry
    @time = Time.now
    @log_count += 1
  end
end

file = SecretFile.new('TOPSECRET', SecurityLogger.new)
p file.instance_variables
p file.logger
p file.data
p file.logger.time 
p file.logger.log_count
p file.data
p file.logger.time 
p file.logger.log_count