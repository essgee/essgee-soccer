require 'spec_helper'

module EssgeeSoccer
describe Post do
  include JsonImporter

  let(:test_posts_dir)  { File.dirname(__FILE__) + "/../../support/data/posts" }
  let(:prod_posts_dir)  { Post::POST_DATA_DIR }
  let(:test_posts_data) { import_json(data_dir: test_posts_dir) }

  describe '.import_data' do
    it 'imports post data' do
      data = Post.import_data(data_dir: test_posts_dir)

      expect(data.count).to eql 6
    end
  end

  describe '.data' do
    it 'returns post data' do
      expect(Post).to receive(:import_data).with(prod_posts_dir)

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

end
end
