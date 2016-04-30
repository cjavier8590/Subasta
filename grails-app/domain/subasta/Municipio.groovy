package subasta

class Municipio {

    String nombre_municipio
    
    static belongsTo = [departamento: Departamento]
    static hasMany = [usuario: Usuario]
    
    static mapping = {
        version false
        table 'Municipio'
        id generator: "identity", column: 'id_municipio'
    }
    
    static constraints = {
        nombre_municipio(size:1..40)
    }
}
