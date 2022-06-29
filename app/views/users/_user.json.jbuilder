json.extract! user, :id, :name, :scout_email_notification, :introduction_project_email, :advertisement_delivery, :email_magazine, :contact_from_manager, :created_at, :updated_at
json.url user_url(user, format: :json)
