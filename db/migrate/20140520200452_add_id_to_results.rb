class AddIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :results_id, :integer
  end
end
