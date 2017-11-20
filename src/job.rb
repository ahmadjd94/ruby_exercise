class Job
  attr_accessor :id, :title, :applicants

  def initialize(job_id,title,applicants)
  	@id = job_id
  	@title = title
  	@applicants = applicants
  end

  def to_s
  	return(@title)
  end
end
