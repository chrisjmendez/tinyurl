#
# Resources: 
# https://coderwall.com/p/ztig5g/validate-urls-in-rails
# http://stackoverflow.com/questions/7167895/whats-a-good-way-to-validate-links-urls-in-rails

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
#    record.errors[attribute] << (options[:message] || "must be a valid URL") unless url_valid?(value)    
		record.errors.add(attribute, :bad_uri, options) unless url_valid?(value)
  end

  # a URL may be technically well-formed but may 
  # not actually be valid, so this checks for both.
  def url_valid?(url)
    url = URI.parse(url) rescue false
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  end 
end

