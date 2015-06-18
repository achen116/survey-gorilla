get '/surveys' do
	# @surveys = Survey.all
	erb :survey_index
end

get '/surveys/new' do
	erb :new_survey_form
end

post '/surveys' do
	# surveys#create
	# creates a new photo
	# redirects to desired page
		# (usually '/surveys' => updated list with created photo)
end

get '/surveys/:id' do
	# surveys#show
	# displays a specific photo
	# erb :to_the_specific_photo_view
end

get '/surveys/:id/edit' do
	# surveys#edit
	# returns an HTML form for editing a photo
	# erb :to_the_html_edit_form_view
end

put 'surveys/:id' do
	# surveys#update
	# updates a specific photo
	# redirects to desired page
		# (usually '/surveys/:id' => updated changes to specific photo)
end

delete '/surveys/:id' do
	# surveys#destroy
	# deletes a specific photo
	# redirects to desired page
		# (usually '/surveys' => updated list without deleted photo)
end
