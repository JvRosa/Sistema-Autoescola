<?php
namespace App\Http\Controllers;

use App\Models\aluno;
use App\Models\categoria;
use App\Models\conta_receber;
use App\Models\marcacoe;
use Illuminate\Http\Request;

@session_start();
class MarcacaoController extends Controller
{
   public function index()
   {
      $tabela = marcacoe::orderby('id', 'desc')->get();
      return view('painel-instrutor.marcacoes.index', ['itens' => $tabela]);
   }

   public function create($hora, $data)
   {
      return view('painel-instrutor.marcacoes.create', ['hora' => $hora], ['data' => $data]);
   }

   public function insert(Request $request)
   {

      $tabela = new marcacoe();
      $tabela->aluno = $request->aluno;
      $tabela->hora = $request->hora;
      $tabela->instrutor = @$_SESSION['cpf_usuario'];
      $tabela->data = $request->data;
      $tabela->categoria = $request->categoria;

      $itens = marcacoe::where('hora', '=', $request->hora)->where('data', '=', $request->data)->where('instrutor', '=', @$_SESSION['cpf_usuario'])->count();
      if ($itens > 0) {
         echo "<script language='javascript'> window.alert('Horário Indisponível!') </script>";
         $tab = marcacoe::orderby('id', 'desc')->paginate();
         return view('painel-instrutor.marcacoes.index', ['itens' => $tab]);
      }

      $itens = aluno::where('cpf', '=', $request->aluno)->count();

      if ($itens == 0) {
         echo "<script language='javascript'> window.alert('Aluno sem cadastro!') </script>";
         $tab = marcacoe::orderby('id', 'desc')->paginate();
         return view('painel-instrutor.marcacoes.index', ['itens' => $tab]);
      }

      $conta = new conta_receber();
      $alunos = aluno::where('cpf', '=', $request->aluno)->first();
      $cat = categoria::where('nome', '=', $request->categoria)->first();

      $valor2 = str_replace(',', '.', $cat->valor);
      $conta->descricao = 'Aula - ' . @$_SESSION['nome_usuario'];
      $conta->valor = $valor2;
      $conta->aluno = $alunos->id;
      $conta->recep = @$_SESSION['cpf_usuario'];
      $conta->pago = 'Não';
      $conta->data = date('Y-m-d');
      $conta->aula = 'Sim';


      $tabela->save();
      $conta->save();
      
      $tabela2 = marcacoe::orderby('id', 'desc')->paginate();
      return view('painel-instrutor.marcacoes.index', ['itens' => $tabela2], ['data' => $request->data]);
   }

   public function delete(marcacoe $item, $data)
   {
      $item->delete();

      $item2 = marcacoe::orderby('id', 'desc')->paginate();
      return view('painel-instrutor.marcacoes.index', ['itens' => $item2, 'data' => $data]);
   }

   public function modal($id, $data)
   {
      $item = marcacoe::orderby('id', 'desc')->paginate();
      return view('painel-instrutor.marcacoes.index', ['itens' => $item, 'id' => $id, 'data' => $data]);

   }


   public function buscar(Request $request)
   {
      $tabela = marcacoe::orderby('id', 'desc')->get();
      return view('painel-instrutor.marcacoes.index', ['itens' => $tabela], ['data' => $request->data]);
   }
}