//Funcion que borra la estructura del cuerpo principal del cuerpo si la hay y crea una nueva vacia**
function añadirSubCuerpo() {
    if (document.getElementById('subCuerpo')) {
        var child = document.getElementById('subCuerpo');
        child.parentNode.removeChild(child);
    }
    var parent = document.getElementById('cuerpo');
    var child = document.createElement('section');
    parent.appendChild(child);
    child.setAttribute('id', 'subCuerpo');
    return child;
}

function mostrarRegistro() {
    var subCuerpo = añadirSubCuerpo();

    var divTituloRegistro = document.createElement('div');
    subCuerpo.appendChild(divTituloRegistro);
    divTituloRegistro.setAttribute('class', 'text-center');

    var h1Registro = document.createElement('h1');
    divTituloRegistro.appendChild(h1Registro);
    var node = document.createTextNode('Registro');
    h1Registro.appendChild(node);

    var br = document.createElement('br');
    subCuerpo.appendChild(br);

    var ulNav = document.createElement('ul');
    subCuerpo.appendChild(ulNav);
    ulNav.setAttribute('class', 'nav nav-pills nav-fill');

    var liNavLogin = document.createElement('li');
    ulNav.appendChild(liNavLogin);
    liNavLogin.setAttribute('class', 'nav-item');

    var aNavLogin = document.createElement('a');
    liNavLogin.appendChild(aNavLogin);
    aNavLogin.setAttribute('class', 'nav-link');
    aNavLogin.setAttribute('href', '#');
    aNavLogin.setAttribute('onClick', 'mostrarLogin()');
    var node = document.createTextNode("Login");
    aNavLogin.appendChild(node);

    var liNavRegistro = document.createElement('li');
    ulNav.appendChild(liNavRegistro);
    liNavRegistro.setAttribute('class', 'nav-item');

    var aNavRegistro = document.createElement('a');
    liNavRegistro.appendChild(aNavRegistro);
    aNavRegistro.setAttribute('class', 'nav-link active');
    aNavRegistro.setAttribute('href', '#');
    var node = document.createTextNode("Registro");
    aNavRegistro.appendChild(node);

    var br = document.createElement('br');
    subCuerpo.appendChild(br);

    var divRegistrarse = document.createElement('div');
    subCuerpo.appendChild(divRegistrarse);

    //REGISTRO
    var divRegistro = document.createElement('div');
    divRegistrarse.appendChild(divRegistro);
    divRegistro.setAttribute('class', 'col-6 offset-3');

    var divCuerpoRegistro = document.createElement('div');
    divRegistro.appendChild(divCuerpoRegistro);
    divCuerpoRegistro.setAttribute('class', 'text-center');

    var formRegistro = document.createElement('form');
    divCuerpoRegistro.appendChild(formRegistro);
    formRegistro.setAttribute('action', '../servlet_registroUsuario');

    var h5Nombre = document.createElement('h5');
    formRegistro.appendChild(h5Nombre);
    var node = document.createTextNode('Nombre');
    h5Nombre.appendChild(node);

    var inputNombre = document.createElement('input');
    formRegistro.appendChild(inputNombre);
    inputNombre.setAttribute('type', 'text');
    inputNombre.setAttribute('class', 'form-control col-8 offset-2');
    inputNombre.setAttribute('name', 'nombreRegistro');
    inputNombre.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5Apellidos = document.createElement('h5');
    formRegistro.appendChild(h5Apellidos);
    var node = document.createTextNode('Apellidos');
    h5Apellidos.appendChild(node);

    var inputApellidos = document.createElement('input');
    formRegistro.appendChild(inputApellidos);
    inputApellidos.setAttribute('type', 'text');
    inputApellidos.setAttribute('class', 'form-control col-8 offset-2');
    inputApellidos.setAttribute('name', 'apellidosRegistro');
    inputApellidos.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5DNI = document.createElement('h5');
    formRegistro.appendChild(h5DNI);
    var node = document.createTextNode('DNI');
    h5DNI.appendChild(node);

    var inputDNI = document.createElement('input');
    formRegistro.appendChild(inputDNI);
    inputDNI.setAttribute('type', 'text');
    inputDNI.setAttribute('class', 'form-control col-8 offset-2');
    inputDNI.setAttribute('name', 'dniRegistro');
    inputDNI.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5Nacimiento = document.createElement('h5');
    formRegistro.appendChild(h5Nacimiento);
    var node = document.createTextNode('Fecha de Nacimiento');
    h5Nacimiento.appendChild(node);

    var divNacimiento = document.createElement('div');
    formRegistro.appendChild(divNacimiento);
    divNacimiento.setAttribute("class", "row");


    var inputNacimientoDia = document.createElement('select');
    divNacimiento.appendChild(inputNacimientoDia);
    inputNacimientoDia.setAttribute('class', 'form-control col-2 offset-2');
    inputNacimientoDia.setAttribute('name', 'diaNacimientoRegistro');

    for (var i = 1; i <= 31; i++) {
        var option = document.createElement('option');
        inputNacimientoDia.appendChild(option);
        option.setAttribute("value", i);

        var node = document.createTextNode(i);
        option.appendChild(node);
    }

    var inputNacimientoMes = document.createElement('select');
    divNacimiento.appendChild(inputNacimientoMes);
    inputNacimientoMes.setAttribute('class', 'form-control col-2 offset-1');
    inputNacimientoMes.setAttribute('name', 'mesNacimientoRegistro');
    
    for (var i = 1; i <= 12; i++) {
        var option = document.createElement('option');
        inputNacimientoMes.appendChild(option);
        option.setAttribute("value", i - 1);

        var node = document.createTextNode(i);
        option.appendChild(node);
    }

    var inputNacimientoAnno = document.createElement('select');
    divNacimiento.appendChild(inputNacimientoAnno);
    inputNacimientoAnno.setAttribute('class', 'form-control col-2 offset-1');
    inputNacimientoAnno.setAttribute('name', 'annoNacimientoRegistro');

    var num = new Date().getFullYear() - 18;

    for (var i = num; i >= num - 100; i--) {
        var option = document.createElement('option');
        inputNacimientoAnno.appendChild(option);
        option.setAttribute("value", i - 1900);

        var node = document.createTextNode(i);
        option.appendChild(node);
    }

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5Poblacion = document.createElement('h5');
    formRegistro.appendChild(h5Poblacion);
    var node = document.createTextNode('Poblacion');
    h5Poblacion.appendChild(node);

    var inputPoblacion = document.createElement('input');
    formRegistro.appendChild(inputPoblacion);
    inputPoblacion.setAttribute('type', 'text');
    inputPoblacion.setAttribute('class', 'form-control col-8 offset-2');
    inputPoblacion.setAttribute('name', 'poblacionRegistro');
    inputPoblacion.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5Pais = document.createElement('h5');
    formRegistro.appendChild(h5Pais);
    var node = document.createTextNode('País');
    h5Pais.appendChild(node);

    var inputPais = document.createElement('input');
    formRegistro.appendChild(inputPais);
    inputPais.setAttribute('type', 'text');
    inputPais.setAttribute('class', 'form-control col-8 offset-2');
    inputPais.setAttribute('name', 'paisRegistro');
    inputPais.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5Direccion = document.createElement('h5');
    formRegistro.appendChild(h5Direccion);
    var node = document.createTextNode('Dirección');
    h5Direccion.appendChild(node);

    var inputDireccion = document.createElement('input');
    formRegistro.appendChild(inputDireccion);
    inputDireccion.setAttribute('type', 'text');
    inputDireccion.setAttribute('class', 'form-control col-8 offset-2');
    inputDireccion.setAttribute('name', 'direccionRegistro');
    inputDireccion.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5Correo = document.createElement('h5');
    formRegistro.appendChild(h5Correo);
    var node = document.createTextNode('Email');
    h5Correo.appendChild(node);

    var inputCorreo = document.createElement('input');
    formRegistro.appendChild(inputCorreo);
    inputCorreo.setAttribute('type', 'email');
    inputCorreo.setAttribute('class', 'form-control col-8 offset-2');
    inputCorreo.setAttribute('name', 'correoRegistro');
    inputCorreo.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var h5Clave = document.createElement('h5');
    formRegistro.appendChild(h5Clave);
    var node = document.createTextNode('Contraseña');
    h5Clave.appendChild(node);

    var inputClave = document.createElement('input');
    formRegistro.appendChild(inputClave);
    inputClave.setAttribute('type', 'password');
    inputClave.setAttribute('class', 'form-control col-8 offset-2');
    inputClave.setAttribute('name', 'claveRegistro');
    inputClave.required = true;

    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var botonRegistro = document.createElement('button');
    formRegistro.appendChild(botonRegistro);
    botonRegistro.setAttribute('type', 'submit');
    botonRegistro.setAttribute('class', 'btn btn-primary');
    var node = document.createTextNode('Registro');
    botonRegistro.appendChild(node);

    var br = document.createElement('br');
    formRegistro.appendChild(br);
    var br = document.createElement('br');
    formRegistro.appendChild(br);

    var aVendedor = document.createElement('a');
    divCuerpoRegistro.appendChild(aVendedor);
    aVendedor.setAttribute('href', 'vista_registroVendedor.jsp');
    var node = document.createTextNode('Quiero registrarme como vendedor');
    aVendedor.appendChild(node);
}

