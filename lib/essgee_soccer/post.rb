module EssgeeSoccer
module Post
  extend JsonImporter

  POST_DATA_DIR = File.dirname(__FILE__) + "/../../data/posts"

  def self.all
    Post.data
  end

  def self.where(param)
    Post.data.where(param)
  end

  def self.order_by_date(direction)
    Post.data.order_by_date(direction)
  end

  def self.data
    @data ||= Post.import_data(data_dir: POST_DATA_DIR)
  end

  def self.import_data(data_dir:)
    Data.new import_json(data_dir: data_dir)
  end
end
end
