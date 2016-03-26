# frozen_string_literal: true

module Matchers
  module Api
    extend RSpec::Matchers::DSL

    matcher :match_response_schema do |schema|
      match do |response|
        schema_directory = "#{Dir.pwd}/spec/support/api/schemas"
        schema_path = "#{schema_directory}/#{schema}.json"

        JSON::Validator.validate(schema_path, response.body)
      end
    end

    matcher :have_no_content_body do
      match do |response|
        expect(response.body).to eq('{}')
      end

      failure_message { 'expected an empty JSON response' }

      failure_message_when_negated { 'expected to not get an empty JSON response' }

      description { 'empty JSON response' }
    end
  end
end
