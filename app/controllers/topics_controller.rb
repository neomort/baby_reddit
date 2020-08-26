class TopicsController < ApplicationController
  def index
    @sub = Sub.find(params[:sub_id])
    @topics = @sub.topics
  end

  def show
    @sub = Sub.find(params[:sub_id])
    @topic = Topic.find(params[:id])
  end

  def new
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.new #makes it so you have ID of the sub
    render partial: "form"
  end

  def create
    #get the sub, then use sub to create topic
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.new(topic_params)

    if @topic.save
      redirect_to [@sub, @topic] 
      
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.find(params[:id])
    render partial: "form"
  end

  def update
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.find(params[:id])

    if (@topic.update(topic_params))
      redirect_to sub_path(@sub)
    else 
      render partial: "form"
    end
    end

  def destroy
#reminder we have params[:sub_id]to get sub
#params[:id]to find the topic
@topic = Topic.find(params[:id])

#or preferred way
@sub = Sub.find(params[:sub_id])
topic = @sub.topics.find(params[:id])

topic.destroy
redirect_to sub_path(@sub)
  end

  private

  def topic_params
params.require(:topic).permit(:name, :body)
  end
end
