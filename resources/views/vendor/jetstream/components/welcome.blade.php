<div class="py-2 text-white d2c sm:px-20">
  <div class="flex items-center justify-between">
    <div class="flex items-center text-lg">
      <x-jet-application-mark class="w-auto h-8 mr-3" />
      Bienvenido
    </div>
    <span>
      <p class="text-xs opacity-50 ">
        <x-svg.gear class="inline-block w-4 h-4 text-gray-400" />
        FWK{{ app()->version() }} |
        PHP{{ phpversion() }} |
        {{ env('APP_ENV') }} |
        {{ env('APP_DEBUG') == 0 ? 'DBGoff' : 'DBGon' }}
      </p>
    </span>

  </div>
</div>
