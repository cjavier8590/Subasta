<%@ page import="subasta.Oferta" %>

<div class="row">
  <div class="input-field col s7">
      <label for="precio_oferta">Precio de la Oferta</label>
      <input type="text" id="precio_oferta" name="precio_oferta" maxlength="10" value="${ofertaInstance?.precio_oferta}"/>
  </div>
  <input type="hidden" id="subasta" value="${subasta}"/>
  <input type="hidden" id="usuario" value="${usuario}"/>
  <input type="hidden" id="precio" value="${precio}"/>
  <div class="input-field col s2">
    <label id="boton_oferta" class="btn" style="color:white" onclick="aplicar_oferta(${subasta}, ${usuario}, ${precio}, $('#precio_oferta').val())">Ofertar</label>
  </div>
  
</div>

<script>
  function aplicar_oferta(subasta, usuario, precio, precio_oferta){
    if(precio_oferta >= precio) {
      Materialize.toast('El precio que ha ingresado es mayor o igual a la oferta mínima actual', 4000);
      $('#precio_oferta').focus()
      return false
      {}
    }
    else{
      ${remoteFunction(action:'ingresar_oferta', controller:'Usuario', params: '\'subasta=\' +subasta+ \'&usuario=\' + usuario+ \'&precio_oferta=\' +precio_oferta', asynchronous:'false')}
      ${remoteFunction(action:"lista_subastas", update:"contenedor_principal")}  
    }
  }
</script>
