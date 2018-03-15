Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allMedicines, !types[Types::MedicineType] do
    description "Query to retrieve all medicines with a search term."
    argument :term, !types.String
    resolve ->(obj, args, ctx) {
      OpenMedicamentService.new(query: '?query=', param: args.term).call
    }
  end

  field :findMedicine, Types::MedicineType do
    description "Query to retrieve one medicine by codeCIS."
    argument :codeCIS, !types.String
    resolve ->(obj, args, ctx) {
      OpenMedicamentService.new(query: '/', param: args.codeCIS).call
    }
  end

  field :allFavorites, function: Resolvers::AllFavorites.new do
    description "Query to retrieve all favorites from a user."
  end

end
