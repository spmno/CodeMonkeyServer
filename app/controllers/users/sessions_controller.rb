class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  before_filter :validate_auth_token, :except => [:create], :if => Proc.new { |c| c.request.format == 'application/json' }
  include Devise::Controllers::Helpers
  include ApiHelper

  def create
=begin
    if params[:format] == "json"
      data_json=JSON.parse request.body.read
      email = data_json["user"]["email"]
      password = data_json["user"]["password"]
      user = User.find_by_email(email)
      if user.authenticate(password)
        respond_with user.authentication_token.as_json
        sign_in(:user, resource)
      end
    end
=end
    resource = User.find_for_database_authentication(:email => params[:user][:email])

    if resource.nil?
      respond_to do |format|
        format.html { Error with your login or password }
        format.json { render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401 }
      end
    end

    if resource.valid_password?(params[:user][:password])
      sign_in("user", resource)
      respond_to do |format|
        format.html { respond_with resource, location: after_sign_in_path_for(resource) }
        format.json { render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email} }
      end
    else
      respond_to do |format|
        format.html { Error with your login or password }
        format.json { render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401 }
      end
    end
  end

  def destroy
    #resource.reset_authentication_token!
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render :status => 200, :json => {}
  end

  def failure
    return render json: { success: false, errors: [t('api.v1.sessions.invalid_login')] }, :status => :unauthorized
  end
end
