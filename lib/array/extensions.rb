require 'set'

class Array

  def includes(tag:nil, tags:nil)
    if tag && !tags
      self.select { |e| e['tags'].include? tag }
    elsif !tag && tags
      self.select do |e|
        e_tags = Set.new e['tags']
        tags   = Set.new(tags)
        e_tags == tags
      end
    else
      raise 'tag: and tags: arguments cannot be specified simultaneously'
    end
  end

  def order(date:)
    case date
    when :asc
      self.sort { |a,b| DateTime.parse(a['date']) <=> DateTime.parse(b['date']) }
    when :desc
      self.sort { |b,a| DateTime.parse(a['date']) <=> DateTime.parse(b['date']) }
    else
      self.sort { |a,b| DateTime.parse(a['date']) <=> DateTime.parse(b['date']) }
    end
  end

  def where(criteria)
    k, v = criteria.shift
    self.select { |post| post[k.to_s] == v }
  end
end
