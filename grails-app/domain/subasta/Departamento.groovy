package subasta

class Departamento {

    String nombre_departamento
    
    static hasMany = [municipio: Municipio]
    
    static mapping = {
        version false
        table 'Departamento'
        id generator: "identity", column: 'id_departamento'
    }
    
    static constraints = {
        nombre_departamento(size:1..25, nullable:false)
    }
}
