# frozen_string_literal: true

Types::SubstanceType = GraphQL::ObjectType.define do
  name 'Substance'
  field  :codeSubstance, types.String
  field  :denominationSubstance, types.String
  field  :dosageSubstance, types.String
end

Types::PresentationType = GraphQL::ObjectType.define do
  name 'Presentation'
  field :libelle, types.String
  field :tauxRemboursement, types[types.String]
  field :prix, types.String
  field :indicationRemboursement, types.String
end

Types::CompositionType = GraphQL::ObjectType.define do
  name 'Composition'
  field :referenceDosage, types.String
  field :substancesActives, types[Types::SubstanceType]
end

Types::InfosType = GraphQL::ObjectType.define do
  name 'Infos'
  field  :dateDebut, types.String
  field  :dateFin, types.String
  field  :infoURL, types.String
  field  :infoLibelle, types.String
end

Types::MedicineType = GraphQL::ObjectType.define do
  name 'Medicine'
  field :codeCIS, !types.String
  field :denomination, !types.String
  field :homeopathie, types.Boolean
  field :compositions, types[Types::CompositionType]
  field :formePharmaceutique, types.String
  field :voiesAdministration, types[types.String]
  field :indicationsTherapeutiques, types.String
  field :statutAdministratifAMM, types.String
  field :etatCommercialisation, types.Boolean
  field :presentations, types[Types::PresentationType]
  field :compositions, types[Types::CompositionType]
  field :infosImportantes, types[Types::InfosType]
end
