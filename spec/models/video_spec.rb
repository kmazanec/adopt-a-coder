require 'spec_helper'

  describe Video do

    context "Youtube regex" do

      it "should have the proper regex" do
        video = Video.create!(url: "http://www.youtube.com/watch?v=xEhaVhta7sI")
        code = video.you_tube_code

        code.should eq "xEhaVhta7sI"
      end

    end


  end
