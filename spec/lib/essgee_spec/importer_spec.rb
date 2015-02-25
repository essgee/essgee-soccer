require 'spec_helper'

module EssgeeSoccer
describe JsonImporter do
  let(:test_class) { Class.new { extend JsonImporter } }
  let(:data_dir)   { File.dirname(__FILE__) + "/../../support/data/" }

  describe 'import_json' do
    it 'returns an array' do
      array = test_class.import_json(data_dir: data_dir + 'posts')
      expect(array).to be_an Array
    end

    it 'aggregates json objects into a single array' do
      array = test_class.import_json(data_dir: data_dir + 'posts')
      expect(array.count).to eql 6
    end

    it 'parses json files' do
      array = test_class.import_json(data_dir: data_dir + 'json')
      expect(array.first).to \
        include({ "date"       => "18 Apr 2015 08:00:00 AM",
                  "title"      => "Cafe Bedouins",
                  "copy"       => "7:00pm Hounds Tooth",
                  "created_at" => "2/15/2015",
                  "updated_at" => "2/15/2015",
                  "tags"       => [ "featured", "hipsters" ] })
    end

    it 'adds a type entry named from the singular of the filename' do
      array = test_class.import_json(data_dir: data_dir + 'json')
      expect(array.first).to include({ "type" => "object" })
    end

  end

end
end
