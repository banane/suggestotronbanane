class VotesController < ApplicationController 
 before_filter :authenticated?

  def create 
    @topic = Topic.find(params[:topic_id])
    @vote = @topic.votes.create!

    flash[:notice] = "You voted for #{@vote.topic.title}"
    redirect_to(topics_path)
     
  end

 def authenticated?
   if !logged_in?
     flash[:notice] = "You must login to do that"
     redirect_to root_path
     false
   end 
 end 


end
