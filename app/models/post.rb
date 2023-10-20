class Post < ApplicationRecord
    extend FriendlyId
    belongs_to :user
    belongs_to :category
    has_many :comments, dependent: :destroy

    has_noticed_notifications model_name: "Notification"
    has_many :notificaitons, through: :user

    has_rich_text :body

    friendly_id :title, use: %i[slugged history finders]

    def should_generate_new_friendly_id?
        title_changed? || slug.blank?
    end

    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "title", "updated_at", "user_id", "views"]
    end
end
