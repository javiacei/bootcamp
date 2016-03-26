module Exercises
  class CompleteForm
    include ActiveModel::Model

    include Virtus.model

    GITHUB_REGEX = /^https:\/\/github.com/

    attribute :url, String

    validates :url, presence: true
    validate :validate_github_url

    def persisted?
      false
    end

    private

    def validate_github_url
      unless (GITHUB_REGEX.match(url))
        errors.add(:url, 'invalid github url')
      end
    end
  end
end
