package core

class Cliente {

    String nome
    String cpf
    Date dataNascimento
    String telefone
    String endereco

    static constraints = {
        nome blank: false, nullable: false, minSize: 2
        cpf blank: false, nullable: false, minSize: 14, maxSize: 14
        dataNascimento nullable: true
        telefone nullable: true
        endereco blank: false, nullable: false, maxSize: 255
    }
}
