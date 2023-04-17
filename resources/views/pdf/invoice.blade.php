<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Voucher</title>
  <style>
    /* import from google fonts open sans */
    @import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700');

    /* page size A4, all borders 0.5 cm */
    @page {
      size: A4;
      margin: 0.5cm;
    }

    /* page header */
    header {
      position: fixed;
      top: 0cm;
      left: 0cm;
      right: 0cm;
      height: 3cm;
    }

    /* page footer */
    footer {
      position: fixed;
      bottom: 0cm;
      left: 0cm;
      right: 0cm;
      height: 3cm;
    }

    footer .page:after {
      counter-increment: pages content: counter(pages);
    }

    footer .page:before {
      content: counter(page) "/";
    }

    /* page body */
    body {
      font-family: 'Open Sans', sans-serif;
      padding-top: 3cm;
      padding-bottom: 3.1cm;
      counter-reset: pages 1;
    }

    /* table */
    table {
      border-collapse: collapse;
      border-spacing: 0;
      font-family: 'Open Sans', sans-serif;
      font-size: 12px;
      width: 100%;
    }

    table thead {
      border: 1px solid #000;
      border-bottom: 2px solid #000;
    }

    table thead th {
      padding: 1mm;
      text-align: center;
    }

    table tbody td {
      padding: 1mm;
      text-align: center;
    }

    table tbody tr:nth-child(even) {
      background-color: #eee;
    }

    table tbody tr:nth-child(odd) {
      background-color: #fff;
    }

    table tbody tr:last-child td {
      border-bottom: 1px solid #000;
    }

    /* table tfoot */
    table tfoot {
      border: 1px solid #000;
      border-top: 2px solid #000;
    }

    table tfoot td {
      padding: 1mm;
      text-align: center;
    }

    table tfoot tr:last-child td {
      border-bottom: 1px solid #000;
    }

    /* table tfoot total */
    table tfoot tr:last-child td:first-child {
      border-right: 1px solid #000;
    }

    table tfoot tr:last-child td:last-child {
      border-left: 1px solid #000;
    }

    p {
      margin: 0rem;
      padding: 0rem;
    }

    /* font sizes */
    .font-xsm {
      font-size: .6rem;
    }

    .font-sm {
      font-size: .8rem;
    }

    .font-md {
      font-size: 1.2rem;
    }

    .font-lg {
      font-size: 1.4rem;
    }

    .font-xl {
      font-size: 1.6rem;
    }

    .font-xxl {
      font-size: 2rem;
    }

    /* font weights */
    .font-bold {
      font-weight: bold;
    }

    .font-light {
      font-weight: 300;
    }

    .font-normal {
      font-weight: normal;
    }

    /* text align */
    .text-left {
      text-align: left;
    }

    .text-center {
      text-align: center;
    }

    .text-right {
      text-align: right;
    }

    /* border */
    .border {
      border: 1px solid #000;
    }

    .border-top {
      border-top: 1px solid #000;
    }

    .border-bottom {
      border-bottom: 1px solid #000;
    }

    .border-left {
      border-left: 1px solid #000;
    }

    .border-right {
      border-right: 1px solid #000;
    }

    .borderless {
      border: 0px;
    }

    .flex {
      display: flex;
    }

    .inline-flex {
      display: inline-flex;
    }

    .inline-block {
      display: inline-block;
    }

    .page-break {
      page-break-before: always;
    }

  </style>
</head>

