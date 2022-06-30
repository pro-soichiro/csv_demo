require 'csv'

CSV.generate do |csv|
  header = %w(ID 名前 スカウト 案件紹介 広告配信 メルマガ 運営連絡 作成日時 更新日時)
  csv << header
  @users.each do |user|
    values = [
      user.id,
      user.name,
      user.scout_email_notification == true ? '受け取る' : 'NG',
      user.introduction_project_email == true ? '受け取る' : 'NG',
      user.advertisement_delivery == true ? '受け取る' : 'NG',
      user.email_magazine == true ? '受け取る' : 'NG',
      user.contact_from_manager == true ? '受け取る' : 'NG',
      user.created_at,
      user.updated_at
    ]
    csv << values
  end
end