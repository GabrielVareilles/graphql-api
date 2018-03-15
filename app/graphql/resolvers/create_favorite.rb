# frozen_string_literal: true

class Resolvers::CreateFavorite < GraphQL::Function
  argument :codeCIS, types.String
  argument :denomination, types.String

  type Types::FavoriteType

  def call(_obj, args, ctx)
    favorite = Favorite.new(
      denomination: args[:denomination],
      codeCIS: args[:codeCIS],
      user: ctx[:current_user]
    )

    if favorite.save
      return favorite
    else
      # TODO: return error messages
      return OpenStruct.new
    end
  end
end
