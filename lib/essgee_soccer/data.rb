module EssgeeSoccer
class  Data
  include Enumerable
  include JsonImporter

  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def each
    i = 0
    while i < collection.count
      yield collection[i]
      i += 1
    end
  end

  def where(param)
    k, v = param.shift
    selected = self.select { |e| e[k.to_s] == v }
    Data.new selected
  end

  def order_by_date(direction)
    sorted = self.sort do |a,b|
      date_time(a['date']) <=> date_time(b['date'])
    end

    ordered = case direction
    when :asc
      sorted
    when :desc
      sorted.reverse
    else
      raise "direction #{direction.to_s} not defined"
    end

    Data.new ordered
  end

  private

  def date_time(date)
    DateTime.parse(date)
  end

end
end
