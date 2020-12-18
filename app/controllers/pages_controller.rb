class PagesController < ApplicationController
    include Admin::SessionsHelper
    # Shows pages
    def show
        if valid_page?
            render template: "pages/#{params[:page]}"
        else
            render file: "public/404.html", status: :not_found # The 404 page can be customised
        end
    end

    # Custom to show welcome page (for root)
    def showWelcome
        render template: "pages/welcomepage"
    end


    private
    # Checks whether the page user has entered exists
    def valid_page?
        File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
    end

end
