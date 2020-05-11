class Title

  attr_accessor :organization_title, :awards_available,
                :due_date, :scholarship_description, :contact

  @@all = []

  def initialize(detail)
    @title = detail[:title]
    @title_url = title[:scholarship_url]
    @amount = title[:amount]
  end

  def self.title_finder(scholarship_title)
    scholarship_title.each do |e|
      self.all << self.new(e)
    end
  end

  def add_details(details)
    details.each do |k, v|
      self.send("#{k}=", details[k])
    end
  end

  def self.all
    @@all
  end
end
