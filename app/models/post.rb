class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    has_noticed_notifications model_name: "Notification"
    has_many :notificaitons, through: :user, dependent: :destroy
end
