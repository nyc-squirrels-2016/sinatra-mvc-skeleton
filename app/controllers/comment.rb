get '/' do 
	@comments = Comment.all
	erb :"index"
end



get '/comment/:id' do
	@comment = Comment.find(params[:id])
	erb :"comment-show"
end

#AJAX / CREATE
#recieve form data from ajax. save comment.
#send back data as json object.
post '/comment' do
	@comment = Comment.new(content: params[:content])
	@comment.save
	{id: @comment.id, content: @comment.content, likes: @comment.likes}.to_json
end

#AJAX / VOTE
#vote route. recieve id for vote from ajax request.
#save the vote to db and send back new vote count.
post '/likes' do
	@comment = Comment.find(params[:id])
	@comment.likes += 1
	@comment.save
	{likes: @comment.likes}.to_json
end

#GET EDIT FORM
get '/comment/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :"comment-edit"
end

#PUT EDIT
put '/comment/:id' do 
	@comment = Comment.find(params[:id])
	@comment.update(content: params[:content])
	redirect "comment/#{@comment.id}"
end

#DELETE
delete '/comment/:id' do 
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect '/'
end


