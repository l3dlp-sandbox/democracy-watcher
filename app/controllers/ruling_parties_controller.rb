class RulingPartiesController < ApplicationController

  # Show current national ruling party
  def show_current_national
    params[:rule_type] = 'national'
    show_current
  end

  # Show current ruling party
  def show_current
    params[:period] = Date.current
    show
  end

  def show
    @ruling_party = RulingParty.where(rule_type: params[:rule_type]).for_date(params[:period]).first
    render 'show'
  end

  def ruling_party_params
    params.require(:ruling_party).permit(:leader, :promises)
  end
end
