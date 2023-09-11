require 'sinatra'
require 'json'
require 'time'

before do
	content_type :json
end


get '/' do
	return { message: 'Hello world!'}.to_json
end


get '/api' do
	slack_name = params[:slack_name]
	track = params[:track]
	weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

	day = Time.new.wday

	current_day = weekdays[day]
	utc_time = Time.now.utc
	github_file_url = 'https://github.com/JohnstoneDev/stage_two/blob/main/app.rb'
	github_repo_url = 'https://github.com/JohnstoneDev/stage_two'

	if slack_name && track
		return {
			slack_name: slack_name,
			current_day: current_day,
			utc_time: utc_time,
			track: track,
			github_file_url: github_file_url,
			github_repo_url: github_repo_url,
			status_code: 200
		}.to_json
	else
		status 400
		{ error: 'Provide slack_name & track'}.to_json
	end
end