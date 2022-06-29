class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :scout_email_notification, default: true
      t.boolean :introduction_project_email, default: true
      t.boolean :advertisement_delivery, default: true
      t.boolean :email_magazine, default: true
      t.boolean :contact_from_manager, default: true

      t.timestamps
    end
  end
end
