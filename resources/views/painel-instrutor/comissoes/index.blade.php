@extends('template.painel-instrutor')
@section('title', 'Comissões')
@section('content')
<?php

use App\Models\instrutore;
use App\Models\veiculo;

@session_start();
if (@$_SESSION['nivel_usuario'] != 'instrutor') {
  echo "<script language='javascript'> window.location='./' </script>";
}

?>


<!-- DataTales Example -->
<div class="card shadow mb-4">

  <div class="card-body">
    <small>
      <div class="table-responsive table-sm">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Valor</th>
              <th>Data</th>

            </tr>
          </thead>

          <tbody>
            @foreach($itens as $item)
              <?php
          $data = implode('/', array_reverse(explode('-', $item->data)));
          $valor = number_format($item->valor, 2, ",", ".");

                ?>
              <tr>

                <td>{{$valor}}</td>
                <td>{{$data}}</td>

              </tr>
      @endforeach

          </tbody>
        </table>
      </div>
    </small>
  </div>
</div>


</div>

<script type="text/javascript">
  $(document).ready(function () {
    $('#dataTable').dataTable({
      "ordering": false
    })

  });
</script>

@endsection