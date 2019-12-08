class ImmobilesController < ApplicationController

  def index
    immobile_params = params[:immobile] || {}
    @immobiles = Immobile.where(immobile_params).sort_by(&:created_at).reverse
  end

  def update
    immobile_identifier = params[:id]
    immobile_state = params[:immobile_state]
    immobile_comment = params[:immobile_comment]

    if immobile_state
      ServiceState.where(immobile_identifier: immobile_identifier).update_all(state: immobile_state)
    else
      ServiceState.where(immobile_identifier: immobile_identifier).update_all(comment: immobile_comment)
    end

    render nothing: true, status: :ok
  end

end
