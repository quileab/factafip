<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="overflow-hidden shadow-xl bg-white/75 backdrop-blur sm:rounded-lg">
                <x-jet-welcome />


                <div class="grid grid-cols-1 md:grid-cols-2">
                    <div class="p-6">
                      <p>Rol: undefined</p>
                      <p>Depósito : <strong>{{ session()->get('warehouse_name') }}</strong></p>
                    </div>
                    <div class="p-6">

                          <table class="w-full shadow-lg">
                              <tr class="text-white bg-gray-700">
                                  <th class="px-2 py-1">AFIP</th>
                                  <th class="px-2 py-1">Valor</th>
                              </tr>
                            @foreach ($data as $key => $value)
                              <tr>
                                  <td class="px-2 py-1">{{$key}}</td>
                                  <td class="px-2 py-1 text-center">{{$value}}</td>
                              </tr>
                                
                            @endforeach
                          </table>


                    </div>
                  </div>



            </div>
        </div>
    </div>
</x-app-layout>
