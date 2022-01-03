<div>

  <div class="mx-auto mt-5 max-w-7xl sm:px-6 lg:px-8">
    <div class="overflow-hidden bg-gray-200 rounded-md shadow-xl">
      <div class="flex justify-between px-3 py-2 text-white bg-gray-600">

        <div class="flex ml-2 items-center">
          <x-svg.fileInvoice class="h-8 w-8" />
          <span class="ml-2 text-lg">Facturas</span>
        </div>
        <x-jet-input wire:model.lazy="search" type="search" class="w-full mx-3" placeholder="Buscar..." />

        <x-jet-button wire:click="search">
          <x-svg.search />
        </x-jet-button>
      </div>

      <div class="flex px-4 py-2 overflow-hidden">
        <div class="w-3/4">
          <x-svg.user class="inline" /> {{ $customer->id ?? 'N/A' }}: {{ $customer->name ?? 'N/A' }} »
          {{ $customer->business_name ?? 'N/A' }}
        </div>
        <div class="w-1/4">
          <x-svg.warehouse class="inline" /> {{ $warehouse->id ?? 'N/A' }}: {{ $warehouse->name ?? 'N/A' }}
        </div>
      </div>

      <div class="flex px-4 py-2">
        {{-- voucher types select --}}
        <div class="w-full mx-1">
          <label for="voucher_type_id" class="block text-sm">
            Tipo de comprobante
          </label>
          <select wire:model="voucher_type_id" class="w-full">
            @foreach ($voucher_types as $voucherType)
              <option value="{{ $voucherType->id }}">{{ $voucherType->value }}</option>
            @endforeach
          </select>
        </div>
        <div class="w-full mx-1">
          <label for="invoice_PtoVta" class="block text-sm">
            Punto de Venta
          </label>
          <x-jet-input wire:model="invoice_PtoVta" class="w-full" type="number" min="1" max="9999" />
          <x-jet-input-error for="invoice_PtoVta" class="mt-1" />
        </div>
        <div class="w-full mx-1">
          <label for="invoice_PtoVta" class="block text-sm">
            Número
          </label>
          <x-jet-input readonly wire:model="invoice_number" class="w-full" type="number" min="1" max="99999999" />
          <x-jet-input-error for="invoice_number" class="mt-1" />
        </div>

      </div>
    </div>


  </div>
