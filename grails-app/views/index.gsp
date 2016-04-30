<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
                <script>
                  

                  
                  
                  
                  
                  function crea_usuario(){                                        
                    ${remoteFunction(action:'visualiza_crear_usuario', controller:'Usuario', update:'contenedor')}
                  }
                  
                  function ingresar(){
                    var usuario = $("#usuario").val()
                    var contrasenna = $("#contrasenna").val()
                    ${remoteFunction(action:'ingresar', controller:'Usuario', params: '\'usuario=\' +usuario+ \'&contrasenna=\' + contrasenna', update:'cuerpo')}
                  }
          {}          
        </script>  
	</head>
	<body>
    
    
    
    
    
    
    
    
    
    
    
    
    
          <div id="cuerpo">
          <div class="container">
            
              <h4 class="center-align">Transubastas, su envío en un clic</h4>
            
              <div class="row" id="contenedor">
                <div class="input-field col s4 offset s3">
                  <div class="card hoverable">
                    <div class="card-image waves-effect waves-block waves-light">
                      <img class="activator" src="images/logo_transubasta.jpg">
                    </div>
                    <div class="card-content">
                      <span class="card-title activator grey-text text-darken-4">Transubastas</span>
<!--                      <p><a href="#">This is a link</a></p>-->
                    </div>
                    <div class="card-reveal">
                      <span class="card-title grey-text text-darken-4">Somos<i class="material-icons right">X</i></span>
                      <p>Una empresa dedicada al alojamiento de subastas en línea, con el propósito de dar a conocer productos que nuestros clientes necesiten transportar a determinado lugar</p>
                    </div>
                  </div>
                </div>
                
                <div class="input-field col s2"></div>
                  <div class="input-field col s6">
                    <div class="card grey darken-1">
                      <div class="card-content white-text">
                        <span class="card-title center-align">Login</span>
                        <div class="row">
                          <div class="input-field col s12">
                            <input type="text" id="usuario" name="usuario" class="validate"/>
                            <label for="usuario">Nombre de Usuario</label>
                          </div>
                        </div>
                        <div class="row">
                          <div class="input-field col s12">
                            <input type="password" id="contrasenna" name="contrasenna" class="validate"/>
                            <label for="contrasenna">Contraseña</label>
                          </div>
                        </div>                                                
                      </div>
                      <div class="card-action">
                        <a onclick="ingresar()">Ingresar</a>
                        <a onclick="crea_usuario()">Crear Cuenta</a>
                      </div>
                    </div>
                  </div>                
              </div>              
          </div>  
            
         </div>
	</body>
        
        
</html>
