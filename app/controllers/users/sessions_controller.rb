class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  before_filter :validate_auth_token, :except => [:create, :new]
  include Devise::Controllers::Helpers
  include ApiHelper
  respond_to :json

  def create
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    if !resource
      user = User.find_by_email(params[:user][:email])
      if user.authenticate(params[:user][:password])
        respond_with user.authentication_token.as_json
      end
    end

    if resource.valid_password?(params[:user][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success => true, :token => resource.authentication_token}
      return
    end
    failure
  end

  def destroy
    resource.reset_authentication_token!
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render :status => 200, :json => {}
  end

  def failure
    return render json: { success: false, errors: [t('api.v1.sessions.invalid_login')] }, :status => :unauthorized
  end
end
