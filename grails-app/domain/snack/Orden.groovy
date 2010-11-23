package snack

class Orden {
    Pedido pedido
    Producto producto
    Integer cantidad
    Date dateCreated
    Date lastUpdated
    
    static belongsTo = [Producto, Pedido]

    static constraints = {
    }
}
