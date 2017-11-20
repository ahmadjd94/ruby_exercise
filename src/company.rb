require "json"
require_relative "job"
require_relative "applicant"
class Company

  attr_accessor :jobs
  ## Implement this method to load the given JSON file into Ruby built-in data
  ## structures (hashes and arrays).


  def load_json(filepath)
    target_file = open(filepath, "r")
    json_string = target_file.read()
    target_file.close()
    return JSON.load(json_string)
  end

  ## This method should update the `jobs` property to an array of instances of
  ## class `Job`
  def initialize(filepath)
    begin
      jobs_array =  []
      jobs = load_json(filepath)['jobs']
      for job in jobs
        applicants_array = []
        for applicant in job['applicants']
          begin
            applicant = Applicant.new(applicant['id'].to_i, applicant['name'], applicant['tags'])  
          rescue Exception => e
            puts "Exception occurrd in appl",e
          end          
          applicants_array.push(applicant)
        end

        begin
          new_job = Job.new(job['id'].to_i, job['title'], applicants_array)
        rescue Exception => e
          puts "Exception occurrd in job",e
        end

        jobs_array.push(new_job)

      end

      @jobs = jobs_array  

    rescue Exception => e
        puts e
    end

    # Load the json file and loop over the jobs to create an array of instance of `Job`
    # Assign the `jobs` instance variable.
  end


  def find_applicants(keyword="")
    ## Impelement this method to return applicants from all jobs with a
    ## tag matching this keyword
    
    matching_applicants = []

    for job in @jobs
      for applicant in job.applicants    
        if applicant.has_tag(keyword)
          matching.push(applicant)
        end
      end
    end
  
    return matching_applicants

    # Use the `jobs` instance variable.
  end
end
