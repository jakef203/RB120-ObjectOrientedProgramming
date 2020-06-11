class BankAccount
  attr_accessor :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  # def withdraw(amount)
  #   if amount > 0
  #     success = (self.balance -= amount)
  #   else
  #     success = false
  #   end

  #   if success
  #     "$#{amount} withdrawn. Total balance is $#{balance}."
  #   else
  #     "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
  #   end
  # end

  def withdraw(amount)
    if amount <= 0 || amount > balance
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    else
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    end
  end

  # def balance=(new_balance)
  #   if valid_transaction?(new_balance)
  #     @balance = new_balance
  #     true
  #   else
  #     false
  #   end
  # end

  # def valid_transaction?(new_balance)
  #   new_balance >= 0
  # end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
p account.balance         # => 50

#In Ruby, setter methods always return the argument that was passed in, even when you add an explicit return statement. 
#Our balance= method will therefore always return its argument, irrespective of whether or not the instance variable @balance is re-assigned.
# Their solution

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && valid_transaction?(balance - amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
p account.balance 

