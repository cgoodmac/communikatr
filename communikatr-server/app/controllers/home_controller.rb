class HomeController < ApplicationController
  protect_from_forgery :except => [:twitter, :text, :email]
  before_filter :allow_cross_origin_access

  def twitter
    @to = params[:to]
    @message = params[:message]

    Twitter.update("#{@message} #{@to}")
    @return_message = "Your TWEET has been sent!"
  
    respond_to do |format|
      format.json { render json: @return_message }
    end

  end

  def text
    @phone = params[:to]
    @message = params[:message]

    from_phone = "+19175125826"

    client = Twilio::REST::Client.new(TW_SID, TW_TOK) # need to put codes in initializers file
    @text  = client.account.sms.messages.create({:from => from_phone, :to => @phone, :body => @message})
    @return_message = "Your TEXT has been sent!"

    respond_to do |format|
      format.json { render json: @return_message }
    end

  end

  def email
    @email = params[:email]
    @message = params[:message]

    Notifications.email(@email, @message).deliver
    @return_message = "Your EMAIL has been sent!"
  
    respond_to do |format|
      format.json { render json: @return_message }
    end

  end

  private
    def allow_cross_origin_access 
      response.headers['Access-Control-Allow-Origin'] = '*' 
      response.headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    end

end