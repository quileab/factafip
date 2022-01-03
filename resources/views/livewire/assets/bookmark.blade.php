<div class="z-0">
  <div class="relative top-0 flex px-2 py-2 text-xs text-gray-300 bg-gray-700 shadow-md opacity-75 rounded-r-md">
    {{-- if session 'bookmarkedId' --}}
    @if (session()->has('bookmark'))
      <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="currentColor" class="bi bi-bookmark-check-fill"
        viewBox="0 0 16 16">
        <path fill-rule="evenodd"
          d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
      </svg>&nbsp;
      <span class="mt-1 text-white">{{ $bookmarked->lastname }}, {{ $bookmarked->firstname }}</span>
      
      <button wire:click="$emit('removeBookmark')" class="ml-1">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
        stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
        d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    </button>
    
    @else
    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="currentColor" class="bi bi-bookmark"
    viewBox="0 0 16 16">
    <path
    d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
  </svg>
  @endif
  <span class="mt-1 text-white">{{ session()->get('warehouse_id') }}» {{ session()->get('warehouse_name') }}</span>
  </div>
</div>
