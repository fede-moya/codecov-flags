require "net/http"
require "json"
require "uri"

class TriggerPushWebhook
  def run
    send_request
  end

  private

  def send_request
    uri = URI.parse("http://localhost:3000/webhooks")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Accept"] = "application/json"
    request["X-Github-Event"] = "push"
    request.body = webhook_payload.to_json

    req_options = {
      use_ssl: false,
    }

    Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end

  def webhook_payload
    {
      action: "push",
      repository: {
        id: 62749454,
        full_name: "codeclimate-testing/cc-private-test-coverage",
        owner: {
          login: "codeclimate-testing",
        }
      },
      after: commit_sha,
      ref: "refs/heads/#{branch}",
    }
  end

  def commit_sha
    `git rev-parse HEAD`.strip
  end

  def branch
    `git rev-parse --abbrev-ref HEAD`.strip
  end
end

class ReportTestCoverage
  def run
    run_specs
    report_coverage
  end

  private

  def report_coverage
    test_reporter_id = "7845966f2918cd669f558569b4334e514c277e00a63cd3dd858d5d72a12c5899"
    api_endpoint = "http://localhost:4000/v1/test_reports"

    system "CC_TEST_REPORTER_ID=#{test_reporter_id} ./cc-test-reporter after-build --insecure --coverage-endpoint #{api_endpoint}"
  end

  def run_specs
    system "bundle exec rspec"
  end
end

task :trigger_quality do
  system "git push"
  TriggerPushWebhook.new.run
  ReportTestCoverage.new.run
end

task :default do
  system "bundle exec rspec"
end
