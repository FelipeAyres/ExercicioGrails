<g:if test="${clientes.size() > 0}">
    <table>
        <thead>
        <tr>
            <th>Nome</th>
            <th>CPF</th>
            <th>Data de Nascimento</th>
            <th>Telefone</th>
            <th>Endereço</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="cliente" in="${clientes}">
            <tr>
                <td>${cliente.nome}</td>
                <td>${cliente.cpf}</td>
                <td>${cliente.dataNascimento.format("dd/MM/yyyy")}</td>
                <td>${cliente.telefone}</td>
                <td>${cliente.endereco}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <p>Não há Clientes cadastrados</p>
</g:else>

<style>
thead th {
    white-space: pre-line !important;
}
</style>