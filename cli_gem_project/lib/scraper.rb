class Scraper

  def self.academic_major(main_url)
    doc = Nokogiri::HTML(open(main_url))
    major_array = []
    majors = doc.css("#ullist li")
    majors.each do |major|
      major_hash = {:major => major.css("a").text.strip, :major_url => "https://www.scholarships.com" + major.css("a").attr("href").value.strip}
      major_array << major_hash
    end
    major_array
  end

  def self.scholarship(major_url)
    doc = Nokogiri::HTML(open(major_url))
    scholarship_array = []
    scholarships = doc.css("tr")[1..-1]
    scholarships.each do |scholarship|
      scholarship_hash = {:title => scholarship.css(".scholtitle").text.strip, :amount => scholarship.css(".scholamt").text.strip, :scholarship_url => "https://www.scholarships.com" + scholarship.css("a").attr("href").value.strip}
      scholarship_array << scholarship_hash
    end
    scholarship_array
  end

  def self.detail(detail_url)
    doc = Nokogiri::HTML(open(detail_url))

    puts organization_title = doc.css("h1").first.text.strip
    puts awards_available = doc.css(".award-info-row h3").last.text.strip.split("\r\n\r\n").collect {|i| i.strip}.join(" ")
    puts due_date = "Due Date: #{doc.css("#due-date-text").text.strip}"
    puts award_amount = "Award mount: #{doc.css(".award-info-container h3").first.text.strip}"
    puts "\n"
    puts scholarship_description = "#{doc.css(".topspc").first.text}\n#{doc.css(".scholdescrip").text.strip.split("    ")[0].strip}"
    puts "\n"
    puts contact = "Contact\nScholarshp Committee\n#{doc.css("#liAddress1Text").text.strip}\n#{doc.css("#liCityStateZIPText").text.strip}\n#{doc.css("#ulScholDetails li").last.text.strip}"
  end
end
