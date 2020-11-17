class User < ApplicationRecord
    has_many :bank_accounts, :dependent => :destroy
    has_many :administrators
end
