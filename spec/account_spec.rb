require './lib/account'

describe Account do

  it 'has an empty account history when opened' do
    account = Account.new
    expect(account.history).to eq([])
  end

  it 'has a balance of 0' do
    account = Account.new
    expect(account.balance).to eq(0)
  end
 context 'once opened' do
   before do
     @account = Account.new
   end

   context 'transactions' do

     it 'client can make a transaction' do
       @account.transaction(1000)
       expect(@account.history.length).to eq(1)
     end

     it 'the date gets registered' do
       @account.transaction(1000)
       expect(@account.history[0][0]).to be_instance_of(Time)
     end

     it 'the current_balance gets registered' do
       @account.transaction(1000)
       expect(@account.history[0][2]).to eq(1000)
     end
     it 'deposit' do
       @account.transaction(1000)
       expect(@account.balance).to eq(1000)
     end
     it 'withdrawal' do
       @account.transaction(1000)
       @account.transaction(-100)
       expect(@account.balance).to eq(900)
     end


   end
   context 'able to print statent' do
     it '#print statement' do
       expect(@account).to respond_to(:print_statement)
     end
   end
 end
end
