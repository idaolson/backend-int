require 'rails_helper'

RSpec.describe ShipmentItem, type: :model do
  describe 'relationships' do
    it { should belong_to(:shipment) }
    it { should belong_to(:item) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:item_id) }
    it { should validate_presence_of(:shipment_id) }
  end
end