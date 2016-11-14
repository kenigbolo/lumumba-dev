class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      if user.confirmed?
        flash['notice'] = 'Authenticated via facebook'
      end
      sign_in user
      redirect_to controller: 'users', action: 'show', id: user.slug
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  alias facebook all
end
