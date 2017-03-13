class PushNotificationJob
  include SuckerPunch::Job

  def perform(id)
    ActiveRecord::Base.connection_pool.with_connection do
      notification = Notification.find(id)

      if !Rpush::Gcm::App.find_by_name("quizzl-me")
        app = Rpush::Gcm::App.new
        app.name = "quizzl-me"
        app.auth_key = "AIzaSyDzb3DTBI2sIlamMYw-hJvdIrzFK5ok7mw"
        app.connections = 1
        app.save!
      end

      n = Rpush::Gcm::Notification.new
      n.app = Rpush::Gcm::App.find_by_name("quizzl-me")
      n.registration_ids = Device.all.map{|device| device.registration_id}
      message = notification.message
      n.data = notification.as_json
      n.save!
    end
  end

end
