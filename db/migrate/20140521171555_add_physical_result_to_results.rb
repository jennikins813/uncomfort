class AddPhysicalResultToResults < ActiveRecord::Migration
  def change
    add_column :results, :physical_result, :integer
  end
end
