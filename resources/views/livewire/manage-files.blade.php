<div class="mx-auto bg-gray-200 rounded-md overflow-hidden">
    <div class="w-full shadow p-2 d2c text-white">
        <h1 class="font-semibold text-xl">Facturas</h1>
    </div>
  <div class="flex flex-wrap gap-2 justify-between  shadow-xl p-3">

    @forelse ($files as $file)
        <a href="files/{{basename($file)}}" target="_blank">
        <div class="rounded bg-slate-700 text-slate-50 shadow-md p-2">
            {{ basename($file) }}
        </div>
        </a>
    @empty
      No existen archivos
    @endforelse
  </div>
</div>
