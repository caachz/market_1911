class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.reduce([]) do |acc, vendor|
      acc << vendor.name
      acc
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
        vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    names = @vendors.reduce([]) do |acc, vendor|
      vendor.inventory.each do |item, amount|
        acc << item.name
      end
      acc
    end
    names.uniq.sort
  end

  def total_inventory
    @vendors.reduce(Hash.new(0)) do |acc, vendor|
      vendor.inventory.each do |item, amount|
        acc[item] += amount
      end
      acc
    end
  end
end
