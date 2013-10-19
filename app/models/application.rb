class Application < ActiveRecord::Base
  belongs_to :candidate
  has_many :responses
  has_many :questions, through: :responses

  after_create :create_responses

  protected
  def create_responses
    Question.all.each do |question|
      Response.create(question_id: question.id, application_id: self.id, body: " ")
    end
  end


end
