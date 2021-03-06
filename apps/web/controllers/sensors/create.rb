module Web::Controllers::Sensors
  class Create
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.sensors.create']

    before :authenticate!

    params do
      required(:sensor).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:topic).filled(:str?)
        required(:visible).filled(:bool?)
      end
    end

    def call(params)
      if params.valid?
        sensor = create.(create_params)

        redirect_to routes.sensor_url(id: sensor.id)
      else
        self.status = 422
      end
    end

    private

    def create_params
      params.get(:sensor).merge(user_id: current_user.id)
    end
  end
end
