require 'securerandom'

class Contacts
  def initialize
    @contacts = {}
  end
  
  def create(name, phone, address)
    @id = SecureRandom.uuid
    @contacts[@id] = { name: name, phone: phone, address: address }
    return @id
  end
  
  def list
    @contacts
  end

  def update(id, name, phone, address)
    return false unless @contacts[id]
    @contacts[id] = { name: name, phone: phone, address: address }
  end

  def delete(id)
    @contacts.delete(id)
  end

  def search_id(id)
    @contacts[id]
  end

  def search_name(name)
    @contacts.select{|key,value| value[:name] == name}.first
  end
end

 contacts = Contacts.new
 id1 = contacts.create("Stepan", 123456, "Stryi")
 id2 = contacts.create("Bogdan", 456789, "Manevychi")
 id3 = contacts.create("Yaro",741852, "Shors")

puts "list"
puts contacts.list

puts "update"
puts contacts.update(id3, "Yaro",741852, "Snovsk")
puts "list"
puts contacts.list

puts "search id"
puts contacts.search_id(id2)
puts "delete"
puts contacts.delete(id1)
puts "list"
puts contacts.list

puts "search name"
puts contacts.search_name("Yaro")