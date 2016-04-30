package subasta



import org.junit.*
import grails.test.mixin.*

@TestFor(SubastaController)
@Mock(Subasta)
class SubastaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subasta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subastaInstanceList.size() == 0
        assert model.subastaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subastaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subastaInstance != null
        assert view == '/subasta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subasta/show/1'
        assert controller.flash.message != null
        assert Subasta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subasta/list'

        populateValidParams(params)
        def subasta = new Subasta(params)

        assert subasta.save() != null

        params.id = subasta.id

        def model = controller.show()

        assert model.subastaInstance == subasta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subasta/list'

        populateValidParams(params)
        def subasta = new Subasta(params)

        assert subasta.save() != null

        params.id = subasta.id

        def model = controller.edit()

        assert model.subastaInstance == subasta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subasta/list'

        response.reset()

        populateValidParams(params)
        def subasta = new Subasta(params)

        assert subasta.save() != null

        // test invalid parameters in update
        params.id = subasta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subasta/edit"
        assert model.subastaInstance != null

        subasta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subasta/show/$subasta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subasta.clearErrors()

        populateValidParams(params)
        params.id = subasta.id
        params.version = -1
        controller.update()

        assert view == "/subasta/edit"
        assert model.subastaInstance != null
        assert model.subastaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subasta/list'

        response.reset()

        populateValidParams(params)
        def subasta = new Subasta(params)

        assert subasta.save() != null
        assert Subasta.count() == 1

        params.id = subasta.id

        controller.delete()

        assert Subasta.count() == 0
        assert Subasta.get(subasta.id) == null
        assert response.redirectedUrl == '/subasta/list'
    }
}
