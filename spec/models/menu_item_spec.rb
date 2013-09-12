require 'spec_helper'
describe MenuItem do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :menu }
  end

  context "associations" do
    it { pending }
  end

  context "#name" do
    it { pending }
  end
end
