<div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 c2d"
style="
background-color: #fafafa;
background-image: url({{ asset('img/wallpaper.jpg') }});
background-size: cover;
background-repeat: no-repeat;
background-attachment: fixed;
">
    <div>
        {{ $logo }}
    </div>

    <div class="w-full sm:max-w-md mt-6 px-6 py-4 border-gray-100/60 border bg-gray-200/50 backdrop-blur-sm shadow-xl overflow-hidden sm:rounded">
        {{ $slot }}
    </div>
</div>
