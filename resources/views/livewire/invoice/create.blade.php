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



    </div>
  </div>


</div>
