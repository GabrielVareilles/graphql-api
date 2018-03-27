# frozen_string_literal: true

class Resolvers::Interactions < GraphQL::Function
  type !types[Types::InteractionType]

  def call(_obj, _args, ctx)
    favorite_pairs = ctx[:current_user].favorites
                                       .active
                                       .pluck(:codeCIS)
                                       .combination(2)
                                       .to_a

    interactions = []

    if favorite_pairs.empty?
      return []
    else
      favorite_pairs.each do |pair|
        response = OpenMedicamentService.new(
          query: "interactions",
          param: "?ids=#{pair[0]}%7C#{pair[1]}"
        ).call
        response.each { |int| interactions << OpenStruct.new(int)}
      end
    end

    return interactions
  end
end
