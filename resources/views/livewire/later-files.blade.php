<div wire:init="loadData">
  <div class="mx-auto mt-5 max-w-7xl sm:px-6 lg:px-8">
    <div class="overflow-hidden bg-gray-200 rounded-md shadow-xl">
      <div class="flex justify-between px-3 py-2 text-white d2c">
        <div class="flex ml-2 items-center">
          <x-svg.equipment class="h-8 w-8" />
          <div class="ml-2 text-lg">Archivos</div>
        </div>
        <x-jet-input wire:model.lazy="search" type="search" class="w-full mx-3" placeholder="Buscar..." />
      </div>
      <div class="p-4 flex flex-wrap -mx-3">
        {{-- list all files in Storage::disk('local') /laterUse/ --}}
        {{-- in card style --}}

        @foreach ($files as $file)
          <div class="w-full md:w-1/2 lg:w-1/3 px-2 py-2">
            <div class="bg-white shadow-md rounded-lg pl-2 pt-2 border-l-4 border-l-red-800">
              <div class="truncate text-ellipsis overflow-hidden">{{ basename($file) }}</div>
              <div class="flex justify-between">
                <div class="text-xs inline-flex mt-1">
                  <x-svg.clock class="w-4 h-4" />&nbsp;
                  {{ date('d/m/Y H:i:s', Storage::disk('local')->lastModified($file)) }}
                </div>
                <div class="right-1 mb-1">
                  <x-jet-button wire:click="invoice('{{ urlencode(basename($file)) }}')" class="mr-1">
                    <x-svg.fileInvoice /> Abrir
                  </x-jet-button>
                  <x-jet-danger-button wire:click="delete('{{ urlencode(basename($file)) }}')" class="mr-1">
                    <x-svg.trash />
                  </x-jet-danger-button>
                </div>
              </div>
            </div>
          </div>
        @endforeach

      </div>
    </div>
  </div>
