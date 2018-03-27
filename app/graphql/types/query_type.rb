# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :allMedicines, !types[Types::MedicineType] do
    description 'Query to retrieve all medicines with a search term.'
    argument :term, !types.String
    resolve ->(_obj, args, _ctx) {
      OpenMedicamentService.new(query: 'medicaments?query=', param: args.term).call
    }
  end

  field :findMedicine, Types::MedicineType do
    description 'Query to retrieve one medicine by codeCIS.'
    argument :codeCIS, !types.String
    resolve ->(_obj, args, _ctx) {
      OpenMedicamentService.new(query: 'medicaments/', param: args.codeCIS).call
    }
  end

  field :allFavorites, function: Resolvers::AllFavorites.new do
    description 'Query to retrieve all favorites from a user.'
  end

  field :interactions, function: Resolvers::Interactions.new do
    description 'Query to get all interactions between active favorites from a User.'
  end
end
