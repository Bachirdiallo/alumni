class Batch < ActiveRecord::Base
  has_many :graduations, dependent: :destroy

  include ::Importable
   IMPORT_ENABLED = {
     :name => {exact: "name", is_identifier: true}
   }
end
