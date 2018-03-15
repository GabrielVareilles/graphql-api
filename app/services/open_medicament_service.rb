require 'rest-client'
require 'json'


BASE_URL = "https://open-medicaments.fr/api/v1/medicaments"

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
