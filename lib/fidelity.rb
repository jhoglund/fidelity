require 'rdiscount'
require 'coderay'
require 'zurb-foundation'
require "fidelity/generators/install_generator"
require 'fidelity/version'

module Fidelity
  def self.setup
    yield self
  end
  require 'fidelity/engine' if defined?(Rails)
  require 'fidelity/builder'
  require 'fidelity/widget_helper'
end
