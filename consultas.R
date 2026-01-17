# 1. Instalación y carga de la librería
if (!require("SPARQL")) install.packages("SPARQL", repos='http://cran.us.r-project.org')
library(SPARQL)

# 2. Configuración del endpoint
# Asegúrate de tener el túnel SSH abierto: ssh -L 3034:localhost:3034 alumno05@dayhoff.inf.um.es
endpoint <- "http://localhost:3034/blazegraph/sparql"

# Prefijos comunes
prefixes <- "
PREFIX biolink: <https://w3id.org/biolink/vocab/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/uniprot/>
"

# ------------------------------------------------------------------------------
# CONSULTA 1: Verificación de integridad (Total de tripletas)
# ------------------------------------------------------------------------------
q1 <- paste(prefixes, "SELECT * WHERE { ?s ?p ?o }")
print("--- Consulta 1: Listado completo de tripletas ---")
res1 <- SPARQL(endpoint, q1)
print(res1$results)

# ------------------------------------------------------------------------------
# CONSULTA 2: Localización celular (Filtro por Gene Ontology)
# ------------------------------------------------------------------------------
q2 <- paste(prefixes, "SELECT ?lugar WHERE { up:P10636 biolink:active_in ?id . ?id rdfs:label ?lugar . }")
print("--- Consulta 2: Localización celular (GO) ---")
res2 <- SPARQL(endpoint, q2)
print(res2$results)

# ------------------------------------------------------------------------------
# CONSULTA 3: Tauopatías asociadas (Disease Ontology)
# ------------------------------------------------------------------------------
q3 <- paste(prefixes, "SELECT ?enfermedad WHERE { up:P10636 biolink:causes_condition ?id . ?id rdfs:label ?enfermedad . }")
print("--- Consulta 3: Patologías relacionadas (DOID) ---")
res3 <- SPARQL(endpoint, q3)
print(res3$results)

# ------------------------------------------------------------------------------
# CONSULTA 4: Funciones de Unión (Regex Filter)
# ------------------------------------------------------------------------------
q4 <- paste(prefixes, "SELECT ?funcion WHERE { ?s rdfs:label ?funcion . FILTER regex(?funcion, 'binding', 'i') }")
print("--- Consulta 4: Funciones de tipo 'binding' ---")
res4 <- SPARQL(endpoint, q4)
print(res4$results)

# ------------------------------------------------------------------------------
# CONSULTA 5: Estadísticas del grafo (Count)
# ------------------------------------------------------------------------------
q5 <- paste(prefixes, "SELECT (COUNT(?p) AS ?total_relaciones) WHERE { ?s ?p ?o . }")
print("--- Consulta 5: Conteo total de relaciones ---")
res5 <- SPARQL(endpoint, q5)
print(res5$results)
