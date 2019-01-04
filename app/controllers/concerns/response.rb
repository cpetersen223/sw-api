# frozen_string_literal: true

# Handling de response of all actions and set a default status
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end