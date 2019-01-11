require("pry")

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets_sold)
  return pet_shop[:admin][:pets_sold] += number_of_pets_sold
end

def stock_count(pet_shop)
  stock = 0
  for pet in pet_shop[:pets]
    stock += 1
  end
  return stock
end

def pets_by_breed(pet_shop, breed)
  breed_counter_array = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breed_counter_array << pet[:breed]
    end
  end
  return breed_counter_array
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, pet_name)
  if customer[:cash] < pet_name[:price]
    return false
  else
    return true
  end
end

def sell_pet_to_customer(pet_shop, pet_name, customer)
  # check if customer can afford pet by name
  if pet_name != nil
    if customer[:cash] > pet_name[:price]
      # remove customer cash
      customer[:cash] -= pet_name[:price]
      #update shops total cash
      pet_shop[:admin][:total_cash] += pet_name[:price]
      # remove pet from shop pets
      customers_pet = pet_shop[:pets].delete(pet_name)
      #add pet to customers pets
      customer[:pets] << customers_pet
      # update pets sold in shop admin
      pet_shop[:admin][:pets_sold] += 1
    end
  end
end
