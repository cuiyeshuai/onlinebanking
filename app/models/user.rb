class User < ApplicationRecord
    has_many :bank_accounts, :dependent => :destroy
end
