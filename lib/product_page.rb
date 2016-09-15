class ProductPage
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def total_page_dollars
    total_dollars = 0

    data['products'].each do |product|
      if product['product_type'] == 'Clock' || product['product_type'] == 'Watch'
        product['variants'].each do |variant|
          total_dollars += variant['price'].to_f
        end
      end
    end

    total_dollars
  end

  def any?
    data['products'].any?
  end
end
