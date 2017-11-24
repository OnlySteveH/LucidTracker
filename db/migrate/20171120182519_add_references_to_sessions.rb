class AddReferencesToSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :sessions, :user, foreign_key: true
  end
end
