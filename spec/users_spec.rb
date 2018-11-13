require 'users'

mock_users = JSON.parse(File.read('./spec/data/users.json'))['data']
mock_purchases = JSON.parse(File.read('./spec/data/purchases.json'))['data']

describe Users do

  let(:subject) { described_class.new(api) }
  let(:api) { double :api }

  describe '#total_spend' do

    before do
      allow(api).to receive(:fetch_data).with('users').and_return(mock_users)
      allow(api).to receive(:fetch_data).with('purchases').and_return(mock_purchases)
    end

    it 'calls total_spend' do
      allow(subject).to receive(:total_spend).with('schimmel_quincy@ernser.io')
      subject.total_spend('schimmel_quincy@ernser.io')
    end

    it 'retrieves the total spend for a given email' do
      expect(subject.total_spend('schimmel_quincy@ernser.io')).to eq(245.01)
    end
  end
end
