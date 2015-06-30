class Faculty < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false
  has_many :programmes,  dependent: :destroy
  belongs_to :campus
  has_many :graduations, dependent: :destroy

  include ::Importable
   IMPORT_ENABLED = {
     :name => {exact: "name", is_identifier: true}
   }
end
