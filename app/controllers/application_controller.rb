# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_layout_variables
  before_action :set_locale

  private

  def set_layout_variables
    @sitename = "Aïkku - AI for you"
  end

  def set_locale
    locale = extract_locale
    I18n.locale = locale
    cookies.permanent[:locale] = locale.to_s
  end

  def extract_locale
    if params[:locale].present?
      candidate = params[:locale].to_sym
      return candidate if I18n.available_locales.include?(candidate)
    end

    if cookies[:locale].present?
      candidate = cookies[:locale].to_sym
      return candidate if I18n.available_locales.include?(candidate)
    end

    browser_locale = request.env["HTTP_ACCEPT_LANGUAGE"]
      &.scan(/^[a-z]{2}/)
      &.first
      &.to_sym

    I18n.available_locales.include?(browser_locale) ? browser_locale : I18n.default_locale
  end
end