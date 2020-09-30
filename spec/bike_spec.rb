require 'bike'

describe Bike do
    it { is_expected.to respond_to :working? }

    describe '#report_broken' do
        it 'is changes working to false' do
            bike = Bike.new
            bike.report_broken
            expect(bike.working?).to eq false
        end 
    end 
end