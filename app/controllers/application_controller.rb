class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_notifications, if: :current_user
    include Pagy::Backend

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def set_query
        @query = Person.ransack(params[:query])
    end

    private

    def set_notifications
        notifications = Notification.includes([:recipient]).where(recipient: current_user).newest_first.limit(9)
        @unread = notifications.unread
        @read = notifications.read    
    end
end
