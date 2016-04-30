package subasta

class Tipo_Usuario {

    String descripcion_tipo_usuario
    
    static hasMany = [usuario: Usuario]
    
    static mapping = {
        version false
        table 'Tipo_Usuario'
        id generator: "identity", column: 'id_descripcion_usuario'
    }
    
    static constraints = {
        descripcion_tipo_usuario(size:1..45, nullable:false)
    }
}
