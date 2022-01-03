<div wire:init="loadData">

  <x-jet-dialog-modal icon='edit' wire:model="openModal">
    <x-slot name="title">Depósitos</x-slot>

    <x-slot name="content">
      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="ID" />
          <x-jet-input type="number" readonly wire:model.defer='warehouse_id' value="{{ $warehouse_id ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="warehouse_id" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Nombre" />
          <x-jet-input type='text' wire:model.lazy='warehouse_name' value="{{ $warehouse_name ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="warehouse_name" />
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="Ubicación" />
          <x-jet-input type='text' wire:model.lazy='warehouse_location' value="{{ $warehouse_location ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="warehouse_location" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Encargado" />
          <x-jet-input type='text' wire:model.lazy='warehouse_contact_person'
            value="{{ $warehouse_contact_person ?? '' }}" class="w-full" />
          <x-jet-input-error for="warehouse_contact_person" />
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="Teléfono" />
          <x-jet-input type='text' wire:model.lazy='warehouse_phone' value="{{ $warehouse_phone ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="warehouse_phone" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="E-mail" />
          <x-jet-input type='text' wire:model.lazy='warehouse_email' value="{{ $warehouse_email ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="warehouse_email" />
        </div>
      </div>

    </x-slot>

    <x-slot name="footer">
      <div class="flex justify-between">
        <x-jet-secondary-button wire:click="$toggle('openModal')" wire:loading.attr="disabled">
          Salir
        </x-jet-secondary-button>

        @if ($updating == true)
          <x-jet-button wire:click="update" class="px-3 py-1 text-xs font-bold text-white rounded">
            Modificar
          </x-jet-button>
        @else
          <x-jet-button class="ml-2" wire:click="create" wire:loading.attr="disabled">
            Guardar
          </x-jet-button>
        @endif

      </div>
    </x-slot>
  </x-jet-dialog-modal>

  <div class="mx-auto mt-5 max-w-7xl sm:px-6 lg:px-8">
    <div class="overflow-hidden bg-gray-200 rounded-md shadow-xl">
      <div class="flex justify-between px-3 py-2 text-white bg-gray-600">
        <div class="flex ml-2 items-center">
          <x-svg.warehouse class="h-8 w-8" />
          <div class="ml-2 text-lg">Depósitos</div>
        </div>
        <x-jet-input wire:model.lazy="search" type="search" class="w-full mx-3" placeholder="Buscar..." />

        <x-jet-button wire:click="newWarehouse">Nuevo</x-jet-button>
      </div>
      <div class="pb-4">
        {{-- show list of customers in table --}}
        <table class="table-auto w-full">
          <thead>
            <tr class="bg-gray-800 text-white">
              <th class="px-4 py-2">ID</th>
              <th class="px-4 py-2">Nombre</th>
              <th class="px-4 py-2">Encargado</th>
              <th class="px-4 py-2">Email</th>
              <th class="px-4 py-2">Teléfono</th>
              <th class="px-4 py-2">Acciones</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($warehouses as $warehouse)
              <tr @class([
                  'bg-indigo-200' => $warehouse->id == session()->get('warehouse_id'),
              ])>
                <td class="px-4 py-2">{{ $warehouse->id }}</td>
                <td class="px-4 py-2">{{ $warehouse->name }}</td>
                <td class="px-4 py-2">{{ $warehouse->contact_person }}</td>
                <td class="px-4 py-2">{{ $warehouse->email }}</td>
                <td class="px-4 py-2">{{ $warehouse->phone }}</td>
                <td class="px-4 py-2 text-right">
                  <x-jet-button wire:click="edit({{ $warehouse->id }})" class="mr-2">
                    <x-svg.edit />
                  </x-jet-button>
                  <x-jet-danger-button wire:click="delete({{ $warehouse->id }})" class="mr-2">
                    <x-svg.trash />
                  </x-jet-danger-button>
                  @if ($warehouse->id != session()->get('warehouse_id'))
                    <x-jet-button wire:click="setDefault({{ $warehouse->id }})" class="mr-2">
                      <x-svg.check />
                    </x-jet-button>
                  @endif
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>

      </div>
    </div>
  </div>
</div>
