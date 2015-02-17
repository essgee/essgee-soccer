require 'spec_helper'

describe Array do
  let(:data_dir)    { File.dirname(__FILE__) + "/../../support/data/**/*.json" }
  let(:dates_desc)  { [  "18 Apr 2015 08:00:00 AM",
                         "25 Mar 2015 1:00:00 PM",
                         "18 Mar 2015 04:05:06 PM",

                         "16 Mar 2015 08:00:00 AM",
                         "28 Feb 2015 1:00:00 PM",
                         "18 Feb 2015 04:05:06 PM", ] }
  let(:dates_asc)    { dates_desc.reverse }

  before(:each) do
    EssgeeSoccer::Post.data_dir = data_dir
  end

  describe '#includes' do
    context 'tag value class is String' do
      it 'returns only posts that have a tag' do
        expect(EssgeeSoccer::Post.all.includes(tag: 'featured').count).to eql 3
      end
    end

    context 'tag value class is Array' do
      it 'returns only posts that have all the tags' do
        expect(EssgeeSoccer::Post.all.includes(tags: %w[featured hipsters]).count).to eql 1
      end
    end

  end

  describe '#order' do
    it 'returns an array sorted by date descending' do
      json_objects = EssgeeSoccer::Post.all.order(date: :desc)
      dates        = json_objects.map { |json_object| json_object['date'] }
      expect(dates).to eql dates_desc
    end

    it 'returns an array sorted by date ascending' do
      json_objects = EssgeeSoccer::Post.all.order(date: :asc)
      dates        = json_objects.map { |json_object| json_object['date'] }
      expect(dates).to eql dates_asc
    end
  end

  describe '#where' do
    it 'returns an array where the element["attr"] = value' do
      expect(EssgeeSoccer::Post.all.where(type: 'rave').count).to eql 2
    end
  end

end