class GraphqlController < ApplicationController
  before_action :authenticate_user_from_token!

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = { current_user: current_user }
    result = RailsGqlApiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)

    render json: result
  end

  private

  def authenticate_user_from_token!
    # see https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
    user_email = request.headers['X-User-Email']
    user       = user_email && User.find_by_email(user_email)
    token = request.headers['X-User-Token']

    if user && Devise.secure_compare(user.authentication_token, token)
      sign_in user
    end
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
