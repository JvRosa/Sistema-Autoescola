<?php

namespace App\Http\Controllers;

use App\Models\comissoe;
use App\Models\movimentacoe;
use Illuminate\Http\Request;

@session_start();
class RelController extends Controller
{
    public function movimentacoes(Request $request){
        $data_inicial = $request->dataInicial;
        $data_final = $request->dataFinal;
        $tabela = movimentacoe::where('data', '>=', $data_inicial)->where('data', '<=', $data_final)->get();
        return view('painel-recepcao.rel.rel_mov', ['itens' => $tabela, 'dataInicial' => $data_inicial, 'dataFinal' => $data_final]);
    }

    public function comissoes(Request $request){
        $data_inicial = $request->dataInicial;
        $data_final = $request->dataFinal;
        $tabela = comissoe::where('data', '>=', $data_inicial)->where('data', '<=', $data_final)->where('funcionario', '=', $_SESSION['cpf_usuario'])->get();
        return view('painel-instrutor.rel.rel_comissao', ['itens' => $tabela, 'dataInicial' => $data_inicial, 'dataFinal' => $data_final]);
    }
}
