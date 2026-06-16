# Consulta Licencias - Arquitectura General

## Descripción

Consulta Licencias es un sistema ASP.NET Web Forms utilizado para consultar información histórica de licencias y documentos asociados.

El sistema es predecesor de SIGELIC y actualmente se encuentra en proceso de estabilización y documentación.

## Tecnologías

* ASP.NET Web Forms (.NET Framework 4.x)
* Entity Framework (EDMX)
* SQL Server
* Membership Provider ASP.NET
* Forms Authentication

## Componentes Principales

### Autenticación

* Forms Authentication
* ASP.NET Membership
* ASP.NET Roles

### Consultas

* Consulta.aspx
* ConsultaLicencias.aspx

### Recursos

* Imagen.ashx
* ImagenDocto.ashx
* ImagenFirma.ashx

### Base de Datos

* DBConcesiones (Autenticación)
* SILCVER (Información de negocio)

## Estado Actual

* Proyecto gitteado
* Manejo de errores institucional implementado
* FriendlyUrls estabilizadas
* Login funcional
* Consulta histórica pendiente de documentación
