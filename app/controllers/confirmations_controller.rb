class ConfirmationsController < Devise::ConfirmationsController
  protected
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        redirect_to :controller=>"users", :action=>"show", id: resource.slug
      else
        new_session_path(resource_name)
      end
    end
end