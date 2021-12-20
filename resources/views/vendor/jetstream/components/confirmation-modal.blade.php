@props(['id' => null, 'maxWidth' => null])

<x-jet-modal :id="$id" :maxWidth="$maxWidth" {{ $attributes }}>
  <div class="flex bg-gray-700">
    <svg class="mt-3 mx-3 h-8 w-8 text-red-600" stroke="currentColor" fill="none" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
        d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
    </svg>
    <div class="px-6 py-4 text-gray-100 text-left">
      <h3>{{ $title }}</h3>
    </div>
  </div>
  <div class="bg-gray-300 px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
    {{-- <div class="sm:flex sm:items-start"> --}}
    <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
      <div class="mt-2">
        {{ $content }}
      </div>
    </div>
    {{-- </div> --}}
  </div>

  <div class="px-6 py-4 bg-gray-500 text-right">
    {{ $footer }}
  </div>
</x-jet-modal>
