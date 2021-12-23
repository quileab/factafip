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
    <div class="m-2 overflow-hidden bg-gray-200 rounded-md shadow-xl">
      <div class="flex justify-between px-3 py-2 text-white bg-gray-600">
        <div class="flex">
          <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" fill="currentColor" stroke="currentColor"
            viewBox="0 0 101 101">
            <path
              d="M88.38,32.29l-37-27a1.5,1.5,0,0,0-1.78,0l-36,27a1.5,1.5,0,0,0-.6,1.2v52A1.5,1.5,0,0,0,14.5,87h73A1.5,1.5,0,0,0,89,85.5v-52A1.5,1.5,0,0,0,88.38,32.29ZM75,65H59V50H75ZM56,84H41V68H56Zm3-16H75V84H59ZM75,47H57.5A1.5,1.5,0,0,0,56,48.5V65H39.5A1.5,1.5,0,0,0,38,66.5V84H28V40H75ZM86,84H78V38.5A1.5,1.5,0,0,0,76.5,37h-50A1.5,1.5,0,0,0,25,38.5V84H16V34.25L50.51,8.37,86,34.26Z" />
          </svg>
          <div class="ml-4 text-lg">
            Depósitos
          </div>
        </div>
        <x-jet-input wire:model.lazy="search" type="search" class="w-full mx-3" placeholder="Buscar..." />

        <x-jet-button wire:click="newWarehouse">Nuevo</x-jet-button>
      </div>
      <div class="p-4">
        {{-- show list of customers in table --}}
        <table class="table-auto w-full">
          <thead>
            <tr>
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
              <tr>
                <td class="border px-4 py-2">{{ $warehouse->id }}</td>
                <td class="border px-4 py-2">{{ $warehouse->name }}</td>
                <td class="border px-4 py-2">{{ $warehouse->contact_person }}</td>
                <td class="border px-4 py-2">{{ $warehouse->email }}</td>
                <td class="border px-4 py-2">{{ $warehouse->phone }}</td>
                <td class="border px-4 py-2">
                  <x-jet-button wire:click="edit({{ $warehouse->id }})" class="mr-2">Editar</x-jet-button>
                  <x-jet-danger-button wire:click="delete({{ $warehouse->id }})" class="mr-2">Eliminar
                  </x-jet-danger-button>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>

      </div>
    </div>
  </div>
</div>
