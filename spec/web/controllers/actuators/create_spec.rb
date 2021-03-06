require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/create'

describe Web::Controllers::Actuators::Create, type: :controller do
  let(:user) { instance_double(User, id: user_id) }
  let(:action) { described_class.new }
  let(:user_id) { 1 }

  before do
    stub_current_user!(user)
  end

  context 'when is successful' do
    let(:user_id) { 1 }
    let(:params) do
        { actuator:
          { name: 'luminosity switch', description: 'test', topic: 'luminosity_switch', visible: true, type: 'text' }
        }
    end

   it 'status is 302' do
      response = action.call(params)

      expect(response[0]).to eq 302
    end
  end

  context 'when is unprocessable' do
    let(:params) do
      Hash[]
    end

    it 'status is 422' do
      response = action.call(params)

      expect(response[0]).to eq 422
    end
  end
end
