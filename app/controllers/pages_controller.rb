class PagesController < ApplicationController
    include Admin::SessionsHelper
    include HTTParty
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

    # Get current exchange rates from API and store in sessions
    def currency_rates
      if session[:currency].nil?
        session[:currency] = {}
        res = JSON.parse(HTTParty.get("https://api.exchangeratesapi.io/latest?base=GBP").to_json)


        session[:currency][:g2u] = res["rates"]["USD"].round(2)
        session[:currency][:g2e] = res["rates"]["EUR"].round(2)
        session[:currency][:g2c] = res["rates"]["CNY"].round(2)
        session[:currency][:g2j] = res["rates"]["JPY"].round(2)
        session[:currency][:g2r] = res["rates"]["RUB"].round(2)
        session[:currency][:g2h] = res["rates"]["HKD"].round(2)

        @g2u = res["rates"]["USD"].round(2)
        @g2e = res["rates"]["EUR"].round(2)
        @g2c = res["rates"]["CNY"].round(2)
        @g2j = res["rates"]["JPY"].round(2)
        @g2r = res["rates"]["RUB"].round(2)
        @g2h = res["rates"]["HKD"].round(2)

      else
        puts session[:currency]
        @g2u = session[:currency]["g2u"]
        @g2e = session[:currency]["g2e"]
        @g2c = session[:currency]["g2c"]
        @g2j = session[:currency]["g2j"]
        @g2r = session[:currency]["g2r"]
        @g2h = session[:currency]["g2h"]
      end

    end


    private
    # Checks whether the page user has entered exists
    def valid_page?
        File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
    end

end
