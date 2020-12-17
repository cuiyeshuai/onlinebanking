class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true,
                         length: { minimum: 4, maximum: 30},
                         uniqueness: {case_sensitive: false}
    validates :password, presence: true,
                         length: { minimum: 6}
    before_save :downcase_username

    private
      def downcase_username()
        self.username = username.downcase
      end
      def User.digest(passphrase)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(passphrase, cost: cost)
      end
      # source: https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
    has_many :bank_accounts, :dependent => :destroy
end
