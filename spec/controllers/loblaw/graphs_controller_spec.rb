require 'spec_helper'

module Loblaw
  describe GraphsController do
    it 'has a homepage' do
      expect { get :index, use_route: :loblaw }.not_to raise_error
    end
  end
end
