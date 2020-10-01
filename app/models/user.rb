class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :jwt_authenticatable,
         omniauth_providers: [:google_oauth2], jwt_revocation_strategy: JwtBlacklist
  #self.skip_session_storage = [:http_auth, :params_auth]
end
