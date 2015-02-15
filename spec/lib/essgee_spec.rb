require 'spec_helper'

describe EssgeeSoccer do
  let(:data_dir) { File.dirname(__FILE__) + "/../support/data/**/*.json" }
  let(:data)     { EssgeeSoccer.import_data(data_dir) }

  describe '.import_data' do
    it 'imports all posts' do
      expect(data.count).to eql 3
    end
  end
end
