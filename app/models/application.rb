class Application < ActiveRecord::Base
  belongs_to :candidate
  has_many :responses
  has_many :questions, through: :responses
  accepts_nested_attributes_for :responses

  after_create :create_responses

  def self.save_application(input)
    input[:responses_attributes].each_value do |params_hash|
      response = Response.find(params_hash[:id])
      response.update_attributes(body: params_hash[:body])
    end
  end

  def complete?
    return false if self.responses.length != self.questions.length
    self.responses.each do |response|
      return false if !response.complete?
    end
    true
  end

  def response_percent_completed
    (100  * completed_responses/(self.responses.count))
  end

  def completed_responses
    responses_complete = 0
    self.responses.each do |response|
      responses_complete += 1 if response.complete?
    end
    responses_complete
  end


  protected
  def create_responses
    Question.all.each do |question|
      Response.create(question_id: question.id, application_id: self.id, body: " ")
    end
  end


end
