# frozen_string_literal: true

require 'rest-client'
require 'json'

BASE_URL_MEDICINE = 'https://open-medicaments.fr/api/v1/medicaments'
BASE_URL_INTERACTION = 'https://open-medicaments.fr/api/v1/interactions'

class OpenMedicamentService
  def initialize(arguments)
    @type = arguments[:type] || :medicine
    @query = arguments[:query]
    @param = arguments[:param]
  end

  def call
    url = (@type == :medicine) ? BASE_URL_MEDICINE : BASE_URL_INTERACTION
    response = RestClient.get(url + @query + @param)
    JSON.parse(response, object_class: OpenStruct)
  end
end
