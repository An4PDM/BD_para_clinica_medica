## *Projeto de Banco de Dados para Clínica Médica*
<p> O presente projeto foi feito com o intuito de aprimorar minhas habilidades em modelagem de dados e SQL. </p>
<p> Um bom projeto de Banco de Dados Relacional deve passar primeiramente pela parte do modelo conceitual, onde são definidas as seguintes informações: </p>
  <ul>
    <li> Entidades;</li>
    <li> Atributos;</li>
    <li> Chaves;</li>
    <li> Relacionamentos; e</li>
    <li> Cardinalidades.</li>
  </ul>
<p> O principal objetivo do modelo conceitual é representar de forma simples as informações do determinado contexto de negócios. Nesse projeto, foi utilizada a plataforma do brModelo para modelagem do DER e MR. </p>
<p> OBS: É importante fazer revisões do DER, pois algumas incosistências podem estar mascaradas no diagrama! </p>
<p> O modelo lógico diz respeito à organização do Banco de Dados no nível do SGBD. Essa etapa do processo pode ser feita diretamente no MySQL ou é automaticamente gerada pelo brModelo. </p>
<p> Por fim, o modelo físico diz respeito à codificação. Nessa etapa, as tabelas e seus devidos relacionamentos são codificados, bem como a inserção de dados e consultas.</p>

##

<p> A seguir, são apresentadas as entidades modeladas e seus respectivos atributos no primeiro DER: </p>
<ul>
  <li> Consultório (id, sala, endereço)</li>
  <li> Doutor (crm, cpf, nome, nascimento, endereço)</li>
  <li> Especialização (id, nome)</li>
  <li> Paciente (cpf, nome, nascimento, endereço)</li>
  <li> Receita médica (id, data_emissao, medicamento, CID)</li>
</ul>
<p> Algumas alterações foram feitas posteriormente no DER. Notou-se uma inconsistência na modelagem em relação ao atributo 'medicamento', onde uma receita médica poderia ter mais de um medicamento e diferentes dosagens. Portanto, optou-se por transformar esse atributo em uma tabela: </p>
<ul>
  <li> Medicamento (id, nome, dose, frequencia)</li>
</ul>

##

<p> As tabelas de relacionamento, em primeiro momento, foram: </p>
<ul>
  <li> Consultorio_doutor (cons/doutor)</li>
  <li> doutor_especializacao (doutor/espec)</li>
  <li> paciente_doutor </li>
</ul>

