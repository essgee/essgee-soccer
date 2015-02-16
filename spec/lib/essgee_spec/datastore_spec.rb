require 'spec_helper'

module EssgeeSoccer
  describe Datastore do
    let(:data_dir)  { File.dirname(__FILE__) + "/../../support/data/**/*.json" }
    let(:datastore) { Datastore.new(data_dir: data_dir) }
    let(:data)      { datastore.data }

    describe '.import_data' do
      it 'imports all posts' do
        expect(data.count).to be 9
      end
    end
  end
end
