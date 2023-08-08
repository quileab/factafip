<div class="bg-gray-300 p-3">
  <div class="flex flex-wrap gap-1">
    <div>
      <label for="CbteTipo" class="block text-xs">Tipo de comprobante</label>
      <select wire:model="CbteTipo" class="w-full mt-0 py-2">
        @foreach ($voucher_types as $voucherType)
          <option value="{{ $voucherType->id }}">{{ $voucherType->value }}</option>
        @endforeach
      </select>
    </div>
    <div>
      <label for="PtoVta" class="block text-xs">Punto de Venta</label>
      <x-jet-input wire:model="PtoVta" class="w-full mt-0 py-1" type="number" min="1" max="9999" />
      <x-jet-input-error for="PtoVta" class="mt-1" />
    </div>
    <div>
      <label for="FchDesde" class="block text-xs">Fecha Desde</label>
      <x-jet-input wire:model="FchDesde" class="w-full mt-0 py-1" type="date" />
      <x-jet-input-error for="FchDesde" class="mt-1" />
    </div>
    <div>
      <label for="FchHasta" class="block text-xs">Fecha Hasta</label>
      <x-jet-input wire:model="FchHasta" class="w-full mt-0 py-1" type="date" />
      <x-jet-input-error for="FchHasta" class="mt-1" />
    </div>
    <div class="mt-4 block">
      <a href="{{route('report-Invoices',[$CbteTipo,$PtoVta,$FchDesde,$FchHasta])}}" target="_blank">
        <x-jet-button>Listar</x-jet-button>
      </a>
    </div>
  </div>

</div>
