module SessionsHelper
  include HTTParty
  def log_in(user)
    session[:user_id] = user.id
    session[:last_logged_in_location] = user.last_logged_in_location

    token = '4de722a5796753d1a1cada57d284da87'
    ip = request.remote_ip
    # ip = "11.194.128.24"
    response = JSON.parse(HTTParty.get("http://api.ipstack.com/#{ip}?access_key=#{token}&format=1").to_json)
    puts (response)

    curr_user = User.find(user.id)
    curr_user.update({last_logged_in_location:response["city"]+", " + response["country_name"]})


  end

  def current_user
    if (session[:user_id])
      User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    session.delete(:last_logged_in_location)
  end

end
