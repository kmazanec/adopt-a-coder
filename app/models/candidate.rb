class Candidate < User
  has_one :application
  has_many :responses, through: :application

  has_many :nominations


  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/

  after_create :application_create

  before_save :check_urls

  def self.search(query)
    all(conditions: ["LOWER(name) like ?", "%#{query}%".downcase])
  end

  def check_urls
    self.twitter = "http://#{self.twitter}" unless self.twitter.nil? || self.twitter[/^https?/] || self.twitter.empty?
    self.facebook = "http://#{self.facebook}" unless self.facebook.nil? ||self.facebook[/^https?/] ||  self.facebook.empty?
    self.linked_in = "http://#{self.linked_in}" unless self.linked_in.nil? ||self.linked_in[/^https?/] ||  self.linked_in.empty?
    self.codeacademy = "http://#{self.codeacademy}" unless self.codeacademy.nil? ||self.codeacademy[/^https?/] ||  self.codeacademy.empty?
    self.github = "http://#{self.github}" unless self.github.nil? ||self.github[/^https?/] ||  self.github.empty?
    self.blog = "http://#{self.blog}" unless self.blog.nil? ||self.blog[/^https?/] ||  self.blog.empty?
    self.personal_url = "http://#{self.personal_url}" unless self.personal_url.nil? ||self.personal_url[/^https?/] ||  self.personal_url.empty?
  end

  def personal_info_percent
    (([phone, address1, city, state, zip] - [nil, ""]).length / 5.0) * 100
  end

  def social_media_percent
    ([facebook, twitter, linked_in, codeacademy, github, blog, personal_url]).compact.length != 0 ? 100 : 0
  end

  def about_me_percent
    ([mission, biography, currently_working_on]).compact.length != 0 ? 100 : 0
  end

  def profile_percent_completed
    ((about_me_percent + social_media_percent + personal_info_percent) / 300) * 100
  end

  def profile_completed?
    profile_percent_completed == 100
  end

  protected
  def application_create
    Application.create(candidate_id: self.id)
  end

end
