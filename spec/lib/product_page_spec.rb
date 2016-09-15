require_relative '../../lib/product_page'

RSpec.describe ProductPage do
  let(:clock) do
    {
      'product_type' => 'Clock',
      'variants' => [
        { 'price' => '1.10' },
        { 'price' => '2.20' }
      ]
    }
  end

  let(:watch) do
    {
      'product_type' => 'Watch',
      'variants' => [
        { 'price' => '3.30' }
      ]
    }
  end

  let(:pants) do
    {
      'product_type' => 'Pants',
      'variants' => [
        { 'price' => '1.25' },
        { 'price' => '2.78' },
        { 'price' => '3.32' }
      ]
    }
  end

  describe 'total_page_dollars' do

    it 'calculates total dollars for clocks and watches' do
      # setup
      data = {
        'products' => [ clock, watch, pants ]
      }

      pager = ProductPage.new(data)

      # Test
      expect(pager.total_page_dollars).to eq(6.60)
    end


    it 'returns 0 when there are no products' do
      # Setup
      data = {
        'products' => [ ]
      }

      pager = ProductPage.new(data)

      # Test
      expect(pager.total_page_dollars).to eq(0.0)
    end
  end

  describe ".any?" do
    it 'is true when there are products' do
      # Setup
      data = {
        'products' => [ clock, watch, pants ]
      }

      pager = ProductPage.new(data)

      expect(pager.any?).to eq(true)
    end

    it 'is false when there are no products' do
      # Setup
      data = {
        'products' => [ ]
      }

      pager = ProductPage.new(data)

      # Test
      expect(pager.any?).to eq(false)
    end

  end

end
