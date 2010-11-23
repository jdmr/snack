package snack

class PedidoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pedidoInstanceList: Pedido.list(params), pedidoInstanceTotal: Pedido.count()]
    }

    def create = {
        def pedidoInstance = new Pedido()
        pedidoInstance.properties = params
        return [pedidoInstance: pedidoInstance]
    }

    def save = {
        def pedidoInstance = new Pedido(params)
        if (pedidoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pedido.label', default: 'Pedido'), pedidoInstance.id])}"
            redirect(action: "edit", id: pedidoInstance.id)
        }
        else {
            render(view: "create", model: [pedidoInstance: pedidoInstance])
        }
    }

    def show = {
        def pedidoInstance = Pedido.get(params.id)
        if (!pedidoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pedidoInstance: pedidoInstance]
        }
    }

    def edit = {
        def pedidoInstance = Pedido.get(params.id)
        if (!pedidoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "list")
        }
        else {
            def lista = Orden.findAllByPedido(pedidoInstance)
            return [pedidoInstance: pedidoInstance, ordenInstanceList: lista]
        }
    }

    def update = {
        def pedidoInstance = Pedido.get(params.id)
        if (pedidoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pedidoInstance.version > version) {
                    
                    pedidoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pedido.label', default: 'Pedido')] as Object[], "Another user has updated this Pedido while you were editing")
                    render(view: "edit", model: [pedidoInstance: pedidoInstance])
                    return
                }
            }
            pedidoInstance.properties = params
            if (!pedidoInstance.hasErrors() && pedidoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pedido.label', default: 'Pedido'), pedidoInstance.id])}"
                redirect(action: "show", id: pedidoInstance.id)
            }
            else {
                render(view: "edit", model: [pedidoInstance: pedidoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pedidoInstance = Pedido.get(params.id)
        if (pedidoInstance) {
            try {
                pedidoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def nuevaOrden = {
        def orden = new Orden(
            pedido : Pedido.load(params.id)
        )
        
        return [ordenInstance:orden]
    }
    
    def guardaOrden = {
        def orden = new Orden(params)
        if (orden.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'orden.label', default: 'Orden'), orden.id])}"
            redirect(action: "edit", id: orden.pedido.id)
        }
        else {
            render(view: "nuevaOrden", model: [ordenInstance: orden])
        }
    }
}
