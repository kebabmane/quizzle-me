class Fact < ActiveRecord::Base
	searchkick callbacks: :async
	is_impressionable :counter_cache => true, :column_name => :views
	has_paper_trail
  acts_as_paranoid

	acts_as_taggable
  acts_as_taggable_on :fact_category

	#after_create :send_fact_admin_mail

	belongs_to :user
	validates :fact_string, presence: true


def update_fotd

end

private

def self.import(file)
	CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
		Fact.create! row.to_hash
	end
end

def send_fact_admin_mail
	AdminMailer.fact_entry_created(self).deliver_later
end

end
