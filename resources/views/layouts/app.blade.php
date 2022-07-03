@php
$nav_links = [
    [
        'name' => 'Dashboard',
        'route' => route('dashboard'),
        'active' => request()->routeIs('dashboard'),
        'permission' => 'menu.dashboard',
    ],
    [
        'name' => 'Clientes',
        'route' => route('customers'),
        'active' => request()->routeIs('customers'),
        'permission' => 'menu.customers',
    ],
    [
        'name' => 'Depósitos',
        'route' => route('warehouses'),
        'active' => request()->routeIs('warehouses'),
        'permission' => 'menu.warehouses',
    ],
    [
        'name' => 'Productos',
        'route' => route('products'),
        'active' => request()->routeIs('products'),
        'permission' => 'menu.products',
    ],
    [
        'name' => 'Facturas',
        'route' => route('invoices'),
        'active' => request()->routeIs('invoices'),
        'permission' => 'menu.invoices',
    ],
    // [
    //   'name' => 'Libros',
    //   'route' => route('books'),
    //   'active' => request()->routeIs('books'),
    //   'permission'=>'menu.books',
    // ],
    // [
    //   'name' => 'Info Tarjetas',
    //   'route' => route('infocards'),
    //   'active' => request()->routeIs('infocards'),
    //   'permission'=>'menu.infocards',
    // ],
    // [
    //   'name' => 'Planes de Pago',
    //   'route' => route('payplans'),
    //   'active' => request()->routeIs('payplans'),
    //   'permission'=>'menu.payplans',
    // ],
    // [
    //   'name' => 'Roles & Permisos',
    //   'route' => route('permissions'),
    //   'active' => request()->routeIs('permissions'),
    //   'permission'=>'menu.security',
    // ],
    // [
    //   'name' => 'Configuración',
    //   'route' => route('configs'),
    //   'active' => request()->routeIs('configs'),
    //   'permission'=>'menu.config',
    // ],
];
@endphp
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>{{ config('app.name', 'FactAfip') }}</title>
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- favicon -->
  <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('img/favicon/apple-touch-icon.png') }}">
  <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('img/favicon/favicon-32x32.png') }}">
  <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('img/favicon/favicon-16x16.png') }}">
  <link rel="manifest" href="{{ asset('img/favicon/site.webmanifest') }}">
  <!-- Styles -->
  @vite('resources/css/app.css')
  <style>
    .swal2-title {
      color: aliceblue !important;
      font-size: 1.2rem !important;
    }

    .bg-img {
      background-color: #fafafa;
      background-image: url("{{ asset('img/wallpaper.jpg') }}");
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }

  </style>
  @livewireStyles

  <!-- Scripts -->
  @vite('resources/js/app.js')
</head>

