class AdminMailer < ActionMailer::Base
  default from: "app@quizzle.me"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "app@quizzle.me")
  end

  def new_user_waiting_for_approval(user)
  	mail(:to => "rhys@hannah-co.com", :subject => " New User Registered", :from => "admin@quizzle.me")
  end

  def fact_entry_created(fact)
    @fact = fact
    mail(:to => "rhys@hannah-co.com", :subject => "nut fact has been created",)
  end
end
