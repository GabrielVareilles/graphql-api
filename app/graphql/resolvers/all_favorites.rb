class Resolvers::AllFavorites < GraphQL::Function
  type types[Types::FavoriteType]

  def call(_obj, _args, ctx)
    ctx[:current_user].favorites
  end
end
