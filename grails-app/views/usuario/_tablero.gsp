
<input type="hidden" id="sesion" value="${usuario.id}"/>
<g:if test="${usuario.tipo_usuario.id == 1}">
    <nav>
      <div class="nav-wrapper teal">
        <!--<a href="#" class="brand-logo">Logo</a>-->
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li style="padding:5px">Bienvenido ${usuario.primer_nombre + ' ' + usuario.primer_apellido}</li>
          <li style="padding:5px" onclick="crear_subasta()"><a>Crear Subasta</a></li>
          <li style="padding:5px" onclick="listar()">Ver Todas las Subastas</li>
          <li style="padding:5px" onclick="mis_subastas()">Ver Mis Subastas Creadas</li>
        </ul>
      </div>
    </nav>
</g:if>
<g:else>
  <nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Logo</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li>Bienvenido ${usuario.primer_nombre + ' ' + usuario.primer_apellido}</li>
        <li onclick="listar()">Buscar Subasta</li>
        <li><a href="collapsible.html">JavaScript</a></li>
      </ul>
    </div>
  </nav>
</g:else>

<div id="contenedor_principal" class="container">


</div>

<script>
  
  function listar(){
    ${remoteFunction(action:"lista_subastas", update:"contenedor_principal")}
  }
  listar()
  
  function mis_subastas(){
    id = $("#sesion").val()
    ${remoteFunction(action:"mis_subastas", update:"contenedor_principal", params: '\'id=\' +id')}
  }
  
  
  
  localStorage.setItem("usuario", $("#sesion").val())
  function crear_subasta(){
    ${remoteFunction(action:'form_nueva_subasta', update:'contenedor_principal')}
  }
</script>

