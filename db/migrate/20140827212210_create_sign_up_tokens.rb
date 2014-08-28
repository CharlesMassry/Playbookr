class CreateSignUpTokens < ActiveRecord::Migration
  def change
    create_table :sign_up_tokens do |t|
      t.string :email, null: false, index: true
      t.string :token, null: false, index: true
      t.belongs_to :team, null: false, index: true

      t.timestamps
    end
  end
end
