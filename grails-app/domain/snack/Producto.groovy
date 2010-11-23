package snack

import java.text.*

class Producto {
    String nombre
    String descripcion
    BigDecimal precio
    Date dateCreated
    Date lastUpdated

    static constraints = {
        nombre maxSize:64, blank:false
        descripcion maxSize:200, blank:false
        precio scale:2, precision:8
    }
    
    String toString() {
        "Producto: $nombre | ${precio}"
    }
}