<body>
  {{-- qb template --}}
  <div id="bg" class="relative min-h-screen md:flex">
    {{-- mobile navbar --}}
    <div class="flex justify-between text-gray-100 bg-gray-800 md:hidden">
      {{-- logo --}}
      <div class="block p-4">
        <a href="{{ route('dashboard') }}">
          <x-jet-application-mark class="block w-auto h-9" />
        </a>
      </div>
      <button class="p-4 focus:outline-none focus:bg-gray-700"
        onclick="document.querySelector('.sidbar').classList.toggle('-translate-x-full')">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
          stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </button>

    </div>

    {{-- sidebar --}}
    <div
      class="z-50 absolute inset-y-0 left-0 w-56 transition duration-200 ease-in-out transform -translate-x-full bg-gray-600 sidbar text-gray-50 md:relative md:translate-x-0 ">
      {{-- Logo & profile --}}
      <div class="flex justify-between bg-gray-800">
        {{-- logo --}}
        <div class="flex items-end flex-shrink-0 mx-4 my-4">
          <a href="{{ route('dashboard') }}">
            <x-jet-application-mark class="block w-auto h-9" />
          </a>
        </div>

        <!-- Settings Dropdown -->
        <div class="hidden mr-4 sm:flex sm:items-center sm:ml-6">
          <x-jet-dropdown>
            <x-slot name="trigger">
              @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                <button
                  class="flex text-sm transition duration-150 ease-in-out border-2 border-transparent rounded-full focus:outline-none focus:border-gray-300">
                  <img class="object-cover w-8 h-8 rounded-full" src="{{ Auth::user()->profile_photo_url }}"
                    alt="{{ Auth::user()->name }}" />
                </button>
              @else
                <button
                  class="flex items-center text-sm font-medium text-gray-200 transition duration-150 ease-in-out hover:text-gray-50 hover:border-gray-300 focus:outline-none">
                  <div>{{ Auth::user()->name }}</div>

                  <div class="ml-1">
                    <svg class="w-4 h-4 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                      <path fill-rule="evenodd"
                        d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                        clip-rule="evenodd" />
                    </svg>
                  </div>
                </button>
              @endif
            </x-slot>

            <x-slot name="content">
              <!-- Account Management -->
              <div class="block px-4 py-2 text-xs text-gray-400">
                {{ __('messages.Manage Account') }}
              </div>

              <x-jet-dropdown-link href="{{ route('profile.show') }}">
                {{ __('messages.Profile') }}
              </x-jet-dropdown-link>

              @if (Laravel\Jetstream\Jetstream::hasApiFeatures())
                <x-jet-dropdown-link href="{{ route('api-tokens.index') }}">
                  {{ __('API Tokens') }}
                </x-jet-dropdown-link>
              @endif

              <div class="border-t border-gray-100"></div>

              <!-- Team Management -->
              @if (Laravel\Jetstream\Jetstream::hasTeamFeatures())
                <div class="block px-4 py-2 text-xs text-gray-400">
                  {{ __('Manage Team') }}
                </div>

                <!-- Team Settings -->
                <x-jet-dropdown-link href="{{ route('teams.show', Auth::user()->currentTeam->id) }}">
                  {{ __('Team Settings') }}
                </x-jet-dropdown-link>

                @can('create', Laravel\Jetstream\Jetstream::newTeamModel())
                  <x-jet-dropdown-link href="{{ route('teams.create') }}">
                    {{ __('Create New Team') }}
                  </x-jet-dropdown-link>
                @endcan

                <div class="border-t border-gray-100"></div>

                <!-- Team Switcher -->
                <div class="block px-4 py-2 text-xs text-gray-400">
                  {{ __('Switch Teams') }}
                </div>

                @foreach (Auth::user()->allTeams() as $team)
                  <x-jet-switchable-team :team="$team" />
                @endforeach

                <div class="border-t border-gray-100"></div>
              @endif

              <!-- Authentication -->
              <form method="POST" action="{{ route('logout') }}">
                @csrf
                <x-jet-dropdown-link href="{{ route('logout') }}" onclick="event.preventDefault();
                  this.closest('form').submit();">
                  {{ __('messages.Logout') }}
                </x-jet-dropdown-link>
              </form>
            </x-slot>
          </x-jet-dropdown>
        </div>
      </div>

      <nav class="text-gray-50 overflow-hidden">
        @foreach ($nav_links as $nav_link)
          {{-- @can($nav_link['permission']) --}}
          <x-jet-nav-link class="block w-full px-4 py-2" href="{{ $nav_link['route'] }}" :active="$nav_link['active']">
            &nbsp;&nbsp; {{ __($nav_link['name']) }}
          </x-jet-nav-link>
          {{-- <br /> --}}
          {{-- @endcan --}}
        @endforeach
      </nav>

    </div>

    {{-- content --}}
    <div class="bg-img flex-1 py-0 mx-auto">
      <!-- Page Content -->
      <main>
        @livewire('assets.bookmark')
        {{ $slot }}
      </main>
    </div>


  </div>
  {{-- end qb template --}}
  @stack('modals')
  @livewireScripts
  @stack('scripts')
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script>
    //on input get focus select all text vanilla js
    document.querySelectorAll('input').forEach(function(input) {
      input.addEventListener('focus', function() {
        this.select();
      });
    });

    //livewire set focus to control
    window.livewire.on('setfocus', (id) => {
      window.setTimeout(function() {
        document.getElementById(id).focus();
      }, 250);
    });

    livewire.on('bookmark', function(message) {
      document.getElementById('bookmark').innerHTML = message;
    });

    livewire.on('toast', function(message, icon) {
      if (icon == '') {
        icon = 'success'
      }
      switch (icon) {
        case 'success':
          bgcolor = '#237539';
          break;
        case 'warning':
          bgcolor = '#d67200';
          break;
        case 'error':
          bgcolor = '#b80000';
          break;
        case 'info':
          bgcolor = '#0a3f80';
          break;
        case 'question':
          bgcolor = '#8a0a61';
          break;
      }
      Swal.fire({
        icon: icon,
        iconColor: '#ffffff',
        background: bgcolor,
        title: message,
        toast: true,
        position: 'top-end',
        timerProgressBar: true,
        showConfirmButton: false,
        timer: 3500,
      })
    });

    livewire.on('confirmDelete', function(message, uid, callback) {
      Swal.fire({
        //title: 'Está seguro?',
        text: "Eliminar " + message + "?",
        icon: 'warning',
        iconColor: '#ffaa00',
        showCancelButton: true,
        confirmButtonColor: '#065f46',
        cancelButtonColor: '#b91c1c',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Eliminar',
        background: '#dddddd',
        padding: '0.5rem'
      }).then((result) => {
        if (result.isConfirmed) {
          // Livewire.emit('delete', uid);
          Livewire.emit(callback, uid);
        }
      })
    });
  </script>
</body>

</html>
