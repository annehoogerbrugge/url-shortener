# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  # Checks the lenght and format of the given url
  # If the length is less then 22, the shortened url will not make it shorter.
  # The maximal amount of chars a string column can have is 255.
  def validate_each(record, attribute, value)
    puts 'im still validating'
    unless value.present? && value.length.between?(22, 255)
      record.errors.add(:long_url, "The url does not have the correct length")
      return false
    end

    unless self.class.correct_format?(value)
      record.errors.add(:long_url, "This is not a valid url")
    end
  end

  def self.correct_format?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && uri.host.present?
  end
end