# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = Nokogiri::XML(open("app/assets/courses.xml"))

@seperator = ", " #to seperate multiple instructors or programmes

# loop through courses, grab attributes, and add the course to the database
courses.xpath('//courses/course').each_with_index do |l, i|
  
  catalog_number = l.at_xpath('@sgid').text.strip
  title = l.at_xpath('name').text.strip
  credits = l.at_xpath('ects').text.strip
  institute = l.at_xpath('institute').text.strip
  
  #grab instructors
  staff = ""
  l.xpath('staff_list/staff').each do |s|
    if staff.empty?  
      staff += s.xpath('name').text.strip
    else
      staff += @seperator + s.xpath('name').text.strip
    end
  end
  
  #grab programmes
  programmes = ""
  l.xpath('programmes/programme').each do |p|
    if programmes.empty?  
      programmes += p.xpath('name').text.strip
    else
      programmes += @seperator + p.xpath('name').text.strip
    end
  end
    
  description = l.at_xpath('description').text.strip
  participant_count = l.at_xpath('participant_count').text.strip
  
  #create institute if it doesn't exist, and set instituteID
  Institute.where(:name => institute).first_or_create()
  instituteID = Institute.where(:name => institute).first.id
  
  #create course
  Course.create(:catalog_number    => catalog_number,
                :title             => title, 
                :institute_id      => instituteID, 
                :credits           => credits,
                :description       => description,
                :staff             => staff,
                :programmes        => programmes,                
                :participant_count => participant_count
                )  
end