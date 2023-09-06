class Person < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["content", "created_at", "id", "name", "title", "updated_at"]
    end
end
