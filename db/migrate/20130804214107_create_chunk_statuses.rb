class CreateChunkStatuses < ActiveRecord::Migration
  def change
    create_table :chunk_statuses do |t|
      t.string :description

      t.timestamps
    end
  end
end
