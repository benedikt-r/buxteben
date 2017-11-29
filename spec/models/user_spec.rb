require 'rails_helper'

describe User do 
  context "testing validations" do
   
   it "requires email" do
     expect(User.new(email: nil)).not_to be_valid
   end
 end
end