class UrlResource < ActiveRecord::Base
  
  attr_accessible :url_string

  serialize :browsers, Hash

  validates :url_string, :format => URI::regexp(%w(http https))
  validates_uniqueness_of :token

  before_validation  :generate_token

  belongs_to :user

  def generate_token
    loop do 
      token = SecureRandom.base64(6).tr('+/=lIO0', 'pqrsxyz')
      break self.token = token unless UrlResource.find_by_token(token)
    end
  end

  def increase_browser_count(browser)
    self.browsers[browser] = self.browsers[browser] + 1 rescue 1
    self.save
  end

end
