require 'spec_helper'

describe ApplicationController do


  describe "#password_generator" do

    it 'should generate a unique password' do

      temp_password = controller.password_generator
      temp_2 = controller.password_generator

      temp_password.should_not eql(temp_2)
    end

  end

end

