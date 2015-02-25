require 'active_support/core_ext/string/inflections'

module EssgeeSoccer
module JsonImporter

  def import_json(data_dir:)
    data = []
    files(data_dir: data_dir).each do |file|
      json_array(file: file).each do |hash|
        hash['type'] = type(file: file)
        data << hash
      end
    end
    data
  end

  private

  def files(data_dir:)
    Dir["#{data_dir}/**/*.json"]
  end

  def json_array(file:)
    JSON.parse(File.read(file))
  end

  def type(file:)
    File.basename(file, '.json').singularize
  end

end
end
