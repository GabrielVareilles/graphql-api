Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :signUp, function: Resolvers::SignUpUser.new do
    description "Mutation to sign up user."
  end
  field :signIn, function: Resolvers::SignInUser.new do
    description "Mutation to sign in user."
  end

  field :createFavorite, function: Resolvers::CreateFavorite.new do
    description "Mutation to create a favorite."
  end

  field :destroyFavorite, function: Resolvers::DestroyFavorite.new do
    description "Mutation to destroy a favorite."
  end
end
