class Resolvers::DestroyFavorite < GraphQL::Function
  argument :id, types.ID

  type Types::FavoriteType

  def call(_obj, args, ctx)
    favorite = Favorite.find(args[:id])
    response = OpenStruct.new(favorite.attributes)
    if favorite.destroy
      return response
    else
      # TODO return error messages
      return OpenStruct.new
    end
  end
end
