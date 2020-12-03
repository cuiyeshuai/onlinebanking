class PagesController < ApplicationController

    # Shows pages
    def show 
        if valid_page?
            render template: "pages/#{params[:page]}"
        else
            render file: "public/404.html", status: :not_found # The 404 page can be customised
        end
    end

    
    private 
    # Checks whether the page user has entered exists
    def valid_page?
        File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
    end

end