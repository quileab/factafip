@extends('layouts.print')
@section('content')
  <table>
    <tr>
      <td>
        <h3>Listado de Comprobantes</h3>
      </td>
      <td class='right'>
        {{ date('d-m-Y H:i', strtotime(now())) }}    
      </td>
    </tr>
  </table>

@php
  $total=0;
@endphp
  <table>
    <thead>
      <tr>
        <th>Descripción</th>
        <th>Total</th>
      </tr>
    </thead>
    <tbody>
      @foreach ($vouchers as $voucher)
        <tr>
          <td>{{date_format(date_create($voucher['created_at']),'d-m-Y')}} » {{$CbteTipoDesc}} {{$voucher['data']['PtoVta']}}-{{$voucher['data']['CbteDesde']}}</td>
          <td class="right"><small>$</small> {{number_format($voucher['data']['ImpTotal'],2,',','.')}}</td>
        </tr>
        @php
          $total+=$voucher['data']['ImpTotal'];
        @endphp
      @endforeach
      <tfoot>
      <tr>
        <td>TOTAL</td>
        <td class="right"><small>$</small> {{number_format($total,2,',','.')}}</td>
      </tr>
      </tfoot>
  </tbody>
  </table>
@endsection