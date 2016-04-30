<%@ page import="subasta.Subasta" %>

<h4>Crear Subasta</h4>

<div class="row">
  <div class="input-field col s12">
    <label for="descripcion_subasta">Descripción</label>
    <textArea class="materialize-textarea" id="descripcion_subasta" name="descripcion_subasta" value="${subastaInstance?.descripcion_subasta}"></textarea>
  </div>
</div>

<div class="row">
  <div class="input-field col s2">
    <label for="fecha_creacion">Fecha de Creación</label>
  </div>
  <div class="input-field col s3">
    <input type="date" name="fecha_creacion" id="fecha_creacion" precision="day"  value="${subastaInstance?.fecha_creacion}" readonly='readonly' />
  </div>
  <div class="input-field col s2"></div>
  <div class="input-field col s2">
    <label for="fecha_creacion">Fecha de Entrega</label>
  </div>
  <div class="input-field col s3">
    <input type="date" name="fecha_limite" id="fecha_limite" precision="day"  value="${subastaInstance?.fecha_limite}"  />
  </div>
</div>


<div class="row">
  <div class="input-field col s4">
	<label for="precio_ganador">Precio Máximo Actual</label>
	<input type="text" name="precio_ganador" id="precio_ganador" maxlength="10" value="${subastaInstance?.precio_ganador}"/>
  </div>
  <div class="input-field col s4">
	<label for="duracion_minutos">Duración de la Subasta en Minutos</label>
	<input type="text" name="duracion_minutos" id="duracion_minutos" maxlength="10" value="${subastaInstance?.duracion_minutos}"/>
  </div>
</div>

<div class="row">
    <div class="input-field col s6">  
      <input type="file" id='inputId' name="foto"/>
      <g:if test="${subastaInstance?.imagen}">
      <img id="imgId" style="width:40%;height:40%;" src='${resource(dir:'FotoSubasta', file: subastaInstance?.imagen )}'></g:if>
      <g:else>
        <img id="imgId" style="width:40%;height:40%;" src=''>
      </g:else>
    </div>

</div>

<div id="alerta">
  
</div>



<input type="hidden" id="estado" value="${subastaInstance?.estado}" name="estado"/>
<input type="hidden" id="usuario" value="${usuario}" name="usuario"/>

<label onclick="agregar_subasta()" class="btn">Agregar Subasta</label>

<script>
  function agregar_subasta(){
    var descripcion = $("#descripcion_subasta").val()
    var fecha_crea = $("#fecha_creacion").val()
    var fecha_limite = $("#fecha_limite").val()
    var precio_ganador = $("#precio_ganador").val()
    var duracion_minutos = $("#duracion_minutos").val()
    var usuario = $("#sesion").val()
    
    var fecha_cierre = (new Date(new Date().getTime() + duracion_minutos*60000))
    
            
    var fd = new FormData();    
    fd.append('foto', $('#inputId')[0].files[0]);
    fd.append('descripcion', descripcion)
    fd.append('fecha_crea', fecha_crea)
    fd.append('fecha_limite', fecha_limite)
    fd.append('precio_ganador', precio_ganador)
    fd.append('duracion_minutos', duracion_minutos)
    
    fd.append('usuario', usuario)
      $.ajax({
      url: '/Subasta/Usuario/guarda_subasta',
      async:false,
      data: 
       fd,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function(data){
        $("#alerta").html(data);
      }
    }); 
            
            
    {}
  }
  
  $("#inputId").change(function(){
    $("#imgId").attr('src', $(this).val())
  })
  
  $(document).ready(function(){
    function loadFileFromInput(input,typeData) {
        var reader,
            fileLoadedEvent,
            files = input.files;

        if (files && files[0]) {
            reader = new FileReader();

            reader.onload = function (e) {
                fileLoadedEvent = new CustomEvent('fileLoaded',{
                    detail:{
                        data:reader.result,
                        file:files[0]  
                    },
                    bubbles:true,
                    cancelable:true
                });
                input.dispatchEvent(fileLoadedEvent);
            }
            switch(typeData) {
                case 'arraybuffer':
                    reader.readAsArrayBuffer(files[0]);
                    break;
                case 'dataurl':
                    reader.readAsDataURL(files[0]);
                    break;
                case 'binarystring':
                    reader.readAsBinaryString(files[0]);
                    break;
                case 'text':
                    reader.readAsText(files[0]);
                    break;
            }
        }
    }
    function fileHandler (e) {
        var data = e.detail.data,
            fileInfo = e.detail.file;

        img.src = data;
     
    }
    var input = document.getElementById('inputId'),
        img = document.getElementById('imgId');

    input.onchange = function (e) {
        loadFileFromInput(e.target,'dataurl');
    };

    input.addEventListener('fileLoaded',fileHandler)
    
    
    
    
  })
</script>

