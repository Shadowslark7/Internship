require 'securerandom'
class Contact
  attr_accessor :name, :phone, :address
  def initialize(name, phone, address)
    @name = name
    @phone = phone
    @address = address
  end
end

class Contacts
  def initialize
    @contacts = {}
  end
  
  def add(contact)
    id = id_sec
    @contacts[id] = contact
    id
  end
  def list
    @contacts
  end

  def update(id, contact)
    return false unless @contacts[id]
    @contacts[id] = contact
    return true
  end

  def update_phone(id, phone)
    return false unless @contacts[id]
    @contacts[id].phone = phone
    return true
  end

  def delete(id)
    @contacts.delete(id)
    return true
  end

  def search_name(name)
    @contacts.select { |id,contact| contact.name == name }
  end

  def sorted_list
    contacts_new = []
    @contacts.each do |id, contact|
      contacts_new.push(contact.name)
    end
    return contacts_new.sort
    #contacts_new = []
    #contacts_new.push(@contact.name)
    #@contacts_new.select { |id,contact| contact.name == name }
    #return contacts_new.sort
  end
  
  private
  def id_sec
    SecureRandom.alphanumeric(3)
  end
end

contact1 = Contact.new( 'Stepan', '123456', 'Stryi' )
contact2 = Contact.new( 'Bogdan', '456789', 'Manevychi' )
contact3 = Contact.new( 'Yaro','741852', 'Shors' )
contact4 = Contact.new( 'Qwerty','789456', 'Da' )
contact5 = Contact.new( 'Zxcvbn','855203', 'No' )
contacts = Contacts.new

add_contact1 = contacts.add(contact1)
add_contact2 = contacts.add(contact2)
add_contact3 = contacts.add(contact3)

puts "add"
puts add_contact1
puts add_contact2
puts add_contact3

puts "update"
puts contacts.update(add_contact3, contact4)
puts contacts.list

puts "update_phone"
puts contacts.update_phone(add_contact1, 888888)
puts add_contact1
puts contacts.list

puts "delete"
puts contacts.delete(add_contact2)
puts contacts.list

puts "search name"
puts contacts.search_name("Stepan") 

puts "sorted list"
print contacts.sorted_list