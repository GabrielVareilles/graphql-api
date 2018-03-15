class Resolvers::SignUpUser < GraphQL::Function
  argument :input, !Types::SignUpInput

  type do
    name 'SignUpPayload'
    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, ctx)
    user = User.create!(
      email: args[:input][:email],
      password: args[:input][:password],
      password_confirmation: args[:input][:password_confirmation]
    )
    token = user.authentication_token

    OpenStruct.new({
      user: user,
      token: token
    })

  end
end
