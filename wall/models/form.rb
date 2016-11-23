require 'active_model'
require './lib/service/captcha'

class Form
  include ActiveModel::Model

  attr_accessor :ip, :captcha, :vote

  validates_presence_of :ip, :captcha, :vote

  validate :validate_captcha

  def validate_captcha
    unless captcha_is_valid?
      errors.add(:captcha, "You're a machine!!!")
    end
  end

  private
  def captcha_is_valid?
    Service::Captcha.new(captcha, ip).success?
  end
end
