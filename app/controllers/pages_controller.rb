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

    def currency_rates
      if session[:currency].nil?
        session[:currency] = {}
        res0 = JSON.parse(HTTParty.get("https://free.currconv.com/api/v7/convert?q=GBP_USD,GBP_EUR&compact=ultra&apiKey=a367d690ea1d8b90c1d5").to_json)
        res1 = JSON.parse(HTTParty.get("https://free.currconv.com/api/v7/convert?q=GBP_CNY,GBP_JPY&compact=ultra&apiKey=a367d690ea1d8b90c1d5").to_json)
        res2 = JSON.parse(HTTParty.get("https://free.currconv.com/api/v7/convert?q=GBP_RUB,GBP_HKD&compact=ultra&apiKey=a367d690ea1d8b90c1d5").to_json)

        session[:currency][:g2u] = res0["GBP_USD"]
        session[:currency][:g2e] = res0["GBP_EUR"]
        session[:currency][:g2c] = res1["GBP_CNY"]
        session[:currency][:g2j] = res1["GBP_JPY"]
        session[:currency][:g2r] = res2["GBP_RUB"]
        session[:currency][:g2h] = res2["GBP_HKD"]

      end
      puts session[:currency]
      @g2u = session[:currency]["g2u"]
      @g2e = session[:currency]["g2e"]
      @g2c = session[:currency]["g2c"]
      @g2j = session[:currency]["g2j"]
      @g2r = session[:currency]["g2r"]
      @g2h = session[:currency]["g2h"]

    end


    private
    # Checks whether the page user has entered exists
    def valid_page?
        File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
    end

end
