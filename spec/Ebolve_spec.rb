require 'rspec'
require './Ebolve'
  
describe Ebolve do
  describe "computes it just right" do
    it "with 12 years with 5 of growth" do
      b= Ebolve.new({:eps1=>1.24, :eps2=>1.54, :ltg=>0.241, :book_s=>5.11, \
                    :FROE=>0.2, :r=>0.0960, :pYOUT=>0.16, :years=>12, :growth_years=>5})
      b.ebo.should == 35.61473978043542
    end
    
    it "with 20 years with 5 of growth" do
      b= Ebolve.new({:eps1=>1.24, :eps2=>1.54, :ltg=>0.241, :book_s=>5.11, \
                    :FROE=>0.2, :r=>0.0960, :pYOUT=>0.16, :years=>20, :growth_years=>5})
      b.ebo.should == 75.22110949011996
    end
    
    it "with another example" do
      b= Ebolve.new({:eps1=>1.47, :eps2=>1.7, :ltg=>0.2995, :book_s=>12.61, \
                    :FROE=>0.12, :r=>0.09, :pYOUT=>0, :years=>12, :growth_years=>5})
      b.ebo.should == 34.228136415711994
    end
  end
end
  
