@props(['id' => null, 'maxWidth' => null])

<x-jet-modal :id="$id" :maxWidth="$maxWidth" {{ $attributes }}>
    <div class="text-xl bg-gray-700 text-gray-100 px-6 py-3">
        {{ $title }}
    </div>
    <div class="px-4 py-1 bg-gray-200">
        <div class="mt-1">
            {{ $content }}
        </div>
    </div>

    <div class="px-6 py-2 bg-gray-600">
        {{ $footer }}
    </div>
</x-jet-modal>
