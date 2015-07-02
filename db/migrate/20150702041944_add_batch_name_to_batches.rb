class AddBatchNameToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :batch_name, :string
  end
end
