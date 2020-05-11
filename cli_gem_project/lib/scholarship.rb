class Scholarship

  attr_accessor :major, :major_url

  @@all = []

  def initialize(majors)
    @major = majors[:major]
    @major_url = majors[:major_url]
  end

  def self.major_finder(major_list)
    major_list.each do |e|
      self.all << self.new(e)
    end
  end

  def self.all
    @@all
  end
end
