module EssgeeSoccer
class  Post
  POST_TYPES = %W[game date announcement]

  def self.all
    all_posts
  end

  def self.where(options)
  end

  private

  def all_posts
    @all_posts || EssgeeSoccer.data
  end

  def fetch_all_posts
    import_hosts
  end

end
end
