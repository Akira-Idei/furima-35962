class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,     null: false, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :street_number,   null: false
      t.string     :building
      t.string     :phone_number,    null: false, format: {with: /\A\d{10,11}\z/}
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
