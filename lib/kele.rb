require 'httparty'
require 'json'
require './lib/roadmap'

class Kele
  include HTTParty
  include Roadmap

  def initialize(email, password)
     response = self.class.post(api_url("sessions"), body: {"email": email, "password":
     password})
     raise "invalid email/password" if response.code != 200
     @auth_token = response["auth_token"]
  end

  def get_me
     response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
     @user_data = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("/mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    schedule_slot = []

    JSON.parse(response.body).each do |t|
      if t["booked"].nil?
        schedule_slot << t
      end
    end
    schedule_slot

  end

  def get_messages(page_number = 1)
    if page_number == nil
      response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token })
    else
      response = self.class.get(api_url("message_threads?page=#{page_number}"), headers: { "authorization" => @auth_token })
    end
      @messages = JSON.parse(response.body)
  end

  def create_message(sender, recipent_id, token, subject, message)
    response = self.class.post(api_url("messages"), headers: { "authorization" => @auth_token },
    body: {
        "sender" => sender,
        "recipent_id" => recipent_id,
        "token" => token,
        "subject" => subject,
        "stripeed-text" => message
      })
      puts response if response.success?
    end

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

end
