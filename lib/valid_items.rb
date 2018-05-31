# frozen_string_literal: true
require 'valid_items/version'
require 'rails/all'

unless Object.const_defined?('ApplicationRecord')
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end

class ValidItems
  # Check that all your ActiveRecord Objects are still valid
  #
  # Example:
  #   >> ValidItems.checkup()
  #   => User id 203: {:name=>["can't be blank"]}
  #   >> ValidItems.checkup(email: 'example@example.com')
  #   => User id 203: {:name=>["can't be blank"]}  and an email gets sent
  #   >> ValidItems.checkup(updated_at: 1.day.ago)
  #   => User id 203: {:name=>["can't be blank"]}
  #      Just want to check recent changes, in case of a large db
  #
  # Arguments:
  #   email: (String)
  #   updated_at: (ActiveSupport::TimeWithZone)
  def self.checkup(email: nil, updated_at: 100.years.ago)
    issues = []
    ApplicationRecord.descendants.collect(&:name).each do |model|
      model.constantize.where('updated_at > ?', updated_at).find_each do |item|
        issues << "#{item.class} id #{item.id}: #{item.errors.messages}" if item.invalid?
      end
    end
    return 'ok' if issues.blank?

    if email.present?
      ActionMailer::Base.mail(
        from: email,
        to: email,
        subject: "DB Issues Discovered in #{Rails.env}",
        body: issues.join("\r\n")
      ).deliver
    end
    puts issues
  end
end
