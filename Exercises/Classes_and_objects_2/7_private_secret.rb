
class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret

end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret


# person1.secret  ## Can't call private method secret from outside the class!