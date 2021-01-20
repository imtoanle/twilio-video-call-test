class CreateClaims < ActiveRecord::Migration[6.1]
  def change
    create_table :claims do |t|
      t.string :token
      t.string :claim_number
      t.string :claimant_contact

      t.timestamps
    end
  end
end
