package subasta

import org.springframework.dao.DataIntegrityViolationException

class SubastaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subastaInstanceList: Subasta.list(params), subastaInstanceTotal: Subasta.count()]
    }

    def create() {
        [subastaInstance: new Subasta(params)]
    }

    def save() {
        def subastaInstance = new Subasta(params)
        if (!subastaInstance.save(flush: true)) {
            render(view: "create", model: [subastaInstance: subastaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subasta.label', default: 'Subasta'), subastaInstance.id])
        redirect(action: "show", id: subastaInstance.id)
    }

    def show(Long id) {
        def subastaInstance = Subasta.get(id)
        if (!subastaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subasta.label', default: 'Subasta'), id])
            redirect(action: "list")
            return
        }

        [subastaInstance: subastaInstance]
    }

    def edit(Long id) {
        def subastaInstance = Subasta.get(id)
        if (!subastaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subasta.label', default: 'Subasta'), id])
            redirect(action: "list")
            return
        }

        [subastaInstance: subastaInstance]
    }

    def update(Long id, Long version) {
        def subastaInstance = Subasta.get(id)
        if (!subastaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subasta.label', default: 'Subasta'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subastaInstance.version > version) {
                subastaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subasta.label', default: 'Subasta')] as Object[],
                          "Another user has updated this Subasta while you were editing")
                render(view: "edit", model: [subastaInstance: subastaInstance])
                return
            }
        }

        subastaInstance.properties = params

        if (!subastaInstance.save(flush: true)) {
            render(view: "edit", model: [subastaInstance: subastaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subasta.label', default: 'Subasta'), subastaInstance.id])
        redirect(action: "show", id: subastaInstance.id)
    }

    def delete(Long id) {
        def subastaInstance = Subasta.get(id)
        if (!subastaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subasta.label', default: 'Subasta'), id])
            redirect(action: "list")
            return
        }

        try {
            subastaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subasta.label', default: 'Subasta'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subasta.label', default: 'Subasta'), id])
            redirect(action: "show", id: id)
        }
    }
}
