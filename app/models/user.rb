class User < ApplicationRecord
    has_secure_password
    has_many :transactions, dependent: :destroy
end
