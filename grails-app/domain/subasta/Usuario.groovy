package subasta

class Usuario {
    
    String primer_nombre
    String segundo_nombre
    String primer_apellido
    String segundo_apellido
    String dpi
    Date fecha_nacimiento
    String telefono
    String celular
    String domicilio
    String nombre_usuario
    String contrasenna
    
    static belongsTo = [tipo_usuario: Tipo_Usuario, municipio: Municipio]
    static hasMany = [subasta: Subasta, oferta: Oferta]
    
    static mapping = {
        version false
        table 'Usuario'
        id generator: "identity", column: 'id_usuario'
    }

    static constraints = {
        primer_nombre(size:1..45, nullable:false)
        segundo_nombre(size:1..45, nullable:true)
        primer_apellido(size:1..45, nullable:false)
        segundo_apellido(size:1..45, nullable:true)
        dpi(size:1..13, nullable:false)
        telefono(size:1..8, nullable:false)
        celular(size:1..8, nullable:false)
        domicilio(size:1..125)
        contrasenna(size:1..40, nullable:false)
        nombre_usuario(size:1..255, nullable:false)
    }
}
