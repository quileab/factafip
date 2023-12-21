<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

        <!-- Styles -->
        <style>
          * {
            font-family: Nunito, Arial, Helvetica, sans-serif;
            padding:0px;
            margin:0px;
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
              background-color: transparent; /*#2d63c8;*/
              border:0;
              font-size: 2rem;
              padding: 0.2rem 1.5rem;
              cursor: pointer
            }
          button:hover {
            background-color: #ffffff37;
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
        
        <!-- Scripts -->

    </head>
    <body>
      <div class="dontPrint" style="text-align:right; margin-bottom:1rem; background-color: #034fb3;">
        <button type="button" onclick="window.print();return false;"
          style=".">🖨️</button>
        <button type="button" onclick="window.close();return false;"
          style=".">❌</button>
      </div>
    
        <div style="margin:1rem;">
           @yield('content')
        </div>
    </body>
</html>
