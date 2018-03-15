# frozen_string_literal: true

class Resolvers::SignInUser < GraphQL::Function
  argument :input, !Types::SignInInput

  # defines inline return type for the mutation
  type do
    name 'SignInPayload'
    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    user = User.find_by(email: args[:input][:email])

    return nil unless user
    if user.valid_password? args[:input][:password]

      OpenStruct.new(user: user,
                     token: user.authentication_token)
    end
  end
end
