Types::FavoriteType = GraphQL::ObjectType.define do
  name 'Favorite'

  field :id, types.ID
  field :denomination, types.String
  field :codeCIS, types.Int
  field :user, -> { Types::UserType }
  field :errors, types[types.String]
end
