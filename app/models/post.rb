class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    has_noticed_notifications model_name: "Notification"
    has_many :notificaitons, through: :user, dependent: :destroy

    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "title", "updated_at", "user_id", "views"]
    end
end
