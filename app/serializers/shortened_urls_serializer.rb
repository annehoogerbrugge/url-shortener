module Serializers
  include Alba::Resource

  root_key :shortened_url

  attributes :id, :long_url, unique_code
end