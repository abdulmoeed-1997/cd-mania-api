class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_google(from_google_params)

    if @user.present?
      sign_out_all_scopes
      sign_in "user", @user
      render json: {messages: 'Signed In Successfully',is_success: true,data: {user: @user}}, status: :ok
    else
      render json: {messages: 'Signed In Failed - Unauthorized',is_success: false, data: {}}, status: :unauthorized
    end
  end

  private

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      full_name: auth.info.name,
      avatar_url: auth.info.image
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
