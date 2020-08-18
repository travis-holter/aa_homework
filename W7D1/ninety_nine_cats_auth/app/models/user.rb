# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

    validates :user_name, presence:true, uniqueness:true
    validates :password_digest, presence: {message: 'Password can\'t be blank'}
    validates :session_token, presence:true, uniqueness:true
    before_validation :ensure_session_token
    attr_reader :password

    has_many :cats,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.is_password?(password) 
        user
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        bcrypt_password = BCrypt::Password.new(self.password_digest) 
        bcrypt_password.is_password?(password) 
    end

    private
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end


    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end
end
