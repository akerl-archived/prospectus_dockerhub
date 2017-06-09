require 'nokogiri'
require 'open-uri'

module ProspectusDockerhub
  GOOD_STATUSES = %w[success].freeze
  # rubocop:disable Metrics/LineLength
  STATUS_XPATH = '//span[contains(@class, "BuildStatus__statusWrapper__")]'.freeze
  # rubocop:enable Metrics/LineLength

  ##
  # Helper for automatically adding build status check
  class Build < Module
    def initialize(repo_slug)
      @repo_slug = repo_slug || raise('No repo specified')
    end

    def extended(other) # rubocop:disable Metrics/MethodLength
      actual_val, expected_val = parse_status

      other.deps do
        item do
          name 'dockerhub'

          expected do
            static
            set expected_val
          end

          actual do
            static
            set actual_val
          end
        end
      end
    end

    private

    def parse_status
      return [status, status] if GOOD_STATUSES.include?(status)
      [status, 'success']
    end

    def status
      @status ||= html.xpath(STATUS_XPATH).first.text.strip.downcase
    end

    def html
      @html ||= Nokogiri::HTML(open(url))
    end

    def url
      "#{base_url}/#{@repo_slug}/builds"
    end

    def base_url
      'https://hub.docker.com/r'
    end
  end
end
