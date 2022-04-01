<div wire:init="loadData">

  <x-jet-dialog-modal icon='edit' wire:model="openModal">
    <x-slot name="title">
      <small>ID: </small><strong>{{ $id ?? '' }}</strong> » <small>Cliente:
      </small><strong>{{ $name ?? '' }}</strong>
    </x-slot>

    <x-slot name="content">

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="ID/DNI" />
          <x-jet-input type="number" wire:model.defer='customer_id' class="w-full" />
          <x-jet-input-error for="customer_id" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Tipo" />
          <select wire:model.lazy="customer_id_type" name="customer_id_type" id="customer_id_type">
            @foreach ($customers_id_type_id as $type_id)
              <option value="{{ $type_id->id }}">
                {{ $type_id->id }}· {{ $type_id->value }}
              </option>
            @endforeach
          </select>
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="Apellido/s y Nombre/s" />
          <x-jet-input type='text' wire:model.lazy='customer_name' value="{{ $customer_name ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="customer_name" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Nombre Empresa" />
          <x-jet-input type='text' wire:model.lazy='customer_business_name'
            value="{{ $customer_business_name ?? '' }}" class="w-full" />
          <x-jet-input-error for="customer_business_name" />
        </div>
      </div>

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="CUIT" />
          <x-jet-input type='text' wire:model.lazy='customer_CUIT' value="{{ $customer_CUIT ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="customer_CUIT" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Responsable tipo" />
          <select wire:model.lazy="customer_responsibility_type_id" name="customer_responsibility_type_id"
            id="customer_responsibility_type_id">
            @foreach ($responsibility_types_id as $resp_type_id)
              <option value="{{ $resp_type_id->id }}">
                {{ $resp_type_id->id }}· {{ $resp_type_id->value }}
              </option>
            @endforeach
          </select>
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="Dirección" />
          <x-jet-input type='text' wire:model.lazy='customer_address' value="{{ $customer_address ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="customer_address" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Ciudad" />
          <x-jet-input type='text' wire:model.lazy='customer_city' value="{{ $customer_city ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="customer_city" />
        </div>
      </div>

      <div class="flex flex-col ml-3">
        <x-jet-label value="Provincia" />
        <select wire:model.lazy="customer_province_id" name="customer_province_id"
          id="customer_province_id">
          @foreach ($province_id_type_id as $province_type_id)
            <option value="{{ $province_type_id->id }}">
              {{ $province_type_id->id }}· {{ $province_type_id->value }}
            </option>
          @endforeach
        </select>
      </div>

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="EMail" />
          <x-jet-input type='email' wire:model.lazy='customer_email' value="{{ $customer_email ?? '' }}" class="w-full" />
          <x-jet-input-error for="customer_email" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Teléfono" />
          <x-jet-input type='tel' wire:model.lazy='customer_phone' value="{{ $customer_phone ?? '' }}" class="w-full" />
          <x-jet-input-error for="customer_phone" />
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
        <div class="flex">
          <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" fill="none" viewBox="0 0 24 24"
            stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
          <div class="ml-4 text-lg">
            Clientes
          </div>
        </div>
        <x-jet-input wire:model.lazy="search" type="search" class="w-full mx-3" placeholder="Buscar..." />

        <x-jet-button wire:click="newCustomerModalShow">Nuevo</x-jet-button>
      </div>
      <div class="pb-4">
        {{-- show list of customers in table --}}
        <table class="w-full table-auto">
          <thead>
            <tr class="text-white bg-gray-800">
              <th class="px-4 py-2">ID</th>
              <th class="px-4 py-2">Nombre</th>
              <th class="px-4 py-2">Empresa</th>
              <th class="px-4 py-2">Acciones</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($customers as $customer)
              <tr>
                <td class="px-4 py-2 border">{{ $customer->id }}</td>
                <td class="px-4 py-2 border">{{ $customer->name }}</td>
                <td class="px-4 py-2 border">{{ $customer->business_name }}</td>
                <td class="flex px-4 py-2 text-right border">
                  <x-jet-button wire:click="edit({{ $customer->id }})" class="mr-1"><x-svg.edit /></x-jet-button>
                  <x-jet-danger-button wire:click="delete({{ $customer->id }})" class="mr-1"><x-svg.trash /></x-jet-danger-button>
                  <x-jet-secondary-button wire:click="invoice({{ $customer->id }})" class="mr-1"><x-svg.fileInvoice /></x-jet-secondary-button>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>


      </div>
    </div>
  </div>
</div>
