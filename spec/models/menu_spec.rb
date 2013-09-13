require 'spec_helper'
describe Menu do
  let(:menu) { FactoryGirl.build :menu }
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :start_at }
    it "end date must be after start date" do
      (menu.start_at).should be < (menu.end_at)
    end
  end

  context "associations" do
    it { should have_many :menu_items }
  end

  context "#name" do
    it "removes removes special characters" do
      menu.name = "lunch-menu"
      expect {
        menu.save
      }.to change { menu.name }.from("lunch-menu").to("lunch menu")
    end
  end
end
