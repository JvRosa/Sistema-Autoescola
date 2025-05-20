@extends('template.painel-instrutor')
@section('title', 'Painel Instrutor')
@section('content')
<?php 
@session_start();
if(@$_SESSION['nivel_usuario'] != 'instrutor'){ 
  echo "<script language='javascript'> window.location='./' </script>";
}
?>
Home do Instrutor
@endsection