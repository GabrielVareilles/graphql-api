# frozen_string_literal: true

class Resolvers::FavoriteStatus < GraphQL::Function
  argument :id, types.ID

  type Types::FavoriteType

  def call(_obj, args, _ctx)
    favorite = Favorite.find(args[:id])
    favorite.status == 'active' ? favorite.archived! : favorite.active!
    response = OpenStruct.new(favorite.attributes)
    return response
  end
end
