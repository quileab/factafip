<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                <x-jet-welcome />


                <div class="bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-2">
                    <div class="p-6">
                      <p>Rol: undefined</p>
                      <p>Depósito : <strong>{{ session()->get('default_warehouse_name') }}</strong></p>
                    </div>
                  </div>



            </div>
        </div>
    </div>
</x-app-layout>
