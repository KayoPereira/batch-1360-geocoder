class AirlineTicket < ApplicationRecord
  belongs_to :flight

  enum origin: {
    azul: "Azul",
    gol: "Gol",
    latam: "LATAM",
    avianca: "Avianca",
    tap: "TAP",
    delta: "Delta",
    united: "United",
    american: "American",
    air_canada: "Air Canada",
    air_france: "Air France",
    british_airways: "British Airways",
    lufthansa: "Lufthansa",
    qatar_airways: "Qatar Airways",
    emirates: "Emirates"
  }

  enum ticket_type: {
    economy: "Econômica",
    executive: "Executiva",
    first_class: "Primeira classe"
  }
end
