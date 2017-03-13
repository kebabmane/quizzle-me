require 'twitter'

desc 'create fact of the day'
task create_fotd: :environment do

  rand_id = Fact.offset(rand(Fact.where(:displayed => true).count)).first
  @rand_record = Fact.find(rand_id.id)
  @fotd = Fotd.new
  @fotd.fact_id = @rand_record.id
  @fotd.save
  string1 = "Todays FOTD: "
  string_post = string1 + @rand_record.fact_string


  puts @twitter_client

  @twitter_client.update(string_post)

end
