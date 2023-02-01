# frozen_string_literal: true

class CreateSharedLists < ActiveRecord::Migration[7.0]
  def change
    create_table :shared_lists do |t|
      t.references :owner
      t.references :viewer

      t.timestamps
    end
  end
end
