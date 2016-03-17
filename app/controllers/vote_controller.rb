class VoteController < ApplicationController

  def vote_up
    case params[:type]
    when 'tweet'
      t = Tweet.find(params[:id])
      t.vote!(request.ip)
      @tweet = t
    when 'instagram'
      i = Instagram.find(params[:id])
      i.vote!(request.ip)
      @tweet = i
    else
      s = Story.find(params[:id])
      s.vote!(request.ip)
      @tweet = s
    end
  end
end
