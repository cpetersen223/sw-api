# frozen_string_literal: true

# Handling de response of all actions and set a default status
module Response
  def json_response(object,
                    status = :ok,
                    serializer: nil,
                    each_serializer: nil,
                    method: :render)

    send method,
         json: object,
         status: status,
         serializer: serializer,
         each_serializer: each_serializer
  end

  def paginated_json_response(object,
                              status = :ok,
                              serializer: nil,
                              each_serializer: nil,
                              method: :paginate)
    json_response object,
                  status,
                  serializer: serializer,
                  each_serializer: each_serializer,
                  method: method
  end
end