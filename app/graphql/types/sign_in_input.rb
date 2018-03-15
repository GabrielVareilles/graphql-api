# frozen_string_literal: true

Types::SignInInput = GraphQL::InputObjectType.define do
  name 'SignInInput'

  argument :email, !types.String
  argument :password, !types.String
end
