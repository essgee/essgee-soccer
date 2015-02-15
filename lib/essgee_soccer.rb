require 'json'
require 'essgee_soccer/post'

module EssgeeSoccer

  def self.data
    @all_data || import_data
  end

  def self.import_data(data_dir)
    json_files = Dir[data_dir]

    all_data = []
    json_files.each do |json_file|
      all_data += JSON.parse File.read(json_file)
    end

    all_data
  end
end
