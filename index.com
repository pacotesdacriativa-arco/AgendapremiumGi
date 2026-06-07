<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agenda Gisele Mello</title>

<style>
*{box-sizing:border-box;margin:0;padding:0}

body{
font-family:Arial,sans-serif;
background:linear-gradient(180deg,#050505,#111,#000);
color:white;
min-height:100vh;
overflow-x:hidden;
}

body::before{
content:"";
position:fixed;
inset:0;
background:
radial-gradient(circle at top left,rgba(200,148,52,.13),transparent 30%),
radial-gradient(circle at bottom right,rgba(200,148,52,.10),transparent 35%);
z-index:-2;
}

.hidden{display:none!important}

.container{
max-width:480px;
margin:auto;
padding:22px;
min-height:100vh;
}

.topo{
text-align:center;
padding:28px 10px;
}

.logoCircle{
width:105px;
height:105px;
border-radius:50%;
border:2px solid #C89434;
display:flex;
align-items:center;
justify-content:center;
margin:auto;
box-shadow:0 0 25px rgba(200,148,52,.35);
background:rgba(255,255,255,.02);
}

h1{
margin-top:18px;
font-size:34px;
color:#C89434;
}

.sub{
margin-top:8px;
color:#d6b06a;
font-weight:bold;
}

.card{
background:rgba(255,255,255,.055);
border:1px solid rgba(200,148,52,.25);
backdrop-filter:blur(10px);
border-radius:30px;
padding:22px;
margin-top:20px;
box-shadow:0 10px 28px rgba(0,0,0,.38);
}

label{
display:block;
margin-top:14px;
font-weight:bold;
color:#f0d7a0;
}

input,select,textarea{
width:100%;
padding:15px;
margin-top:7px;
border-radius:18px;
border:1px solid rgba(200,148,52,.35);
background:#111;
color:white;
font-size:15px;
}

textarea{height:90px;resize:none}

button{
border:none;
cursor:pointer;
font-weight:bold;
}

.btn{
width:100%;
padding:16px;
margin-top:18px;
border-radius:20px;
background:linear-gradient(135deg,#C89434,#f3d28a);
color:#000;
font-size:16px;
box-shadow:0 10px 25px rgba(200,148,52,.30);
}

.btn2{
width:100%;
padding:16px;
margin-top:14px;
border-radius:20px;
background:transparent;
border:2px solid #C89434;
color:#C89434;
font-size:16px;
}

.servicoBox{
display:flex;
align-items:center;
gap:10px;
background:#111;
border:1px solid rgba(200,148,52,.35);
padding:12px;
border-radius:16px;
margin-top:10px;
}

.servicoBox input{
width:22px;
height:22px;
margin:0;
accent-color:#C89434;
}

.agenda{
background:#111;
border-left:5px solid #C89434;
padding:14px;
border-radius:18px;
margin-top:12px;
line-height:1.8;
color:#f2f2f2;
}

.delete{
margin-top:10px;
background:#C89434;
color:black;
padding:10px 14px;
border-radius:12px;
}

footer{
text-align:center;
font-size:12px;
margin-top:25px;
color:#d6b06a;
}
</style>
</head>

<body>

<div id="inicio">
<div class="container">
<div class="topo">
<div class="logoCircle">
<svg width="52" height="52" viewBox="0 0 24 24" fill="#C89434">
<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5
2 5.42 4.42 3 7.5 3
9.24 3 10.91 3.81 12 5.09
13.09 3.81 14.76 3 16.5 3
19.58 3 22 5.42 22 8.5
22 12.28 18.6 15.36 13.45 20.04
L12 21.35z"/>
</svg>
</div>

<h1>Gisele Mello</h1>
<p class="sub">Agenda premium de agendamentos</p>
</div>

<div class="card">
<button class="btn" onclick="abrirAgenda()">Abrir Agenda</button>
<button class="btn2" onclick="abrirLogin()">Designer</button>
</div>
</div>
</div>

<div id="agendaCliente" class="hidden">
<div class="container">
<div class="topo">
<div class="logoCircle">
<svg width="52" height="52" viewBox="0 0 24 24" fill="#C89434">
<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5
2 5.42 4.42 3 7.5 3
9.24 3 10.91 3.81 12 5.09
13.09 3.81 14.76 3 16.5 3
19.58 3 22 5.42 22 8.5
22 12.28 18.6 15.36 13.45 20.04
L12 21.35z"/>
</svg>
</div>

<h1>Agendar Horário</h1>
<p class="sub">Selecione um ou mais serviços</p>
</div>

<div class="card">

<label>Serviços</label>
<div id="servicos"></div>

<label>Escolha a data</label>
<input type="date" id="data">

<label>Escolha o horário</label>
<select id="hora"></select>

<label>Nome da cliente</label>
<input type="text" id="nome" placeholder="Digite seu nome">

<label>Número da cliente</label>
<input type="text" id="telefone" placeholder="Digite seu WhatsApp">

<label>Observação</label>
<textarea id="obs" placeholder="Ex: preferência, modelo, manutenção..."></textarea>

<button class="btn" onclick="enviarWhats()">Confirmar no WhatsApp</button>
<button class="btn2" onclick="voltarInicio()">Voltar</button>

</div>

<footer>Gisele Mello</footer>
</div>
</div>

<div id="login" class="hidden">
<div class="container">
<div class="topo">
<div class="logoCircle">
<svg width="52" height="52" viewBox="0 0 24 24" fill="#C89434">
<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5
2 5.42 4.42 3 7.5 3
9.24 3 10.91 3.81 12 5.09
13.09 3.81 14.76 3 16.5 3
19.58 3 22 5.42 22 8.5
22 12.28 18.6 15.36 13.45 20.04
L12 21.35z"/>
</svg>
</div>

<h1>Área Designer</h1>
<p class="sub">Acesso privado</p>
</div>

<div class="card">
<label>Senha</label>
<input type="password" id="senha">

<button class="btn" onclick="entrarPainel()">Entrar</button>
<button class="btn2" onclick="voltarInicio()">Voltar</button>
</div>
</div>
</div>

<div id="painel" class="hidden">
<div class="container">
<div class="topo">
<div class="logoCircle">
<svg width="52" height="52" viewBox="0 0 24 24" fill="#C89434">
<path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5
2 5.42 4.42 3 7.5 3
9.24 3 10.91 3.81 12 5.09
13.09 3.81 14.76 3 16.5 3
19.58 3 22 5.42 22 8.5
22 12.28 18.6 15.36 13.45 20.04
L12 21.35z"/>
</svg>
</div>

<h1>Agenda Designer</h1>
<p class="sub">Controle de agendamentos</p>
</div>

<div class="card">
<label>Nome da cliente</label>
<input type="text" id="nomePainel">

<label>Telefone</label>
<input type="text" id="fonePainel">

<label>Serviço</label>
<input type="text" id="servicoPainel">

<label>Data</label>
<input type="date" id="dataPainel">

<label>Horário</label>
<input type="time" id="horaPainel">

<label>Observação</label>
<textarea id="obsPainel"></textarea>

<button class="btn" onclick="salvarAgenda()">Salvar agendamento</button>
</div>

<div class="card">
<h2 style="text-align:center;color:#C89434;">Agendamentos</h2>
<div id="listaAgenda"></div>

<button class="btn2" onclick="voltarInicio()">Sair</button>
</div>

<footer>Agenda Premium</footer>
</div>
</div>

<script>
let numero="5521990692273";

const listaServicos=[
"Spa dos pés",
"Manicure e pedicure",
"Designer",
"Molde F1"
];

let agenda=JSON.parse(localStorage.getItem("agendaGiseleMello"))||[];

function esconderTudo(){
document.getElementById("inicio").classList.add("hidden");
document.getElementById("agendaCliente").classList.add("hidden");
document.getElementById("login").classList.add("hidden");
document.getElementById("painel").classList.add("hidden");
}

function voltarInicio(){
esconderTudo();
document.getElementById("inicio").classList.remove("hidden");
}

function abrirAgenda(){
esconderTudo();
document.getElementById("agendaCliente").classList.remove("hidden");
}

function abrirLogin(){
esconderTudo();
document.getElementById("login").classList.remove("hidden");
}

function montarServicos(){
let box=document.getElementById("servicos");
box.innerHTML="";

listaServicos.forEach((s,i)=>{
box.innerHTML+=`
<label class="servicoBox">
<input type="checkbox" value="${i}">
<span>${s}</span>
</label>`;
});
}

function montarHorarios(){
let select=document.getElementById("hora");
select.innerHTML="";

let hora=9;
let minuto=0;

while(hora<18 || (hora===18 && minuto===0)){
let h=String(hora).padStart(2,"0");
let m=String(minuto).padStart(2,"0");
select.innerHTML+=`<option>${h}:${m}</option>`;

minuto+=30;
if(minuto>=60){
minuto=0;
hora++;
}
}
}

function servicosSelecionados(){
let checks=document.querySelectorAll("#servicos input:checked");
let escolhidos=[];

checks.forEach(c=>{
escolhidos.push(listaServicos[Number(c.value)]);
});

return escolhidos;
}

function enviarWhats(){
let escolhidos=servicosSelecionados();
let data=document.getElementById("data").value;
let hora=document.getElementById("hora").value;
let nome=document.getElementById("nome").value;
let telefone=document.getElementById("telefone").value;
let obs=document.getElementById("obs").value;

if(escolhidos.length===0){
alert("Selecione pelo menos um serviço.");
return;
}

if(!nome||!telefone||!data){
alert("Preencha nome, telefone e data.");
return;
}

let lista=escolhidos.map(s=>`- ${s}`).join("\n");

let mensagem=
`Olá!

Gostaria de solicitar um agendamento:

Nome: ${nome}
Telefone: ${telefone}

Serviços:
${lista}

Data: ${data}
Horário: ${hora}

Observação: ${obs || "Nenhuma"}

Aguardo confirmação.`;

window.open(`https://wa.me/${numero}?text=${encodeURIComponent(mensagem)}`,"_blank");
}

function entrarPainel(){
let senha=document.getElementById("senha").value;

if(senha==="3047@mello"){
esconderTudo();
document.getElementById("painel").classList.remove("hidden");
mostrarAgenda();
}else{
alert("Senha incorreta.");
}
}

function salvarStorage(){
localStorage.setItem("agendaGiseleMello",JSON.stringify(agenda));
}

function salvarAgenda(){
let nome=document.getElementById("nomePainel").value;
let telefone=document.getElementById("fonePainel").value;
let servico=document.getElementById("servicoPainel").value;
let data=document.getElementById("dataPainel").value;
let hora=document.getElementById("horaPainel").value;
let obs=document.getElementById("obsPainel").value;

if(!nome||!data||!hora){
alert("Preencha nome, data e horário.");
return;
}

agenda.push({nome,telefone,servico,data,hora,obs});
salvarStorage();

document.getElementById("nomePainel").value="";
document.getElementById("fonePainel").value="";
document.getElementById("servicoPainel").value="";
document.getElementById("dataPainel").value="";
document.getElementById("horaPainel").value="";
document.getElementById("obsPainel").value="";

mostrarAgenda();
}

function excluir(index){
agenda.splice(index,1);
salvarStorage();
mostrarAgenda();
}

function mostrarAgenda(){
let lista=document.getElementById("listaAgenda");
lista.innerHTML="";

if(agenda.length===0){
lista.innerHTML="<p style='text-align:center;color:#d6b06a;'>Nenhum horário anotado ainda.</p>";
return;
}

agenda.slice().reverse().forEach((a,index)=>{
let real=agenda.length-1-index;

lista.innerHTML+=`
<div class="agenda">
<strong>${a.nome}</strong><br>
Telefone: ${a.telefone || "-"}<br>
Serviço: ${a.servico || "-"}<br>
Data: ${a.data}<br>
Horário: ${a.hora}<br>
Observação: ${a.obs || "-"}
<button class="delete" onclick="excluir(${real})">Excluir</button>
</div>`;
});
}

montarServicos();
montarHorarios();
</script>

</body>
</html>
