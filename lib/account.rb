require './lib/print.rb'
class Account
  attr_reader :history, :balance
  def initialize
    @history = []
    @balance = 0
  end

  def transaction (amount)
    @balance += amount
    current_balance = @balance
    t = Time.new
    formatted_time = t.strftime("%D %T")
    if amount >= 0
      @history << [formatted_time, amount, "", current_balance]
    else
      @history << [formatted_time, "", amount, current_balance]
    end
  end

  def print_statement
    statement = Print.new(@history)
    statement.pretty_print

  end


end
