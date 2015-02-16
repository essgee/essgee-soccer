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
      all_data += JSON.parse File.read(json_file)
    end

    all_data
  end
end
end
