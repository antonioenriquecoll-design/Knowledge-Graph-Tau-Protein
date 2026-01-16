# Semantic Knowledge Graph: Tau Protein (MAPT)

Repositorio dedicado al modelado, integración y explotación semántica de datos biológicos sobre la Proteína Tau (P10636) y su implicación en tauopatías.

## Estructura del Proyecto
* `/practica.ttl`: Grafo de conocimiento en formato Turtle (fuente).
* `/practica.rdf`: Dataset convertido a RDF/XML para interoperabilidad.
* `/consultas.R`: Script de integración y consulta SPARQL desde R.
* `/ESD_Practica_Tau_AntonioEnriqueCollMeseguer.pdf`: Documentación técnica completa.

## Stack Tecnológico
* **Ontologías:** UniProtKB, Disease Ontology (DOID), Gene Ontology (GO).
* **Modelo de Datos:** BioLink Model.
* **Infraestructura:** Blazegraph DB (Clúster Dayhoff) y túneles SSH.
* **Validación:** W3C Semantic Web Services y FAIRshake.

## Uso
El grafo permite identificar relaciones causales entre la proteína y enfermedades neurodegenerativas mediante consultas SPARQL, integrando metadatos funcionales y de localización celular bajo principios **FAIR**.

---
**Autor:** Antonio Enrique Coll Meseguer  
**Máster en Bioinformática - Universidad de Murcia**
