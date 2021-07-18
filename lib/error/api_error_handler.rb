require 'error/helpers/render.rb'
module Error
  module ApiErrorHandler
    extend ActiveSupport::Concern

    included do
      # Handle ActiveRecord NotFound error
      rescue_from ActiveRecord::RecordNotFound do |e|
        respond(:not_found, 404, 'Record that you are looking for does not exist.')
      end

      rescue_from ActionController::ParameterMissing do |e|
        respond(:parameter_missing, 400, e.to_s)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        respond(:unprocessable_entity, 422, e.record.errors.full_messages.join(', '))
      end

      rescue_from ActiveRecord::RecordNotUnique do |e|
        respond(:data_error, 422, e.to_s)
      end

      rescue_from ActiveRecord::StatementInvalid do |e|
        respond(:data_error, 422, e.to_s)
      end

      rescue_from ArgumentError do |e|
        respond(:argument_error, 422, e.to_s)
      end
    end

    private

    def respond(error, status, message)
      json = Helpers::Render.json(error, status, message)
      render json: json, status: status
    end

  end
end