class PagesController < ApplicationController
    def index
        if user_signed_in? then
            render :app #redirect_to app_path
        else
            render :index
        end
    end
end
