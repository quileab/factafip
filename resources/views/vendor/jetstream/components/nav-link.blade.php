@props(['active'])

@php
$classes = ($active ?? false)
            ? 'inline-flex items-center px-1 pt-2 border-b-1 text-sm font-medium leading-5 focus:outline-none focus:border-indigo-700 transition c2d'
            : 'inline-flex items-center px-1 pt-2 border-b-1 border-transparent text-sm font-medium leading-5 hover:bg-gray-300 hover:text-gray-700 hover:border-gray-300 focus:outline-none focus:text-gray-700 focus:border-gray-300 transition';
@endphp

<a {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>
