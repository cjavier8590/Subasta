<%@ page import="subasta.Usuario" %>

    <div class="row">
      <div class="input-field col s6">
          <label for="primer_nombre">Primer Nombre</label>
          <input type="text" id="primer_nombre" name="primer_nombre" maxlength="45" value="${usuarioInstance?.primer_nombre}" class="validate"/>
      </div>

      <div class="input-field col s6">
          <label for="segundo_nombre">Segundo Nombre</label>
          <input type="text" id="segundo_nombre" name="segundo_nombre" maxlength="45" value="${usuarioInstance?.segundo_nombre}" class="validate"/>
      </div>
    </div>

    <div class="row">
      <div class="input-field col s6">
          <label for="primer_apellido">Primer Apellido</label>
          <input type="text" id="primer_apellido" name="primer_apellido" maxlength="45" value="${usuarioInstance?.primer_apellido}" class="validate"/>
      </div>

      <div class="input-field col s6">
          <label for="segundo_apellido">Segundo Apellido</label>
          <input type="text" id="segundo_apellido" name="segundo_apellido" maxlength="45" value="${usuarioInstance?.segundo_apellido}" class="validate"/>
      </div>
    </div>

    <div class="row">
      <div class="input-field col s4">
          <label for="dpi">DPI</label>
          <input type="text" id="dpi" name="dpi" maxlength="13" value="${usuarioInstance?.dpi}" class="validate"/>
      </div>

      <div class="input-field col s4">
          <label for="telefono">No. Teléfono</label>
          <input type="text" id="telefono" name="telefono" maxlength="10" value="${usuarioInstance?.telefono}" class="validate"/>
      </div>

      <div class="input-field col s4">
          <label for="celular">No. Celular</label>
          <input type="text" id="celular" name="celular" maxlength="10" value="${usuarioInstance?.celular}" class="validate"/>
      </div>
    </div>

    <div class="row">
      <div class="input-field col s4">
          <label for="departamento">Departamento</label>
          <input type="text" id="departamento" name="departamento" maxlength="60" class="validate"/>
          <input type="hidden" id="id_departamento" name="id_departamento"/>
      </div>

      <div class="input-field col s4">
          <label for="municipio">Municipio</label>
          <input type="text" id="municipio" name="municipio" maxlength="60" value="${usuarioInstance?.municipio}" class="validate"/>
          <input type="hidden" id="id_municipio" name="id_municipio" value=""/>
      </div>

      <div class="input-field col s4">
          <label for="domicilio">Domicilio</label>
          <input type="text" id="domicilio" name="domicilio" maxlength="10" value="${usuarioInstance?.domicilio}" class="validate"/>
      </div>
    </div>

    <div class="row">
      <div class="input-field col s2">
        <label>Fecha de Nacimiento</label>
      </div>
      <div class="input-field col s4">
        <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" value="${usuarioInstance?.fecha_nacimiento}"/>
      </div>

      <div class="input-field col s2 offset 1"></div>

      <div class="input-field col s3">
        <label for="tipo_usuario">Tipo de Usuario</label>
        <input type="text" id="tipo_usuario" name="tipo_usuario" value="${usuarioInstance?.tipo_usuario?.id}"/>
        <input type="hidden" id="id_tipo_usuario" name="id_tipo_usuario" value="${usuarioInstance?.tipo_usuario?.nombre_usuario}"/>
      </div>
    </div>

    <div clas="row">
      <div class="input-field col s6">
        <label for="nombre_usuario">Correo Electrónico</label>
        <input type="text" id="nombre_usuario" name="nombre_usuario" value="${usuarioInstance?.nombre_usuario}"/>
      </div>
      <div class="input-field col s6">
        <label for="contrasenna">Contraseña</label>
        <input type="text" id="contrasenna" name="contrasenna" value="${usuarioInstance?.contrasenna}"/>
      </div>
    </div>
    
  <label class='btn' onclick="guardar_usuario()">Guardar Usuario</label>


