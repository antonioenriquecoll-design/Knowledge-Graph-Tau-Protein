# Instalación y carga de la librería
if (!require("SPARQL")) install.packages("SPARQL", repos='http://cran.us.r-project.org')
library(SPARQL)

# Configuración del endpoint (Usamos localhost porque el túnel está abierto)
endpoint <- "http://localhost:3034/blazegraph/sparql"

# Definimos una consulta de ejemplo (Enfermedades asociadas a Tau)
query <- "
PREFIX biolink: <https://w3id.org/biolink/vocab/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?enfermedad WHERE {
  <http://purl.uniprot.org/uniprot/P10636> biolink:causes_condition ?id .
  ?id rdfs:label ?enfermedad .
}"

# Ejecución
print("Ejecutando consulta sobre Blazegraph...")
res <- SPARQL(endpoint, query)

# Mostrar resultados por pantalla
print(res$results)
