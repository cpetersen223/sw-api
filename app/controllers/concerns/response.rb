# frozen_string_literal: true

# Handling de response of all actions and set a default status
module Response
  def json_response(object, status = :ok, serializer: nil, each_serializer: nil)
    render json: object,
           status: status,
           serializer: serializer,
           each_serializer: each_serializer
  end
end