package subasta

class Oferta {

    String precio_oferta
    boolean ganador
    
    static belongsTo = [subasta: Subasta, usuario: Usuario]
    
    static mapping = {
        version false
        table 'Oferta'
        id generator: "identity", column: 'id_oferta'
    }
    
    static constraints = {
        precio_oferta(size:1..10, nullable:false)
        ganador(nullable:false)
    }
}
