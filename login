<!DOCTYPE html>
<html>

    <head>
        <title>Iniciar Sesion</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <script>
        $(document).ready(function () {
            $("#loginForm").submit(function (event) {
                event.preventDefault();

                var nombre_usuario = $("#nombre_usuario").val();
                var contrasena = $("#contrasena").val();
                var email = $("#email").val();

                var data = {
                    nombre_usuario: nombre_usuario,
                    contrasena: contrasena,
                    email: email
                };

                // Realizar la solicitud AJAX para verificar la autenticación
                $.ajax({
                    type: "POST",
                    url: "confirmar_login.php",
                    data: data,
                    success: function (response) {
                        console.log(response)
                        if (response === "Inicio Exitoso") {
                            $("#mensajeSuccess").html("Inicio de Sesion Exitoso");
                            $("#mensajeSuccess").show(); // Mostrar mensaje de éxito
                            $("#mensajeError").hide();  // Ocultar mensaje de error
                            window.location.href="index_mns.html";
                        } else {
                            $("#mensajeError").html("Usuario o contrasena incorrectos.");
                            $("#mensajeError").show(); // Mostrar mensaje de error
                            $("#mensajeSuccess").hide();  // Ocultar mensaje de exito
                        }
                    }
                });
            });
        });

    </script>

    </head>
    <style>
    body{
        text-align: center;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-size: medium;
    }
</style>
    <main class="servicio">
        <div class="servicio-contenido container"> </div>
    </main>
    <body class="bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card mt-5">
                        <div class="card-header bg-primary text-white">Iniciar
                            Sesion Sistema</div>
                        <div class="card-body">
                            <div class='alert alert-success' id="mensajeSuccess"
                                style="display: none;"></div>
                            <div class='alert alert-danger' id="mensajeError"
                                style="display: none;"></div>
                            <form id="loginForm">
                                <div class="form-group">
                                    <label for="nombre_usuario">Usuario</label>
                                    <input type="text" class="form-control"
                                        name="nombre_usuario"
                                        id="nombre_usuario"
                                        placeholder="Usuario" required>
                                </div>
                                <div class="form-group">
                                    <label for="contrasena">Contrasena</label>
                                    <input type="password" class="form-control"
                                        name="contrasena" id="contrasena"
                                        placeholder="Contrasena" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control"
                                        name="email" id="email"
                                        placeholder="Email" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Iniciar
                                    Sesion</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
