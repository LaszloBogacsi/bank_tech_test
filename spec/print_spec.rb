require './lib/print'

describe Print do
  it 'can print a statement' do
    print = Print.new(["history"])
    expect(print).to respond_to(:print_statement)
  end




end
