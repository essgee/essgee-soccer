module EssgeeSoccer
class  Post
  @data_dir = File.dirname(__FILE__) + "/../../data/**/*.json"

  class << self
    attr_accessor :data_dir
  end

  def self.all
    @data_all ||= Datastore.new(data_dir: Post.data_dir).data
  end

  def self.includes(tag:)
    Post.all.select { |post| post['tags'].include? tag }
  end

  def self.order(date:)
    case date
    when :asc
      Post.all.sort { |a,b| DateTime.parse(a['date']) <=> DateTime.parse(b['date']) }
    when :desc
      Post.all.sort { |a,b| DateTime.parse(b['date']) <=> DateTime.parse(a['date']) }
    else
      Post.all.sort { |a,b| DateTime.parse(a['date']) <=> DateTime.parse(b['date']) }
    end
  end

  def self.where(criteria)
    k, v = criteria.shift
    Post.all.select { |post| post[k.to_s].match(v) }
  end
end
end
