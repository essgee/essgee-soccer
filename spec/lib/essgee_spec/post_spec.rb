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
    end

    describe '.where' do
      it 'returns posts for given attributes' do
        expect(Post.where(type: 'rave').count).to eql 3
      end
    end

  end
end
