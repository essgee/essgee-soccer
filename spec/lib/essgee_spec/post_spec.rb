require 'spec_helper'

module EssgeeSoccer
  describe Post do
    let(:data_dir)    { File.dirname(__FILE__) + "/../../support/data/**/*.json" }
    let(:dates_desc)  { [ "18 Apr 2015 08:00:00 AM",
                          "25 Mar 2015 1:00:00 PM",
                          "18 Mar 2015 04:05:06 PM",

                          "16 Mar 2015 08:00:00 AM",
                          "28 Feb 2015 1:00:00 PM",
                          "18 Feb 2015 04:05:06 PM", ] }
    let(:dates_asc)    { dates_desc.reverse }

    before(:each) do
      Post.data_dir = data_dir
    end

    describe '.all' do
      it 'returns all posts' do
        expect(Post.all.count).to eql 6
      end
    end

    describe '.includes' do
      it 'returns post if it includes a given tag' do
        expect(Post.includes(tag: 'featured').count).to eql 3
      end
    end

    describe '.order' do
      it 'orders posts by descending date' do
        dates = Post.order(date: :desc).map { |post| post['date'] }
        expect(dates).to eql dates_desc
      end

      it 'orders posts by ascending date' do
        dates = Post.order(date: :asc).map { |post| post['date'] }
        expect(dates).to eql dates_asc
      end
    end

    describe '.where' do
      it 'returns posts for given attributes' do
        expect(Post.where(type: 'rave').count).to eql 2
      end
    end
  end
end
