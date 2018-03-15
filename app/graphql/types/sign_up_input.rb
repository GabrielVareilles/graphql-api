Types::SignUpInput = GraphQL::InputObjectType.define do
  name 'SignUpInput'

  argument :email, !types.String
  argument :password, !types.String
  argument :password_confirmation, !types.String
end
