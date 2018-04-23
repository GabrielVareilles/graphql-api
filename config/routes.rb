# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'

  post '/graphql', to: 'graphql#execute'
end
