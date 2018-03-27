# frozen_string_literal: true

require 'rest-client'
require 'json'

BASE_URL = 'https://open-medicaments.fr/api/v1/'
# INTERACTION_URL = 'https://www.open-medicaments.fr/api/v1/interactions?ids=66565609%7C60958897'


class OpenMedicamentService
  def initialize(arguments)
    @query = arguments[:query]
    @param = arguments[:param]
  end

  def call
    response = RestClient.get(BASE_URL + @query + @param)
    JSON.parse(response, object_class: OpenStruct)
  end
end
