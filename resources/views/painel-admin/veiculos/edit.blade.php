@extends('template.painel-admin')
@section('title', 'Editar Veiculos')
@section('content')
<h6 class="mb-4"><i>EDIÇÃO DE VEICULOS</i></h6><hr>
<form method="POST" action="{{route('veiculos.editar', $item)}}">
        @csrf
        @method('put')
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">Placa</label>
                    <input value="{{$item->placa}}" type="text" class="form-control" id="" name="placa" required>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">Categoria</label>
                    <select class="form-control" name="categoria" id="categoria">
                    <?php
                        use App\Models\categoria;
                        $tabela= categoria::all();
                    ?>

                    @foreach($tabela as $val)

                        <option value='{{$val->nome}}' <?php if($item->categoria == $val->nome){ ?> selected <?php } ?>>{{$val->nome}}</option>

                    @endforeach
                    
                    </select>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">KM</label>
                    <input value="{{$item->km}}" type="text" class="form-control" id="" name="km" required>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">Instrutor</label>
                    <select class="form-control" name="instrutor">
                    <?php
                        use App\Models\instrutore;
                        $tabela= instrutore::all();
                        
                    ?>

                    <option value='0' >Selecionar Instrutor</option>

                    @foreach($tabela as $val)
                    
                        <option value='{{$val->id}}' <?php if($item->instrutor == $val->id){ ?> selected <?php } ?>>{{$val->nome}}</option>
                    
                    @endforeach
                    </select>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">Cor</label>
                    <input value="{{$item->cor}}" type="text" class="form-control" id="" name="cor" required>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">Marca</label>
                    <input value="{{$item->marca}}" type="text" class="form-control" id="" name="marca" required>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">Ano</label>
                    <input value="{{$item->ano}}" type="text" class="form-control" id="" name="ano" required>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="exampleInputEmail1">Última Revisão</label>
                    <input value="{{$item->data_revisao}}" type="date" class="form-control" id="data" name="data">
                </div>
            </div>

        </div>

        <p align="right">
        <input type="hidden" name="old" value="{{$item->placa}}">
        <button type="submit" class="btn btn-primary">Salvar</button>
        </p>

    </form>

@endsection