function mostrarLogin() {
    var subCuerpo = añadirSubCuerpo();

    var divTituloIdentificacion = document.createElement('div');
    subCuerpo.appendChild(divTituloIdentificacion);
    divTituloIdentificacion.setAttribute('class', 'text-center col-6 offset-3');

    var h1Identificacion = document.createElement('h1');
    divTituloIdentificacion.appendChild(h1Identificacion);
    var node = document.createTextNode('Identificación');
    h1Identificacion.appendChild(node);

    var br = document.createElement('br');
    subCuerpo.appendChild(br);

    var ulNav = document.createElement('ul');
    subCuerpo.appendChild(ulNav);
    ulNav.setAttribute('class', 'nav nav-pills nav-fill');

    var liNavLogin = document.createElement('li');
    ulNav.appendChild(liNavLogin);
    liNavLogin.setAttribute('class', 'nav-item');

    var aNavLogin = document.createElement('a');
    liNavLogin.appendChild(aNavLogin);
    aNavLogin.setAttribute('class', 'nav-link active');
    aNavLogin.setAttribute('href', '#');
    var node = document.createTextNode("Login");
    aNavLogin.appendChild(node);

    var liNavRegistro = document.createElement('li');
    ulNav.appendChild(liNavRegistro);
    liNavRegistro.setAttribute('class', 'nav-item');

    var aNavRegistro = document.createElement('a');
    liNavRegistro.appendChild(aNavRegistro);
    aNavRegistro.setAttribute('class', 'nav-link');
    aNavRegistro.setAttribute('href', '#');
    aNavRegistro.setAttribute('onClick', 'mostrarRegistro()');
    var node = document.createTextNode("Registro");
    aNavRegistro.appendChild(node);

    var br = document.createElement('br');
    subCuerpo.appendChild(br);

    var divLogin = document.createElement('div');
    subCuerpo.appendChild(divLogin);

    //IDENTIFICACION
    var divIdentificacion = document.createElement('div');
    divLogin.appendChild(divIdentificacion);
    divIdentificacion.setAttribute('class', 'col-6 offset-3');

    var divCuerpoIdentificacion = document.createElement('div');
    divIdentificacion.appendChild(divCuerpoIdentificacion);
    divCuerpoIdentificacion.setAttribute('class', 'text-center');

    var formIdentificacion = document.createElement('form');
    divCuerpoIdentificacion.appendChild(formIdentificacion);
    formIdentificacion.setAttribute('action', '../servlet_loginUsuario');

    var br = document.createElement('br');
    formIdentificacion.appendChild(br);
    var br = document.createElement('br');
    formIdentificacion.appendChild(br);
    var br = document.createElement('br');
    formIdentificacion.appendChild(br);

    var h5DNI = document.createElement('h5');
    formIdentificacion.appendChild(h5DNI);
    var node = document.createTextNode('DNI');
    h5DNI.appendChild(node);

    var inputDNI = document.createElement('input');
    formIdentificacion.appendChild(inputDNI);
    inputDNI.setAttribute('type', 'text');
    inputDNI.setAttribute('class', 'form-control col-8 offset-2');
    inputDNI.setAttribute('id', 'dniIdentificacion');
    inputDNI.setAttribute('name', 'dniUsuario');
    inputDNI.required = true;

    var br = document.createElement('br');
    formIdentificacion.appendChild(br);
    var br = document.createElement('br');
    formIdentificacion.appendChild(br);
    var br = document.createElement('br');
    formIdentificacion.appendChild(br);

    var h5Clave = document.createElement('h5');
    formIdentificacion.appendChild(h5Clave);
    var node = document.createTextNode('Contraseña');
    h5Clave.appendChild(node);

    var inputClave = document.createElement('input');
    formIdentificacion.appendChild(inputClave);
    inputClave.setAttribute('type', 'password');
    inputClave.setAttribute('class', 'form-control col-8 offset-2');
    inputClave.setAttribute('id', 'claveIdentificacion');
    inputClave.setAttribute('name', 'passUsuario');
    inputClave.required = true;

    var br = document.createElement('br');
    formIdentificacion.appendChild(br);
    var br = document.createElement('br');
    formIdentificacion.appendChild(br);
    var br = document.createElement('br');
    formIdentificacion.appendChild(br);

    var botonLogin = document.createElement('button');
    formIdentificacion.appendChild(botonLogin);
    botonLogin.setAttribute('type', 'submit');
    botonLogin.setAttribute('class', 'btn btn-primary');
    var node = document.createTextNode('Login');
    botonLogin.appendChild(node);
}