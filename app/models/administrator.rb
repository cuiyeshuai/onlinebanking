class Administrator < ApplicationRecord
  has_secure_password
  validates :administratorname, presence: true, length: {minimum: 4, maximum: 30}, uniqueness: {case_sensitive:false}
  validates :password, presence: true, length: {minimum: 6}
  before_save :downcase_administratorname
  private
    def downcase_administratorname
      self.administratorname = administratorname.downcase
    end
end
