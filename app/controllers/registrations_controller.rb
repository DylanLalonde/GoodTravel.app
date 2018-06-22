class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(resource)
        @user = current_user
        @role = current_user.role
        case @role
            when "Traveller"
                traveller = TravellerInfo.new
                traveller.user = current_user
                traveller.save
                @user.traveller_info_id = traveller.id
                @user.save
            when "Host"
                host = HostInfo.new
                host.user = current_user
                host.save
                @user.host_info_id = host.id
                @user.save
            when "Referrer"
                referrer = ReferrerInfo.new
                referrer.user = current_user
                referrer.save
                @user.referrer_info_id = referrer.id
                @user.save
        end
        root_path
    end
end