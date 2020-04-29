class CreateQueryLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :query_logs do |t|
      t.string :query
      t.string :response

      t.timestamps
    end
  end
end
