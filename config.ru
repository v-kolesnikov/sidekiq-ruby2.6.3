# frozen_string_literal: true

require_relative 'boot'
require 'sidekiq/web'

run Sidekiq::Web
