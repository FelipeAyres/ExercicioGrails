<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cadastro de Clientes</title>
    <meta name="layout" content="main">
    <script type="text/javascript" src="/Cliente/js/jquery-3.1.1.min.js"></script>

    <style>
    div#cadastroCliente {
        border: 1px solid #aaaaaa;
        box-sizing: border-box;
    }
    div#listaClientes {
        border: 1px solid #aaaaaa;
        box-sizing: border-box;
        padding: 10px;
    }
    .margin10 {
        margin: 10px;
    }
    label {
        font-weight: bold;
    }
    input[type="text"], input[type="date"], input[type="tel"] {
        border-radius: 3px;
        height: 25px;
    }
    textarea { border-radius: 3px; }
    input#limpar {
        padding: 10px 20px;
        font-weight: 600;
        cursor: pointer;
    }
    input#enviar {
        padding: 10px 20px;
        font-weight: 600;
        cursor: pointer;
        background-color: rgba(0,110,255,1);
        color: white;
    }
    </style>
</head>

<body>
<div id="cadastroCliente">
    <g:formRemote name="formCliente" url="[controller:'cliente', action:'salvar']" onSuccess="exibirMensagem(data)">
        <div id="mensagemCadastro"></div>

        <div class="margin10">
            <label>Nome:</label><br/>
            <input type="text" id="nome" name="nome" placeholder="Insira o Nome" />
        </div>

        <div class="margin10">
            <label>CPF:</label><br/>
            <input type="text" name="cpf" placeholder="xxx.xxx.xxx-xx" />
        </div>

        <div class="margin10">
            <label>Data de Nascimento:</label><br/>
            <input type="date" name="dataNascimento" />
        </div>

        <div class="margin10">
            <label>Telefone:</label><br/>
            <input type="tel" name="telefone" placeholder="xxxx-xxxx" />
        </div>

        <div class="margin10">
            <label>Endereço:</label><br/>
            <textarea name="endereco" placeholder="Insira o Endereço"></textarea>
        </div>

        <div class="margin10">
            <input type="submit" id="enviar" name="enviar" value="Salvar" />
            <input type="reset" id="limpar" name="limpar" value="Limpar" />
        </div>
    </g:formRemote>
</div>

<div id="listaClientes">
    <g:render template="lista" model="[clientes: clientes]"></g:render>
</div>

<script type="text/javascript">
    function carregarLista(){
        <g:remoteFunction controller="cliente" action="listar" update="listaClientes" />
    }

    function exibirMensagem(data) {
        limparMensagem()

        if(data.erro){
            $('#mensagemCadastro').addClass("errors")
            $.each(data.erro, function (key, value) {
                var mensagemErro = value.defaultMessage.toString().replace("{0}", value.field)
                mensagemErro = mensagemErro.replace("{1}", value.objectName)

                var p = '<p>' + mensagemErro + '</p>'
                $('#mensagemCadastro').append(p)
            });
        }else{
            limparCampos()
            $('#mensagemCadastro').removeClass("errors")
            $('#mensagemCadastro').addClass("message")

            var propriedades = '<p>' + "<strong>Nome: </strong>" + data.nome + " <strong>CPF: </strong>" + data.cpf + '</p>' +
                    "<p> <strong>Data Nascimento: </strong>" +  data.dataNascimento + " <strong>Telefone: </strong>" + data.telefone + '</p>' +
                    '<p>' + " <strong>Endereço: </strong>" + data.endereco + '</p>'
            $('#mensagemCadastro').append(propriedades)

            carregarLista()
        }
        console.log(data)

    }

    function limparMensagem() {
        $('#mensagemCadastro').html("")
    }

    function limparCampos() {
        $('input#limpar').click()
    }
</script>
</body>

</html>