# frozen_string_literal: true

require 'rspec' unless Object.const_defined? :RSpec

RSpec::Matchers.define :be_colored do |expected|

  def effects_string(actual)
    effects = applied_effects(actual).join(' and ')
    !effects.empty? ? effects : "unformatted"
  end

  match do |actual|
    applied_effects(actual).include? expected.to_sym
  end

  failure_message do |actual|
    "expected that '#{strip(actual)}' would be colored #{expected}, but was #{effects_string(actual)}"
  end
  failure_message_when_negated do |actual|
    "expected that #{strip(actual)} would not be colored #{expected}, but was #{effects_string(actual)}"
  end
end
