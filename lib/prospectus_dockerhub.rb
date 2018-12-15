require 'open-uri'

module ProspectusDockerhub
  STATUS_MAP = {
    -4 => 'canceled',
    -2 => 'exception',
    -1 => 'error',
    0 => 'pending',
    1 => 'claimed',
    2 => 'started',
    3 => 'cloned',
    4 => 'readme',
    5 => 'dockerfile',
    6 => 'built',
    7 => 'bundled',
    8 => 'uploaded',
    9 => 'pushed',
    10 => 'done',
    11 => 'queued'
  }.freeze
  # rubocop:disable Metrics/LineLength
  GOOD_STATUSES = %w[started cloned readme dockerfile built bundled uploaded pushed queued claimed pending].freeze
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
      [status, 'done']
    end

    def status
      @status ||= STATUS_MAP[status_code]
    end

    def status_code
      @status_code ||= json['results'].first['status']
    end

    def json
      @json ||= JSON.parse(open(url).read) # rubocop:disable Security/Open
    end

    def url
      "#{base_url}/#{@repo_slug}/buildhistory/?page_size=1&page=1"
    end

    def base_url
      'https://hub.docker.com/v2/repositories'
    end
  end
end
