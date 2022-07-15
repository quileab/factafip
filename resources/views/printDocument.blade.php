<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>{{ config('app.name', 'FactAfip') }}</title>
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
  <!-- favicon -->
  <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('img/favicon/apple-touch-icon.png') }}">
  <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('img/favicon/favicon-32x32.png') }}">
  <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('img/favicon/favicon-16x16.png') }}">
  <link rel="manifest" href="{{ asset('img/favicon/site.webmanifest') }}">
  <!-- Styles -->
  @vite('resources/css/app.css')
  @livewireStyles
  <!-- Scripts -->
  @vite('resources/js/app.js')
</head>

<body class="mx-0 my-0 bg-gray-900 text-gray-200">
  <div class="w-full flex" style="height: 6vh;">
    {{-- tailwind flex button go href="/invoices" --}}
    <a class="flex-1 py-2 text-center text-white bg-green-800 hover:bg-green-700 focus:outline-none focus:ring-4 focus:ring-purple-500"
      href="/invoices">
      <x-svg.arrowLeft class="inline w-5 h-5 mx-auto" />
      <span class="inline ml-2">Volver</span>
    </a>

  </div>
<div style="width: 100vw; height: 94vh;">
<embed src="{{ asset('storage/invoices/'.$filename) }}"
  type="application/pdf"
  width="100%"
  height="100%"
  internalinstanceid="3"
  title="invoice"
  pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">
</embed>
</div>
@livewireScripts
{{-- <script>
  setTimeout(function(){
     window.location.href = '/invoices';
  }, 3000);
</script> --}}
</body>

</html>
