class Flight < ApplicationRecord
  has_many :airline_tickets, dependent: :destroy

  enum aircraft: {
    airbus_a320: "Airbus A320 Family",
    boeing737: "Boeing 737",
    boeing787: "Boeing 787 Dreamliner",
    airbus_a330: "Airbus A330",
    boeing777: "Boeing 777",
    airbus_a350: "Airbus A350",
    embraer_jets: "Embraer E-Jets",
    bombardier_crj: "Bombardier CRJ Series",
    airbus_a380: "Airbus A380",
    boeing747: "Boeing 747"
  }
end
