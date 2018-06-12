require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri "https://www.bloc.io/api/v1/"

  def initialize(email, password)
     response = self.class.post(api_url("sessions"), body: {email: "email", password:
     password})
     @auth_token = response["auth_token"]
     raise "invalid email/password" if response.code != 200

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

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

end