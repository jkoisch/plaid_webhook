class CreatePlaidWebhookAntennas < ActiveRecord::Migration
  def change
    create_table :plaid_webhook_antennas do |t|
      t.string :access_token
      t.text :payload

      t.timestamps
    end
  end
end
