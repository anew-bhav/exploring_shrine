class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.references :user, null: false, foreign_key: true
      t.jsonb :video_data
    end
  end
end
