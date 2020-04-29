class CreatePopulationQueryLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :population_query_logs do |t|
      t.references :query_log, foreign_key: true
      t.references :population, foreign_key: true
    end
  end
end
