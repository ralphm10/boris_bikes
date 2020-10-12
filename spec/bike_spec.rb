require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe '#report_broken' do
    it 'is changes working to false' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end
