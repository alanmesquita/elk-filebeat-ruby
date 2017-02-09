require "bundler/setup"
require 'erb'
require 'sinatra/base'

require './models/form'
require './lib/log_for_obj'

class App < Sinatra::Base
  include LogForObject

  get '/' do
    erb :home
  end

  post '/vote' do
    params = {
      vote: request.params['vote'].to_i,
      ip: request.ip,
      captcha: request.params['g-recaptcha-response'],
    }

    request_form = Form.new(params)

    if not request_form.valid?
      @messages = request_form.errors.full_messages
      return erb :home
    end

    # I'm assuming that there is an admin to set the wall id
    log_wall(ip: params[:ip], vote: params[:vote], wall_id: 1)
  end
end
