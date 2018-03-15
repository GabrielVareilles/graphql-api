Types::SignInInput = GraphQL::InputObjectType.define do
  name 'SignInInput'
  argument :email, !types.String
  argument :password, !types.String
end
