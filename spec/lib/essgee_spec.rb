require 'spec_helper'

describe EssgeeSoccer do
  describe '.import_posts' do
    it 'imports posts' do
      data = EssgeeSoccer.data
      expect(data.count).to eql 9
    end
  end
end
