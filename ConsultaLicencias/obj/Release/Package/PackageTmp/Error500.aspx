<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Error Interno</title>

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
            color: #b22222;
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
        <div class="codigo">500</div>

        <div class="titulo">
            Error Interno del Sistema
        </div>

        <div class="mensaje">
            Ocurrió un problema al procesar su solicitud.
            <br /><br />
            El incidente ha sido registrado automáticamente.
            <br />
            Intente nuevamente en unos minutos.
        </div>

        <a href="/Acceso/Default.aspx" class="boton">
            Volver al Inicio
        </a>
    </div>

</body>
</html>