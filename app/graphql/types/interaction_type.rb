Types::InteractionType = GraphQL::ObjectType.define do
  name 'Interaction'

  field :codeCISMedicament1, types.String
  field :nomMedicament1, types.String
  field :codeCISMedicament2, types.String
  field :nomMedicament2, types.String
  field :description, types.String
  field :type, types.String
  field :conseil, types.String
end
