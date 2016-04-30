<table>
  <thead>
 
  </thead>
  <tbody style="width: 100%">
    <g:each in="${vector}" var="${vec}">
      <tr>
        <g:each in="${vec}" var="${v}">
          
          <td style="width: 33%">
            <g:if test="${v}">
              <h5 id='crono_${v.id}'></h5>
              <div class="card medium" style="width: 100%; height: 100%" id="${v.id}" ="obtener_restante('${v.fecha_cierre}', ${v.id})">
                
                <div class="card-image waves-effect waves-block waves-light">
                  <img class="activator" src="FotoSubasta/${v.foto}" onclick="obtener_restante('${v.fecha_cierre}', ${v.id})">
                </div>
                <div class="card-content">
                  <span style="font-size:20px; " class="card-title activator grey-text text-darken-4">La Subasta está en: Q.${v.precio_ganador} a favor de ${v.usuario_ganador } </span>
                  <p><a onclick="form_ofertar(${v.id}, ${v.precio_ganador})">Ofertar</a></p>
                  
                   <div id="oferta_${v.id}" style="width: 100%">
                    
                   </div>
                </div>
                <div class="card-reveal">
                  <span class="card-title grey-text text-darken-4"><i class="material-icons right">Cerrar</i></span>
                  <br><br><br>
                  <span>Subasta iniciada el <strong><g:formatDate format="dd-MM-yyyy HH:mm" date="${v.fecha_creacion}"/></strong></span><br>
                  <span>La subasta cierra el <strong><g:formatDate format="dd-MM-yyyy HH:mm:ss" date="${v.fecha_cierre}"/></strong></span><br>
                  <span>La fecha de entrega es <strong><g:formatDate format="dd-MM-yyyy" date="${v.fecha_limite}"/></strong></span><br>
                  
                  <span>Creado por ${v.usuario.primer_nombre + ' ' + v.usuario.segundo_nombre + ' ' + v.usuario.primer_apellido + ' ' + v.usuario.segundo_apellido}</span>
                  <br><br>
                  <span>Observaciones: </span><p>${v.descripcion_subasta}</p>
                  <br>
                  
                  <a onclick="form_ofertar(${v.id}, ${v.precio_ganador})">Ofertar</a>
                 
                </div>
                
              </div>
            </g:if>
              
          </td>
        </g:each>
      </tr> 
    </g:each>
    
  </tbody>
</tale>


  
<script>

  function obtener_restante(cierre, id){
    var intervalo = setInterval(function(){ 
      
    
      var date = new Date(cierre);
     var actual = new Date()
     if(actual < date){
     var diferencia = cierre- actual
     
      var h = date.getHours() - actual.getHours();
      
      var m = date.getMinutes() - actual.getMinutes();
      var s = date.getSeconds() - actual.getSeconds();
      console.log((h * 60 + m) + ':' + s)
      $("#crono_"+id).text("Finaliza en: "+(h * 60 + m) + ':' + s)
      if(s == 0 && m == 0){
        clearInterval(intervalo);
        ${remoteFunction(action:'cerrar_subasta', params:'\'id=\' +id')}
            }
      } 
      else{ ${remoteFunction(action:'cerrar_subasta', params:'\'id=\' +id')};${remoteFunction(action:'lista_subastas', update:'contenedor_principal')}}
    }, 1000);
    
  
     
  }
  
  function form_ofertar(id, precio){
    
    var usuario = $("#sesion").val()
    var subasta = id
    var precio = precio
    var updetear = 'oferta_'+id
    
    var fd = new FormData();    
      fd.append('subasta', subasta)
      fd.append('usuario', usuario)
      fd.append('precio', precio)
      $.ajax({
      url: '/Subasta/Usuario/form_ofertar',
      async:false,
      data: 
       fd,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function(data){
        $("#oferta_"+id).html(data);
      }
    });
{}
  }
</script>

