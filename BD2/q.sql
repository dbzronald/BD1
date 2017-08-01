select "Evento", count("Evento") as cantidad_participantes
from "Corrida"
group by "Evento"

