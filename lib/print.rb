class Print

  def initialize(history)
    @history = history
    @header = ['date', 'credit', 'debit', 'balance' ]
    @col_width = {
      first_col: 18,
      rest_cols: 7,
    }
    @col_divider = " || "
  end

  def print_statement
    latest_first = @history.reverse
    pretty_print(@header, latest_first)
  end
### === PRIVATE === ###
  private

  def pretty_print (header, body)
    print_statement_header(header)
    print_statement_body(body)
  end

  def print_statement_header (header_arr)
    header_arr.each_with_index do |header, index|
      first_col?(index) ? print_header_1st_col(header) : print_header_cols(header)
    end
    puts
  end

  def print_statement_body (body_arr)
    body_arr.each_with_index do |transaction|
      transaction.each_with_index do |data_item, index|
        first_col?(index) ? print_body_1st_col(data_item) : print_body_cols(data_item)
      end
      puts
    end
  end

  # printing header elements

  def print_header_1st_col (header)
    print header.ljust(@col_width[:first_col])
  end

  def print_header_cols (header)
    print @col_divider, header.ljust(@col_width[:rest_cols])
  end

  # printing body elements

  def print_body_1st_col (data_item)
    print data_item.ljust(@col_width[:first_col])
  end

  def print_body_cols (data_item)
    empty_cell?(data_item) ? print_body_empty_cell(data_item) : print_body_full_cell(data_item)
  end

  def print_body_empty_cell (data_item)
    print @col_divider, data_item.ljust(@col_width[:rest_cols])
  end

  def print_body_full_cell (data_item)
    print @col_divider, format_currency(data_item).ljust(@col_width[:rest_cols])
  end

  # print helpers

  def first_col? (index)
    index == 0
  end

  def empty_cell? (cell_data)
    cell_data == ""
  end

  def format_currency (amount)
    sprintf('%.2f', amount)
  end
end
