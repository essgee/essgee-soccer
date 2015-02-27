require 'spec_helper'

module EssgeeSoccer
describe Post do
  include JsonImporter

  let(:test_data_dir)   { File.dirname(__FILE__) + "/../../support/data/" }
  let(:test_posts_dir)  { test_data_dir + 'posts' }
  let(:test_json_dir)   { test_data_dir + 'json' }

  let(:test_posts_data) { Data.new import_json(data_dir: test_posts_dir) }
  let(:test_json_data)  { Data.new import_json(data_dir: test_json_dir) }

  let(:prod_posts_dir)  { Post::POST_DATA_DIR }


  describe '.import_data' do
    it 'imports post data' do
      data = Post.import_data(data_dir: test_posts_dir)

      expect(data.count).to eql 6
    end
  end

  describe '.data' do
    it 'returns post data' do
      expect(Post).to receive(:import_data).with(data_dir: prod_posts_dir)

      Post.data
    end
  end

  describe '.all' do
    it 'returns post data' do
      expect(Post).to receive(:data).and_return(test_posts_data)
      data = Post.all

      expect(data.count).to eql 6
    end
  end

  describe '.where' do
    it 'returns post data with a specific attribute value' do
      expect(Post).to receive(:data).and_return(test_posts_data)
      data = Post.where(type: 'hackathon')

      expect(data.count).to eql 2
    end
  end

  describe '.order_by_date' do
    it 'returns post data sorted by date ascending' do
      expect(Post).to receive(:data).and_return(test_json_data)
      sorted_data  = Post.order_by_date(:asc)
      sorted_dates = sorted_data.map { |e| e['date'] }

      expect(sorted_dates).to \
        eql [ "18 Mar 2015 08:00:00 AM",
              "18 Apr 2015 08:00:00 AM"]
    end

    it 'returns post data sorted by date descending' do
      expect(Post).to receive(:data).and_return(test_json_data)
      sorted_data  = Post.order_by_date(:desc)
      sorted_dates = sorted_data.map { |e| e['date'] }

      expect(sorted_dates).to \
        eql [ "18 Apr 2015 08:00:00 AM",
              "18 Mar 2015 08:00:00 AM" ]
    end
  end

end
end
