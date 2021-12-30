@props(['disabled' => false, 'id'=>''])

{{-- <input {{ $disabled ? 'disabled' : '' }} {!! $attributes->merge(['class' => 'border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm']) !!}> --}}
<input {{ $disabled ? 'disabled' : '' }} {{ $id ? "id=$id" : '' }} {!! $attributes->merge(['class' => 'bg-gray-50 text-gray-900 my-1 px-4 py-2 border-gray-500 focus:border-fuchsia-500 focus:ring focus:ring-fuchsia-500 focus:ring-opacity-50 rounded-md shadow-sm']) !!}>
