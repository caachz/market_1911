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
    item_names = @vendors.reduce([]) do |acc, vendor|
      vendor.inventory.each do |item, amount|
        acc << item.name if !acc.include?(item.name)
      end
      acc
    end
    item_names.sort
  end

  def total_inventory
    @vendors.reduce(Hash.new(0)) do |acc, vendor|
      vendor.inventory.each do |item, amount|
        acc[item] += amount
      end
      acc
    end
  end

  def has_enough?(item, amount)
    return true if total_inventory[item] >= amount
    false
  end

  def sell(item, amount)
    enough = has_enough?(item, amount)
    return false if !enough

    all_vendors = vendors_that_sell(item)

    result = all_vendors.map do |vendor|
      until amount == 0 || vendor.inventory[item] == 0
        vendor.inventory[item] -= 1
        amount -= 1
      end
    end
    enough
  end
end
