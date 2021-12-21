<div class="p-6 sm:px-20 bg-gray-600 text-white">
  <div class="flex items-center">
    <div>
      <x-jet-application-mark class="block h-12 w-auto" />
    </div>

    <div class="ml-4 text-2xl">
      Bienvenido
    </div>
  </div>
  <div class="mt-6 text-gray-300">
    <p class="text-base">
      {{ Auth()->user()->email }}
    </p>
  </div>
</div>

<div class="bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-2">
  <div class="p-6">
    Rol: undefined
  </div>
</div>
