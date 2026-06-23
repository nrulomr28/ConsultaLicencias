# Flujo de Autenticación

## Hallazgos

Inicialmente se detectó un problema de:

* ERR_TOO_MANY_REDIRECTS

Durante la investigación se identificó:

* Forms Authentication activo.
* FriendlyUrls activas.
* Membership Provider funcional.
* Roles funcionales.

## Login Real

El acceso principal se realiza mediante:

Default.aspx

No mediante:

Account/Login.aspx

## Flujo

Usuario
↓
Default.aspx
↓
ASP.NET Login Control
↓
Membership Provider
↓
Roles
↓
Menú principal

## Usuario de prueba

Consulta_ARCOIRIS

## Observaciones

Los archivos Account/Login.aspx y relacionados parecen provenir del template original de ASP.NET Web Forms y no forman parte del flujo principal del sistema.
