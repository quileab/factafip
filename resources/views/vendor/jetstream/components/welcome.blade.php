<div class="py-2 text-white d2c px-5">
  <div class="flex items-center justify-between">
    <div class="flex items-center text-lg">
      <x-jet-application-mark class="w-auto h-8 mr-3" />
      Bienvenido
    </div>
    <span>
      <p class="text-xs opacity-50 ">
        FWK{{ app()->version() }} |
        PHP{{ phpversion() }} |
        {{ env('APP_ENV') }} |
        {{ env('APP_DEBUG') == 0 ? 'DBGoff' : 'DBGon' }}
      </p>
    </span>

  </div>
</div>
