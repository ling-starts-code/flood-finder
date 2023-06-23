# frozen_string_literal: true

# this is an application controller
class ApplicationController < ActionController::Base
  def hello
    render html: "hello world!"
  end
end