<body>
  @foreach ([1 => 'ORIGINAL', 2 => 'DUPLICADO'] as $key => $copies)
    <header>
      <div>
        <table>
          <tr>
            <td style="width:45%;" class="border text-left">
              <div>
                <img style="height:1.5cm; width:auto;" src="{{ public_path() . '/img/logo.jpg' }}">
              </div>
              <div class="font-sm">
                <small>Razón Social: </small>{{ $data['conf']['business_name'] }}<br />
                <small>Dirección: {{ $data['conf']['address'] }}</small><br />
                <small>Condic. IVA: </small>{{ $data['tax_cond'] }}<br />
              </div>

            </td>
            <td style="width:10%;" class="border">
              <div class="font-xxl font-bold">{{ $data['inv_letter'] }}</div>
              cod {{ $data['CbteTipo'] }}<br>
              <p class="font-sm">{{ $copies }}</p>
            </td>
            <td style="width:45%;" class="border text-left">
              <span class="font-lg font-bold">
                {{ $data['inv_type'] }}
              </span><br />&nbsp;
              <span class="font-md">{{ $data['ptoVta'] }}-{{ $data['invoice_number'] }}</span>
              <br />
              Fecha: {{ $data['invoice_date'] }}<br />
              CUIT: {{ $data['conf']['cuit'] }} -
              IIBB: {{ $data['conf']['iibb'] }}<br />
              Inicio de Actividades: {{ $data['conf']['start_date'] }}
            </td>
          </tr>
        </table>
      </div>
    </header>
    <footer>
      <table id="FiscalData">
        <tr>
          <td class="borderless" style="width:3cm;">
            <img src="data:image/svg+xml;base64, {!! base64_encode(QrCode::format('svg')->errorCorrection('H')->size(100)->generate($datos_qr),) !!} ">
          </td>
          <td class="borderless text-left">
            <img style="height:0.9cm; width:auto;" src="{{ public_path() . '/img/logo_afip.png' }}">
            <div class="text-right" style="display: inline-block; width:12cm;">
              <span>CAE Nº: <strong>{{ $data['res']['CAE'] }}</strong></span><br />
              <span>Fecha Vto. CAE: <strong>{{ $data['res']['CAEFchVto'] }}</strong></span>
            </div>
            <p>Comprobante Autorizado</p>
            <p class="font-xsm">Esta Administración Federal no se responsabiliza por los datos ingresados en el
              detalle de la operación.</p>
          </td>
        </tr>
      </table>
    </footer>
    <main>
      <table>
        <tr>
          <td style="width:50%;" class="border text-left">
            <strong>Cliente: {{ $data['customer']->name }}</strong><br />
            Domicilio: {{ $data['customer']->address }}, {{ $data['customer']->city }}
          </td>
          <td style="width:50%;" class="border text-left">
            Cond. fte. al IVA: <strong>{{ $data['customer']->responsibility_type_id }}</strong><br />
            CUIT: {{ $data['customer']->CUIT }}

          </td>
        </tr>
      </table>
      <table class="font-xsm">
        <thead style="background-color: #dddddd;">
          <tr>
            <th style="width:5%; overflow:hidden;" class="border-top border-left">Cód.</th>
            <th style="width:10%;" class="border-top border-left">Cant.</th>
            <th style="width:10%;" class="border-top border-left">U. med.</th>
            <th style="width:60%;" class="border-top border-left">Descripción</th>
            <th style="width:15%;" class="border-top border-left">Precio Unitario</th>
            <th style="width:10%;" class="border-top border-left">% Desc.</th>
           @if ($data['inv_letter'] == 'A')
              <th style="width:15%;" class="border-top border-left">Subt.</th>
              <th style="width:15%;" class="border-top border-left">IVA</th>
           @endif 
            <th style="width:15%;" class="border-top border-left">Subtotal</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($items as $item)
            <tr>
              <td class="border-left">{{ $item->id }}</td>
              <td class="border-left">{{ $item->qty }}</td>
              <td class="border-left">{{ $item->model->unit->value ?? ''}}</td>
              <td class="text-left border-left">{{ $item->name }}</td>
              <td class="text-right border-left">{{ number_format($item->price, 2, ',', '.') }}</td>
              <td class="text-right border-left">{{ $item->discountRate }}%</td>
              @if ($data['inv_letter'] == 'A')
                <td class="text-right border-left">
                  {{ number_format($data['itemDetail'][$item->rowId]['BaseImp'], 2, ',', '.') }}
                </td>
                <td class="text-right border-left">
                  <small>{{ $item->taxRate }}%</small> {{ number_format($data['itemDetail'][$item->rowId]['IVA'], 2, ',', '.') }}
                </td>
              @endif
              <td class="text-right border-left border-right">
                {{ number_format($item->qty * ($item->price-($item->price*$item->discountRate/100)), 2, ',', '.') }}
              </td>
            </tr>
          @endforeach
        </tbody>
        <tfoot>
          <tr>
            <td colspan="{{ $data['inv_letter'] === 'A' ? 7:5 }}" class="border-top border-left text-right">
              Subtotal
            </td>
            <td colspan="2" class="border-top border-right text-right">
              {{ currency_format($data['ImpNeto']) }}
            </td>
          </tr>
          @foreach ($data['Iva'] as $iva)
            <tr>
              <td colspan="{{ $data['inv_letter'] === 'A' ? 7:5 }}" class="text-right">IVA {{ $iva['Id'] }}</td>
              <td colspan="2" class="text-right">{{ currency_format($iva['Importe']) }}</td>
            </tr>
          @endforeach
          @foreach ($data['Tributos'] as $trib)
            <tr>
              <td colspan="{{ $data['inv_letter'] === 'A' ? 7:5 }}" class="text-right">{{ $trib['Desc'] }}</td>
              <td colspan="2" class="text-right">{{ currency_format($trib['Importe']) }}</td>
            </tr>
          @endforeach
          <tr>
            <td colspan="{{ $data['inv_letter'] === 'A' ? 7:5 }}" class="border-left border-right text-right">
              <strong>Total</strong>
            </td>
            <td colspan="2" class="border-top border-left border-right text-right">
              <strong>{{ currency_format($data['ImpTotal']) }}</strong>
            </td>

        </tfoot>
      </table>

    </main>
    @if ($key < 2)
      <div class="page-break"></div>
    @endif
  @endforeach
</body>

</html>
