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

    var h5Nombre = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5Nombre);
    var node = document.createTextNode('Nombre');
    h5Nombre.appendChild(node);

    var inputNombre = document.createElement('input');
    divCuerpoRegistro.appendChild(inputNombre);
    inputNombre.setAttribute('type', 'text');
    inputNombre.setAttribute('class', 'form-control col-8 offset-2');
    inputNombre.setAttribute('id', 'nombreRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var h5Apellidos = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5Apellidos);
    var node = document.createTextNode('Apellidos');
    h5Apellidos.appendChild(node);

    var inputApellidos = document.createElement('input');
    divCuerpoRegistro.appendChild(inputApellidos);
    inputApellidos.setAttribute('type', 'text');
    inputApellidos.setAttribute('class', 'form-control col-8 offset-2');
    inputApellidos.setAttribute('id', 'apellidosRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var h5DNI = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5DNI);
    var node = document.createTextNode('DNI');
    h5DNI.appendChild(node);

    var inputDNI = document.createElement('input');
    divCuerpoRegistro.appendChild(inputDNI);
    inputDNI.setAttribute('type', 'text');
    inputDNI.setAttribute('class', 'form-control col-8 offset-2');
    inputDNI.setAttribute('id', 'dniRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var h5Poblacion = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5Poblacion);
    var node = document.createTextNode('Poblacion');
    h5Poblacion.appendChild(node);

    var inputPoblacion = document.createElement('input');
    divCuerpoRegistro.appendChild(inputPoblacion);
    inputPoblacion.setAttribute('type', 'text');
    inputPoblacion.setAttribute('class', 'form-control col-8 offset-2');
    inputPoblacion.setAttribute('id', 'poblacionRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var h5Pais = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5Pais);
    var node = document.createTextNode('País');
    h5Pais.appendChild(node);

    var inputPais = document.createElement('input');
    divCuerpoRegistro.appendChild(inputPais);
    inputPais.setAttribute('type', 'text');
    inputPais.setAttribute('class', 'form-control col-8 offset-2');
    inputPais.setAttribute('id', 'paisRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var h5Direccion = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5Direccion);
    var node = document.createTextNode('Dirección');
    h5Direccion.appendChild(node);

    var inputDireccion = document.createElement('input');
    divCuerpoRegistro.appendChild(inputDireccion);
    inputDireccion.setAttribute('type', 'text');
    inputDireccion.setAttribute('class', 'form-control col-8 offset-2');
    inputDireccion.setAttribute('id', 'direccionRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var h5Correo = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5Correo);
    var node = document.createTextNode('Email');
    h5Correo.appendChild(node);

    var inputCorreo = document.createElement('input');
    divCuerpoRegistro.appendChild(inputCorreo);
    inputCorreo.setAttribute('type', 'email');
    inputCorreo.setAttribute('class', 'form-control col-8 offset-2');
    inputCorreo.setAttribute('id', 'correoRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var h5Clave = document.createElement('h5');
    divCuerpoRegistro.appendChild(h5Clave);
    var node = document.createTextNode('Clave');
    h5Clave.appendChild(node);

    var inputClave = document.createElement('input');
    divCuerpoRegistro.appendChild(inputClave);
    inputClave.setAttribute('type', 'password');
    inputClave.setAttribute('class', 'form-control col-8 offset-2');
    inputClave.setAttribute('id', 'claveRegistro');

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);

    var botonRegistro = document.createElement('button');
    divCuerpoRegistro.appendChild(botonRegistro);
    botonRegistro.setAttribute('type', 'button');
    botonRegistro.setAttribute('class', 'btn btn-warning');
    botonRegistro.setAttribute('href', '../servlet_registroUsuario');
    var node = document.createTextNode('Registro');
    botonRegistro.appendChild(node);

    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);
    var br = document.createElement('br');
    divCuerpoRegistro.appendChild(br);
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

    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);
    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);
    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);

    var h5DNI = document.createElement('h5');
    divCuerpoIdentificacion.appendChild(h5DNI);
    var node = document.createTextNode('DNI');
    h5DNI.appendChild(node);

    var inputDNI = document.createElement('input');
    divCuerpoIdentificacion.appendChild(inputDNI);
    inputDNI.setAttribute('type', 'text');
    inputDNI.setAttribute('class', 'form-control col-8 offset-2');
    inputDNI.setAttribute('id', 'dniIdentificacion');

    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);
    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);
    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);

    var h5Clave = document.createElement('h5');
    divCuerpoIdentificacion.appendChild(h5Clave);
    var node = document.createTextNode('Clave');
    h5Clave.appendChild(node);

    var inputClave = document.createElement('input');
    divCuerpoIdentificacion.appendChild(inputClave);
    inputClave.setAttribute('type', 'password');
    inputClave.setAttribute('class', 'form-control col-8 offset-2');
    inputClave.setAttribute('id', 'claveIdentificacion');

    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);
    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);
    var br = document.createElement('br');
    divCuerpoIdentificacion.appendChild(br);

    var botonIdentificacion = document.createElement('button');
    divCuerpoIdentificacion.appendChild(botonIdentificacion);
    botonIdentificacion.setAttribute('type', 'button');
    botonIdentificacion.setAttribute('class', 'btn btn-warning');
    botonIdentificacion.setAttribute('href', '');
    var node = document.createTextNode('Identifícate');
    botonIdentificacion.appendChild(node);
}