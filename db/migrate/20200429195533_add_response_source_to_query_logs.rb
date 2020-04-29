class AddResponseSourceToQueryLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :query_logs, :response_source, :string
  end
end
