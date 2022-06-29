class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :scout_email_notification
      t.boolean :introduction_project_email
      t.boolean :advertisement_delivery
      t.boolean :email_magazine
      t.boolean :contact_from_manager

      t.timestamps
    end
  end
end
