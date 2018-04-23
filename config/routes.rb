# frozen_string_literal: true
require 'graphiql'

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  if Rails.env.development? || Rails.env.production?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  post '/graphql', to: 'graphql#execute'
end
