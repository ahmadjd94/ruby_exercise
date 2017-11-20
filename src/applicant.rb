class Applicant
  attr_accessor :id, :applicant_name, :tags, :has_tag

  def initialize(applicant_id, applicant_name, applicant_tags)
  	@id, @applicant_name, @tags = applicant_id, applicant_name, applicant_tags
  end

	def to_s
		return "applicant "+ @id.to_s + " : " +@applicant_name
	end

  def has_tag(keyword)
  	for tag in @tags
  		if tag == keyword 
  			return true
  		end
  	end
  	return false
  end

end
