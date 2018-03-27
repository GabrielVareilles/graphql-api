# frozen_string_literal: true

class Resolvers::FavoriteStatus < GraphQL::Function
  argument :id, types.ID

  type Types::FavoriteType

  def call(_obj, args, _ctx)
    favorite = Favorite.find(args[:id])
    response = OpenStruct.new(favorite.attributes)
    # TODO nonsense to declare response before toggling status.
    favorite.status == 'active' ? favorite.archived! : favorite.active!
    return response
  end
end
