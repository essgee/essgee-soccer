module EssgeeSoccer
class  Post
  @data_dir = File.dirname(__FILE__) + "/../../data/**/*.json"

  class << self
    attr_accessor :data_dir
  end

  def self.all
    @data_all ||= Datastore.new(data_dir: Post.data_dir).data
  end

  def self.includes(tag:nil, tags:nil)
    Post.all.includes(tag: tag, tags: tags)
  end

  def self.order(date:)
    Post.all.order(date: date)
  end

  def self.where(criteria)
    Post.all.where(criteria)
  end
end
end
