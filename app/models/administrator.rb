class Administrator < ApplicationRecord
  has_secure_password
  has_secure_password :second_password, validations: false
  validates :administratorname, presence: true, length: {minimum: 4, maximum: 30}, uniqueness: {case_sensitive:false}
  validates :password, presence: true, length: {minimum: 6}, :if => :password
  before_save :downcase_administratorname
  private
    def downcase_administratorname
      self.administratorname = administratorname.downcase
    end
end
