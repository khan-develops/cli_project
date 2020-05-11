class Title

  attr_accessor :title, :amount, :scholarship_url

  @@all = []

  def initialize(title)
    @title = title[:title]
    @title_url = title[:scholarship_url]
    @amount = title[:amount]
  end

  def self.title_finder(scholarship_title)
    scholarship_title.each do |e|
      self.all << self.new(e)
    end
  end

  def self.all
    @@all
  end
end
