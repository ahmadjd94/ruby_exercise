require './src/company.rb'
require './src/applicant.rb'
require './src/job.rb'

begin
	company = Company.new('data/boundless.json')
	for applicant in company.find_applicants('google')
		puts applicant
	end
rescue Exception => e
	puts e	
end
	



