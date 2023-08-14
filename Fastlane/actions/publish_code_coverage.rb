module Fastlane
  module Actions

    class PublishCodeCoverageAction < Action

      COVERAGE_FILE_PATH = 'fastlane/code_coverage/index.html'

      def self.run(params)
        UI.message "Slather report"
        
        Actions::SlatherAction.run(
          scheme: 'pipeline-ios',
          proj: 'pipeline-ios.xcodeproj',
          output_directory: "fastlane/code_coverage", 
          html: true
      )

        UI.message "Coverage number"
        coverage = get_coverage()
        UI.message "Code coverage: #{coverage}"

        UI.message "Getting commit SHA"
        commit_sha = get_current_commit_sha()
        UI.message "Current commit SHA: #{commit_sha}"
        UI.message "Publishing coverage on Github"
        publish_to_github("Code coverage: #{coverage}", commit_sha)
      end


       def self.get_coverage
        # Coverage file path
        current_dir = Dir.pwd
        complete_coverage_file_path = "#{current_dir}/#{COVERAGE_FILE_PATH}"
        UI.message "Coverage file path: #{complete_coverage_file_path}"

        first_term = "id=\"total_coverage\">"
        second_term = "</span>"

        begin
          file = File.open(complete_coverage_file_path)
          file_data = file.read
          first_string = file_data.split(first_term, -1)[1]
          final_string = first_string.split(second_term, -1)[0]
          return final_string
        rescue Errno::ENOENT
          return nil
        end
      end

      def self.get_current_commit_sha
        commit_info = LastGitCommitAction.run(nil)
        commit_info[:commit_hash]
      end

      def self.publish_to_github(message, commit_sha)
        GithubApiAction.run(
          server_url: "https://api.github.com",
          api_token: ENV["API_TOKEN"],
          http_method: "POST",
          path: "/repos/apfdamascena/pipeline-ios/statuses/#{commit_sha}",
          raw_body:"{\"state\":\"success\", \"description\": \"#{message}\", \"context\": \"coverage\"}",
          error_handlers: {
            404 => proc do |result|
              UI.message("Couldn't find resource: #{result[:json]}")
            end,
            '*' => proc do |result|
              UI.message("Unknown error: #{result[:json]}")
            end
          }
        ) do |result|
          UI.message("Code coverage updated for commit #{commit_sha}")
        end
      end

      def self.description
        "Publish code coverage to a Github commit status check"
      end

      def self.details
        "This action uses Slather to generate a code coverage report for the current Xcode project status, gets the coverage number, gets the current commit and publish the coverage number via Github API to a status check, making it available to see in pull requests, for example"
      end

      def self.authors
        ["Alex Damascena"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end