class Graduation < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch
  belongs_to :programme
  belongs_to :faculty
  belongs_to :campu

  include ::Importable
   IMPORT_ENABLED = {
     :user_id => {exact: "Student Id", is_identifier: true},
     :batch_id => {exact: "Batch", is_identifier: false},
     :programme_id => {exact: "Programme", is_identifier: false},
     :campu_id => {exact: "Campus", is_identifier: false},
     :faculty_id => {exact: "Faculty", is_identifier: false}
   }
end
