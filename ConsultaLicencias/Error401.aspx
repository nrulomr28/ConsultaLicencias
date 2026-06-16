<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Acceso Restringido</title>

    <style>
        body {
            margin: 0;
            font-family: Segoe UI, Arial;
            background: #f4f6f9;
        }

        .header {
            background: #0b2d52;
            color: white;
            padding: 15px;
            font-size: 22px;
            font-weight: bold;
        }

        .panel {
            width: 700px;
            margin: 60px auto;
            background: white;
            border: 1px solid #ddd;
            padding: 40px;
            text-align: center;
        }

        .codigo {
            font-size: 90px;
            color: #0b2d52;
            font-weight: bold;
        }

        .titulo {
            font-size: 28px;
            margin-top: 15px;
        }

        .mensaje {
            margin-top: 20px;
            color: #555;
            font-size: 16px;
        }

        .boton {
            margin-top: 30px;
            display: inline-block;
            background: #0b2d52;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <div class="header">
        Consulta Licencias
    </div>

    <div class="panel">
        <div class="codigo">401</div>

        <div class="titulo">
            Acceso Restringido
        </div>

        <div class="mensaje">
            No cuenta con permisos para acceder a este recurso.
            <br /><br />
            Si considera que esto es un error,
            comuníquese con el administrador del sistema.
        </div>

        <a href="Default.aspx" class="boton">
            Volver al Inicio
        </a>
    </div>
    <hr />
<div style="font-size:11px;color:#888;">
    Sistema Consulta de Licencias - SSP Veracruz
</div>
</body>
</html>