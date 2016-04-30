package subasta

class Subasta {
    
    String descripcion_subasta
    Date fecha_creacion
    Date fecha_limite
    Date fecha_cierre
    String duracion_minutos
    String precio_ganador
    boolean estado
    String foto
    String usuario_ganador
    String id_usuario_ganador
    
    static belongsTo = [usuario: Usuario]
    static hasMany = [oferta: Oferta]
    
    static mapping = {
        version false
        table 'Subasta'
        id generator: "identity", column: 'id_subasta'
    }

    static constraints = {
        duracion_minutos(size:1..10)
        precio_ganador(size:1..10)
        estado(nullable:false)
        fecha_limite(nullable:true)
        foto(nullable:true)
        fecha_cierre(nullable:true)
        usuario_ganador(nullable:true)
        id_usuario_ganador(nullable:true)
    }
}
