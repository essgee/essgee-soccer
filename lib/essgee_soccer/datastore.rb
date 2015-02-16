require 'active_support/core_ext/string/inflections'

module EssgeeSoccer
class  Datastore

  attr_reader :data_dir, :data

  def initialize(data_dir:)
    @data_dir   = data_dir
    @data     ||= import_data(data_dir)
  end

  def import_data(data_dir)
    json_files = Dir[data_dir]

    all_data = []
    json_files.each do |json_file|
      json_objects = JSON.parse File.read(json_file)
      json_objects.each do |json_object|
        json_object['type'] = type(json_file)
        all_data << json_object
      end
    end

    all_data
  end

  private

  def type(json_file)
    file_base_name = File.basename(json_file, '.json')
    file_base_name == 'raves' ? 'rave' : file_base_name.singularize
  end
end
end
