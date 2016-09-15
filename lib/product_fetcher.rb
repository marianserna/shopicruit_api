require 'http'
require_relative 'product_page'

class ProductFetcher

  def total
    page = 1
    total_dollars = 0
    more_records = true

    while (more_records) do
      url = "http://shopicruit.myshopify.com/products.json?page=#{page}"

      data = HTTP.get(url).parse(:json)

      pager = ProductPage.new(data)
      total_dollars += pager.total_page_dollars

      if pager.any?
        page += 1
      else
        more_records = false
      end
    end

    total_dollars
  end

end
