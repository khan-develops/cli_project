class Title

  attr_accessor :major, :title, :amount, :title_url

  @@all = []

  def initialize(title)
    @major = title[:major]
    @title = title[:title]
    @title_url = title[:title_url]
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
