class SubscribeJob
  include SuckerPunch::Job

  def perform(id)
    ActiveRecord::Base.connection_pool.with_connection do
      user = Newsletter.find(id)
      mailchimp_list_id = "291193"
      email = email.email

      begin
        g = Gibbon::API.new
        g.lists.subscribe({ id: mailchimp_list_id, email:  {email: email}})

        SubscribeMailer.confirmation_email(user).deliver
      rescue Gibbon::MailChimpError => mce
        SuckerPunch.logger.error("subscribe failed: due to #{mce.message}")
        raise mce
      rescue Exception => e
        SuckerPunch.logger.error("subscribe failed: due to #{e.message}")
        raise e
      end
    end
  end

end
