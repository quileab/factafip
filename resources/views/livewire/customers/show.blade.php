<div wire:init="loadData">

  <x-jet-dialog-modal icon='edit' wire:model="openModal">
    <x-slot name="title">
      <small>ID: </small><strong>{{ $id ?? '' }}</strong> » <small>Cliente:
      </small><strong>{{ $name ?? '' }}</strong>
    </x-slot>

    <x-slot name="content">

      <div class="flex items-center">
        <div class="w-1/3 ml-3">
          <x-jet-label value="ID/DNI" />
          <x-jet-input type="number" class="w-full" wire:model.defer='pid' />
          <x-jet-input-error for="pid" />
        </div>
      </div>

      Tipo
      <select wire:model.lazy="office" wire:change.lazy="officeChanged" name="office" id="office">
          @foreach ($customers_id_type_id as $type_id)
              <option value="{{ $type_id->id }}">
                  {{ $type_id->value }}
              </option>
          @endforeach
      </select>

      <div class="flex">
        <div class="w-1/3 ml-3">
          <x-jet-label value="Apellido/s" />
          <x-jet-input type='text' wire:model.lazy='lastname' value='{{ $lastname ?? ''}}' class="w-full" />
          <x-jet-input-error for="lastname" />
        </div>
        <div class="w-2/3 ml-3">
          <x-jet-label value="Nombre/s" />
          <x-jet-input type='text' wire:model.lazy='firstname' value='{{ $name ?? '' }}' class="w-full" />
          <x-jet-input-error for="firstname" />
        </div>
      </div>

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="EMail" />
          <x-jet-input type='email' wire:model.lazy='email' value='{{ $email ?? '' }}' class="w-full" />
          <x-jet-input-error for="email" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Teléfono" />
          <x-jet-input type='tel' wire:model.lazy='phone' value='{{ $phone ?? '' }}' class="w-full" />
          <x-jet-input-error for="phone" />
        </div>
      </div>

      {{-- @if ($updating)
        <fieldset class="my-2 overflow-hidden bg-gray-500 rounded-md">
          <legend class="p-1 px-2 bg-gray-500 rounded-md text-gray-50">Carreras</legend>
          @foreach ($student_careers as $item)
            <div class="flex justify-between mx-1 my-1 rounded-md bg-gradient-to-b from-gray-200 to-gray-300">
              <span class="p-2">{{ $item->name }}</span>
              <x-jet-button
                wire:click="$emit('confirmDelete','{{ $item->name }}','{{ $item->id }}','deleteCareer')"
                color="red" class="w-4/4">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd"
                    d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                    clip-rule="evenodd" />
                </svg>
              </x-jet-button>
            </div>
          @endforeach
          <div class="flex items-center justify-between p-2">
            <span class="text-gray-50">Agregar Carrera/s</span>
            <select wire:model.lazy="career_id" name="career_id" id="career_id" class="bg-white">
              @foreach ($careers as $career)
                <option value="{{ $career->id }}">{{ $career->name }}</option>
              @endforeach
            </select>
            <x-jet-button wire:click="addCareer">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
              </svg>&nbsp;Agregar</x-jet-button>
          </div>
        </fieldset>
      @endif --}}

    </x-slot>

    <x-slot name="footer">
      <div class="flex justify-between">
        <x-jet-secondary-button wire:click="$toggle('openModal')" wire:loading.attr="disabled">
          Salir
        </x-jet-secondary-button>

        {{-- @if ($formAction == 'store')
          <x-jet-button wire:click="store" class="px-3 py-1 text-xs font-bold text-white rounded">
            <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>&nbsp;Crear
          </x-jet-button>
        @else
          <x-jet-button class="ml-2" wire:click="saveChange" wire:loading.attr="disabled">
            Modificar
          </x-jet-button>
        @endif --}}

      </div>
    </x-slot>
  </x-jet-dialog-modal>


<div class="mx-auto mt-5 max-w-7xl sm:px-6 lg:px-8">
  <div class="m-2 overflow-hidden bg-gray-200 rounded-md shadow-xl">
    <div class="flex justify-start px-3 py-2 text-white bg-gray-600">
      <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
        stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
          d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
      </svg>
      <div class="ml-4">
        Clientes
      </div>
    </div>
    Customers


    <x-jet-button wire:click="$set('openModal',true)">Modal</x-jet-button>

  </div>
</div>
</div>
