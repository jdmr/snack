package snack

class Pedido {
    String nombre
    String estatus
    Date dateCreated
    Date lastUpdated

    static constraints = {
        nombre maxSize:128, blank:false
        estatus maxSize:32, inList:['PENDIENTE','ENTREGADO']
    }
    
    String toString() {
        "Pedido: $nombre | $estatus"
    }
}
