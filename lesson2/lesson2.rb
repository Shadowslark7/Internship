class Contacts
  def initialize
    @contacts = []
  end
  
  def create(name, phone, address)
    @contacts.push({ name: name, phone: phone, address: address })
    return @contacts.length - 1
  end
  
  def list
    @contacts
  end

  def update(id, name, phone, address)
    return false unless @contacts[id]
  end

  def delete(id)
    @contacts.delete(id)
    return false unless @contacts[id]
  end

  def search(id)
   @contacts[id]
  end

  def search(name)
    @contacts.find {|el| el[:name] == name}
  end
end

 contacts = Contacts.new
 contacts.create("Stepan", 123456, "Stryi")
 contacts.create("Bogdan", 456789, "Manevychi")
 contacts.create("Yaro",741852, "Snovsk")

puts "list"
puts contacts.list

puts "update"
puts contacts.update(3, "Yaro",741852, "Shors")
puts "list"
puts contacts.list

puts "search id"
puts contacts.search(3)
puts "delete"
puts contacts.delete(3)

puts "search name"
puts contacts.search(1)