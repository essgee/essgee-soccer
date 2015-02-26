require 'spec_helper'

module EssgeeSoccer
describe Data do
  include JsonImporter

  let(:data_dir)   { File.dirname(__FILE__) + "/../../support/data/" }
  let(:posts_data) { import_json(data_dir: data_dir + 'posts') }
  let(:json_data)  { import_json(data_dir: data_dir + 'json') }

  describe '#each' do
    it 'yields a collection' do
      data    = Data.new [1, 2, 3]
      yielded = []
      data.each { |i| yielded << i }

      expect(yielded).to eql [1,2,3]
    end
  end

  describe '#where' do
    it 'selects elements for a given parameter' do
      data     = Data.new posts_data
      selected = data.where(type: 'party')

      expect(selected.count).to eql 2
    end
  end

  describe '#order_by_date' do
    it 'sorts a data collection by date asc' do
      data         = Data.new json_data
      sorted_data  = data.order_by_date(:asc)
      sorted_dates = sorted_data.map { |e| e['date'] }

      expect(sorted_dates).to \
        eql [ "18 Mar 2015 08:00:00 AM",
              "18 Apr 2015 08:00:00 AM" ]
    end

    it 'sorts a data collection by date desc' do
      data         = Data.new json_data
      sorted_data  = data.order_by_date(:desc)
      sorted_dates = sorted_data.map { |e| e['date'] }

      expect(sorted_dates).to \
        eql [ "18 Apr 2015 08:00:00 AM",
              "18 Mar 2015 08:00:00 AM" ]
    end
  end

  describe 'method chaining' do
    it 'selects and orders data' do
      data         = Data.new posts_data
      data_final   = data.where(type: 'hackathon')
                         .order_by_date(:desc)
      sorted_dates = data_final.map { |e| e['date'] }

      expect(sorted_dates).to \
        eql [ "16 Aug 2015 08:00:00 AM",
              "18 Jul 2015 08:00:00 AM" ]
    end
  end

end
end
