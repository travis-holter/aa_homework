json.extract! @party, :name, :location

json.guests @party.guests do |guest|
    # json.array! @party.guests, :name, :gifts
    json.name guest.name
    json.gifts guest.gifts, :title
end