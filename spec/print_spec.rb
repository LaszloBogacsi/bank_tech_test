require './lib/print'

describe Print do
  it 'has the account history by default' do
    print = Print.new(["history"])
    expect(print.history).to eq(["history"])
  end




end
