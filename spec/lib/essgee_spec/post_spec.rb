require 'spec_helper'

module EssgeeSoccer
  describe Post do
    let(:data_dir) { File.dirname(__FILE__) + "/../../support/data/**/*.json" }

    before(:each) do
      Post.data_dir = data_dir
    end

    describe '.all' do
      it 'returns all posts' do
        expect(Post.all.count).to eql 9
      end

      it 'orders the posts by descending date' do
        dates = Post.all.map { |post| post['date'] }
        expect(dates).to eql [
                                "18 Apr 2015 08:00:00 AM",
                                "25 Mar 2015 1:00:00 PM",
                                "18 Mar 2015 04:05:06 PM",

                                "16 Mar 2015 08:00:00 AM",
                                "28 Feb 2015 1:00:00 PM",
                                "18 Feb 2015 04:05:06 PM",

                                "16 Feb 2015 08:00:00 AM",
                                "28 Jan 2015 1:00:00 PM",
                                "16 Jan 2015 04:05:06 PM",
                              ]
      end
    end

    describe '.where' do
      it 'returns posts for given attributes' do
        expect(Post.where(type: 'rave').count).to eql 3
      end
    end

  end
end
