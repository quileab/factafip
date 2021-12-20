<div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gradient-to-b from-blue-800 to-green-900">
    <div>
        {{ $logo }}
    </div>

    <div class="w-full sm:max-w-md mt-6 px-6 py-4 border-gray-200 border bg-gray-400 shadow-md overflow-hidden sm:rounded">
        {{ $slot }}
    </div>
</div>