<script>
  
  
  
  function guardar_usuario(){
    var primer_nombre = $("#primer_nombre").val()
    var segundo_nombre = $("#segundo_nombre").val()
    var primer_apellido = $("#primer_apellido").val()
    var segundo_apellido = $("#segundo_apellido").val()
    var dpi = $("#dpi").val()
    var telefono = $("#telefono").val()
    var celular = $("#celular").val()
    var municipio = $("#id_municipio").val()
    var domicilio = $("#domicilio").val()
    var fecha_nacimiento = $("#fecha_nacimiento").val()
    var tipo_usuario = $("#id_tipo_usuario").val()
    var nombre_usuario = $("#nombre_usuario").val()
    var contrasenna = $('#contrasenna').val()
    
    if(primer_nombre == '') {Materialize.toast('Debe ingresar su primer nombre', 4000); $("#primer_nombre").focus(); return false}
    if(primer_apellido == '') {Materialize.toast('Debe ingresar su primer apellido', 4000); $("#primer_apellido").focus(); return false}
    if(dpi == '') {Materialize.toast('Debe ingresar su DPI', 4000); $("#dpi").focus(); return false}
    if(celular == '') {Materialize.toast('Debe ingresar su número de celular', 4000); $("#celular").focus(); return false}
    if(domicilio == '') {Materialize.toast('Debe ingresar su domicilio', 4000); $("#domicilio").focus(); return false}
    if(fecha_nacimiento == '') {Materialize.toast('Debe ingresar su fecha de nacimiento', 4000); $("#fecha_nacimiento").focus(); return false}
    if(tipo_usuario == '') {Materialize.toast('Debe especificar su tipo de usuario', 4000); $("#tipo_usuario").focus(); return false}
    if(nombre_usuario == '') {Materialize.toast('Debe ingresar su número de usuario', 4000); $("#nombre_usuario").focus(); return false}
    if(contrasenna == '') {Materialize.toast('Debe llenar el campo de contrase;a', 4000); $("#contrasenna").focus(); return false}
    ${remoteFunction(action:'guardar_usuario', controller:'Usuario', params: '\'primer_nombre=\' +primer_nombre+ \'&segundo_nombre=\' + segundo_nombre+ \'&primer_apellido=\' + primer_apellido + \'&segundo_apellido=\' + segundo_apellido + \'&telefono=\' + telefono + \'&dpi=\' + dpi+ \'&celular=\' + celular+ \'&municipio=\' + municipio + \'&domicilio=\' + domicilio+ \'&fecha_nacimiento=\' + fecha_nacimiento+ \'&tipo_usuario=\' + tipo_usuario + \'&nombre_usuario=\' + nombre_usuario+ \'&contrasenna=\' + contrasenna', asynchronous: 'false', update:'alerta')} ;  
    
  
  
  }
  
  $.ajax({
      type: "GET",
      url: "/Subasta/Usuario/lista_departamento",
      dataType: "json",
      success : function(response) {
          var data =
              $.map(response, function(item){
                  return{
                      id: item.id,
                      value: item.nombre_departamento
                  }
              });
          $("#departamento").autocomplete({
              source: data,
              select: function (event, ui){                                                          
                  $("#id_departamento").val(ui.item.id);   
                  obtiene_muni(ui.item.id)
              }
          });
      }
   });
   
   
   function obtiene_muni(id){
      $.ajax({
          type: "GET",
          url: "/Subasta/Usuario/lista_municipio/" + id,
          dataType: "json",
          success : function(response) {
              var data =
                  $.map(response, function(item){
                      return{
                          id: item.id,
                          value: item.nombre_municipio
                      }
                  });
              $("#municipio").autocomplete({
                  source: data,
                  select: function (event, ui){                                                          
                      $("#id_municipio").val(ui.item.id);                           
                  }
              });
          }
       });
   }
   
   $.ajax({
      type: "GET",
      url: "/Subasta/Usuario/lista_tipo_usuario",
      dataType: "json",
      success : function(response) {
          var data =
              $.map(response, function(item){
                  return{
                      id: item.id,
                      value: item.descripcion_tipo_usuario
                  }
              });
          $("#tipo_usuario").autocomplete({
              source: data,
              select: function (event, ui){                                                          
                  $("#id_tipo_usuario").val(ui.item.id);                           
              }
          });
      }
   });
   
  
  {}
</script>


