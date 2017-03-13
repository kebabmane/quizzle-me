class StatusesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  after_filter :verify_authorized,  except: [:index, :show]
  skip_before_filter :set_cart
  skip_before_filter :set_todays_food

  def show
    render text: ActiveRecord::Migrator.current_version
  end
end
