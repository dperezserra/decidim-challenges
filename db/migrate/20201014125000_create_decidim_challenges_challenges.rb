# frozen_string_literal: true

class CreateDecidimChallengesChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_challenges_challenges do |t|
      t.jsonb :title
      t.jsonb :local_description
      t.jsonb :global_description
      t.references :decidim_component, index: true, null: false
      t.jsonb :tags
      t.string :ods
      t.references :decidim_scope, index: true
      t.integer :state, null: false, default: 0
      t.date :start_date
      t.date :end_date
      t.string :coordinating_entities
      t.string :collaborating_entities

      t.timestamps
    end
  end
end
