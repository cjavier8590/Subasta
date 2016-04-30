package subasta

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.deep.JSON
import org.hibernate.Session
import groovy.time.TimeCategory

class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def visualiza_crear_usuario(){
        render(template:'form')
    }
    
    def guardar_usuario(){
        print(params)
        
        String f = params.fecha_nacimiento        
        def date1 = new Date().parse("yyyy-M-d", f)
        def busqueda = Usuario.find("from Usuario where nombre_usuario = '${params.nombre_usuario}'")
        if(busqueda){
            render(template:'/mensaje', model:[mensaje:'existe'])
        }
        else{
            def usuario = new Usuario(primer_nombre: params.primer_nombre, segundo_nombre: params.segundo_nombre, primer_apellido: params.primer_apellido,
                segundo_apellido: params.segundo_apellido, dpi: params.dpi, fecha_nacimiento:date1, telefono:params.telefono, celular:params.celular,
                domicilio:params.domicilio, nombre_usuario:params.nombre_usuario, contrasenna:params.contrasenna, tipo_usuario:Tipo_Usuario.get(params.tipo_usuario),
                municipio:Municipio.get(params.municipio))
            usuario.save(flush:true, failOnError:true)
            render(template:'/mensaje', model:[mensaje:'guardado'])
        }
    }
    
    def lista_departamento(){
        def lista = Departamento.list()
        render lista as JSON
    }
    
    def lista_municipio(){
        def lista = Municipio.findAll("from Municipio where departamento = ${params.id}")
        print(lista)
        render lista as JSON
    }
    
    def lista_tipo_usuario(){
        def lista = Tipo_Usuario.list()
        render lista as JSON
    }
    
    def tablero(){
        print("entra al tablero")
        render(view:'tablero')
    }
    
    Session usuario_global
    def ingresar(){
        def usuario = Usuario.find("from Usuario where nombre_usuario = '${params.usuario}' and contrasenna = '${params.contrasenna}'")
        print(usuario)
        if(usuario){ 
            print("entra")
            //usuario_global = usuario
            render(template:'tablero', model:[usuario:usuario])
        }    
    }
    
    def form_nueva_subasta(){
        render(template:'form_subasta', model:[usuario: usuario_global])
    }
        
    def guarda_subasta(){
                print(params) 
        Subasta.withTransaction(){
            status ->
            try{
                print(params) 
                String f = params.fecha_limite        
                def date1 = new Date().parse("yyyy-M-d", f)
                
                def currentDate =  new Date()
                def cierre
                use( TimeCategory ) {
                    cierre = currentDate + Integer.parseInt(params.duracion_minutos).minutes
                }
                
                print(date1)
                def subasta = new Subasta(usuario:Usuario.get(params.usuario), duracion_minutos:params.duracion_minutos, precio_ganador:params.precio_ganador,
                    foto:null, estado:true, fecha_creacion: new Date(), fecha_limite: date1, descripcion_subasta:params.descripcion, fecha_cierre: cierre)
                    
                subasta.save(flush:true, failOnError:true)

                if(params.foto?.getOriginalFilename()!=""){
                    def nombre;
                    def nom=params.foto?.getOriginalFilename();
                    def ext=nom.substring(nom.lastIndexOf('.'));

                    nombre = "subasta"+subasta.id + ext

                    def file=params.foto;
                    def webRootDir=servletContext.getRealPath("/");
                    InputStream is=file?.getInputStream();
                    OutputStream os=new FileOutputStream(webRootDir+"/FotoSubasta/"+nombre);           
                    byte[] buffer=new byte[file?.getSize()];
                    int bytesRead;
                    while((bytesRead=is.read(buffer))!=-1){
                      os.write(buffer,0,bytesRead)};
                      is.close();
                      os.close(); 

                    subasta.foto = nombre
                    //subasta.save(flush:true, failOnError:true)
                    subasta.save(failOnError:true)
                    render(template:'/mensaje', model:[mensaje:'guardado'])
                }
            }
            catch(Exception e){
                print(e)
                render(template:'/mensaje', model:[mensaje:'error'])
            }
        }
        
    }
    
    def cerrar_subasta(){
        def subasta = Subasta.get(params.id)
        subasta.estado = 0
        subasta.save(flush:true,failOnError:true)
    }
    
    def lista_subastas(){
        print("entrando a listar")
        def listado = Subasta.findAll("from Subasta where estado = 1")
        def f = listado.size()/3;
        def fila = (int) Math.ceil(f)
        def vector = []
        def n = 0, m = 2
        for(x in 1..fila){
            def grupo = []
            for(y in n..m){        
                grupo.add(listado[y+x-x])
                print(listado[y+x-x])               
            }
            n = n + 3
            m = m + 3                       
            vector.add(grupo)            
        }
        render(template:'tablero_subastas_activas', model:[listado:listado, vector:vector])        
    }
    
    def mis_subastas(){
        print("entrando a listar")
        def listado = Subasta.findAll("from Subasta where usuario = ${params.id}")
        def f = listado.size()/3;
        def fila = (int) Math.ceil(f)
        def vector = []
        def n = 0, m = 2
        for(x in 1..fila){
            def grupo = []
            for(y in n..m){        
                grupo.add(listado[y+x-x])
                print(listado[y+x-x])               
            }
            n = n + 3
            m = m + 3                       
            vector.add(grupo)            
        }
        render(template:'tablero_subastas_activas', model:[listado:listado, vector:vector])
    }
    
    def form_ofertar(){
        
        render(template:'form_oferta', model:[usuario:params.usuario, subasta:params.subasta, precio:params.precio])        
    }
    
    def ingresar_oferta(){
        print(params)
        Oferta.withTransaction(){
            
            status ->
            try{
                def ofertas = Oferta.findAll("from Oferta where subasta = ${params.subasta}")
                if(ofertas){
                    for(x in 0..ofertas.size()-1){
                        ofertas[x].ganador = 0
                        ofertas[x].save(flush:true, failOnError:true)
                        print(ofertas[x].ganador)
                    }
                }

                def nueva_oferta = new Oferta(ganador:true, precio_oferta:params.precio_oferta, subasta: Subasta.get(params.subasta), usuario:Usuario.get(params.usuario))
                nueva_oferta.save(flush:true, failOnError:true)
                
                def subasta = Subasta.get(params.subasta)
                subasta.precio_ganador = params.precio_oferta
                def usuario_ganador = Usuario.get(params.usuario)
                subasta.usuario_ganador = usuario_ganador.nombre_usuario
                subasta.id_usuario_ganador = usuario_ganador.id
                subasta.save(flush:true, failOnError:true)
            }
            catch(Exception e){
                print(e)
            }
        }
        
        
    }
}
