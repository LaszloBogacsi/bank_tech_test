class Print
  attr_reader :history

  def initialize(history)
    @history = history
  end


  # def printer_friendly(statement)
  #   statement.each do |transaction|
  #     transaction.map! do |details|
  #       details.to_s
  #     end
  #   end
  # end


  def pretty_print
    header = [['date', 'credit', 'debit', 'balance' ]]
    history_with_headers = header + @history.reverse
    history_with_headers.each_with_index do |transaction, index|
      if index == 0
        transaction.each_with_index do |header, index|
          if index == 0
            print header.ljust(20), " || "
          else
            print header.ljust(10), " || "
          end
        end
        puts
      else
        transaction.each_with_index do |detail, index|
          if index == 0
            print detail.ljust(20), " || "
          elsif detail == ""
            print "".ljust(10), " || "
          else
            dp_string = sprintf('%.2f', detail)
            print dp_string.ljust(10), " || "
          end
        end
        puts
      end
    end

  end
end
