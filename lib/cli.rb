require 'pry'

class CLI

  URL = "https://www.scholarships.com/financial-aid/college-scholarships/scholarship-directory/academic-major"

  def initialize
    major_list = Scraper.academic_major(URL)
    Scholarship.major_finder(major_list)
  
    Scholarship.all.each do |e|
      title = Scraper.scholarship(e.major_url)
      Title.title_finder(title)
    end
  end

  def call
    puts "Welcome to scholarship finder!"
    input = ""
    while input != "Exit"
      puts "Please enter your major to continue or type exit to exit"
      input = gets.strip.capitalize
      if input == "Exit"
        break
      end
      list_title(input)
    end
    puts "Thank You for Using The App!"
  end

  def list_title(input)
    i = 0
    while !Title.all.find {|e| e.major == input}
      puts "Please enter valid entry!"
      input = gets.strip.capitalize
    end
    title_list = Title.all.find_all {|e| e.major == input}
    sort_list = title_list.sort_by {|title| -title.amount}
    sort_list.each do |e| 
    i += 1
      if e.amount == 0
        e.amount = "Varies"
      end
      puts "#{i}. #{e.title} - #{e.amount}"
      e.amount = 0
    end

    puts "Please enter number between 1 and #{sort_list.length}"
    input = gets.to_i
    while !(1..sort_list.length).include?(input)
      puts "Please enter a valid entry!"
      input = gets.to_i
    end
    p = sort_list[input-1].title_url
    Scraper.detail(p)
    #binding.pry
  end
end