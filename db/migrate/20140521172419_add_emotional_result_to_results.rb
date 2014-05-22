class AddEmotionalResultToResults < ActiveRecord::Migration
  def change
    add_column :results, :emotional_result, :integer
  end
end
