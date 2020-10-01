class User < ApplicationRecord
  require 'securerandom'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :jwt_authenticatable,
         omniauth_providers: [:google_oauth2], jwt_revocation_strategy: JwtBlacklist
  self.skip_session_storage = [:http_auth, :params_auth]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    create_with(uid: uid, first_name: full_name, last_name: '', avatar_url: avatar_url, password:SecureRandom.urlsafe_base64).find_or_create_by!(email: email)
  end

end
