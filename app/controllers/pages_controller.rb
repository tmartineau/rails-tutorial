class PagesController < ApplicationController

  def home
    
  end

  def contact
    if request.post?
      UserMailer.contact_confirmation(params[:email], params[:first_name], params[:last_name], params[:message]).deliver
      AdminMailer.visitore_contact(....).deliver

      @success = true
    end
  end

  def about
    
  end

  def interesting_facts
    
  end

end
