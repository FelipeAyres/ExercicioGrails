package core

import grails.converters.JSON

class ClienteController {

    def index() {
        def clientes = Cliente.list()
        render(view: "index", model: [clientes: clientes])
    }

    def listar(){
        def clientes = Cliente.list()
        render(template: "/cliente/lista", model: [clientes: clientes])
    }

    def salvar() {
        Cliente cliente = new Cliente()
        //cliente.properties = params
        cliente.nome = params.nome
        cliente.cpf = params.cpf
        cliente.telefone = params.telefone
        cliente.endereco = params.endereco
        cliente.dataNascimento = new Date().parse("yyyy-MM-dd", params.dataNascimento)
        cliente.validate()

        if (cliente.hasErrors()){
            def mensagem = [erro: cliente.errors.fieldErrors]
            render mensagem as JSON
        }else {
            cliente.save(flush: true)
            render cliente as JSON
        }
    }


}
