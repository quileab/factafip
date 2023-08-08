<style>
  * {
    font-family: Arial, Helvetica, sans-serif;
    padding:0px;
    margin:0px;
  }

  body {
    margin:1rem;
  }

  h2{
    margin: 0rem;
    padding: 0rem;
  }
  h4{
    margin: 0rem;
    padding: 0rem;
  }

  table{
    width:100%; border:1px solid; border-collapse:collapse;
  }

  table td, table th{
    border:1px solid;
    padding:0.4rem 0.5rem;
  }

  tfoot{
    font-weight: bold;
    border-top:2px solid black;
  }

  th{
    background-color: #f5f5f5;
  }

  .right{
    text-align:right;
  }

  button {
			color: #ffffff;
			background-color: #2d63c8;
			font-size: 19px;
			border: 1px solid #1b3a75;
			border-radius: 0.5rem;
			padding: 0.5rem 2rem;
			cursor: pointer
		}
	button:hover {
    background-color: #3271e7;
			color: #ffffff;
	}

</style>

<style media="print">
/* @page {size:landscape}  */ 
@media print {

@page {
  size: A4;
  max-height:100%;
  max-width:100%;
  margin: 1cm;
}

body {
  width:100%;
  height:100%;
  margin: 0cm;
  padding: 0cm;
  }    
}

.dontPrint {
     display:none;
}

</style>   
  <div class="dontPrint" style="width:100%; text-align:right; padding:0.4rem; margin-bottom:1rem; background-color: #ddd; border:3px solid #aaa;">
    <button type="button" onclick="window.print();return false;"
      style=".">🖨️ Imprimir</button>
    <button type="button" onclick="window.close();return false;"
      style=".">❌ Cerrar</button>
  </div>
  <table>
    <tr>
      <td>
        Listado de Comprobantes
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
