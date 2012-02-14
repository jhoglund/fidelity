require "fidelity/generators/install_generator"
require 'fidelity/version'

module Fidelity
  mattr_accessor :layout
  @@layout = "fidelity"

  mattr_accessor :content_path
  @@content_path = "fidelity/"

  def self.setup
    yield self
  end

  require 'fidelity/engine' if defined?(Rails)
  require 'fidelity/builder'
  require 'fidelity/widget_helpers'
end
