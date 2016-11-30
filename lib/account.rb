require './lib/print.rb'
class Account
  attr_reader :history, :balance
  def initialize
    @history = []
    @balance = 0
  end

  def transaction (amount)
    update_balance(amount)
      @history << [formatted_time, deposit?(amount), withdrawal?(amount), @balance]
  end

  def print_latest_statement
    statement = Print.new(@history)
    statement.print_statement
  end

  private

  def deposit? (amount)
    amount >= 0 ? amount : ""
  end

  def withdrawal? (amount)
    amount < 0 ? amount : ""
  end

  def update_balance(amount)
    @balance += amount
  end

  def formatted_time
    t = Time.new
    t.strftime("%D %T")
  end

end
