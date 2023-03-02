<div>
  <x-jet-dialog-modal icon='edit' wire:model="openSaveModal">
    <x-slot name="title">Guardar Lista de Productos como...</x-slot>
    <x-slot name="content">
      <x-jet-input type="text" wire:model.defer='invoiceSaveName' class="w-full" />
    </x-slot>
    <x-slot name="footer">
      <div class="flex justify-between">
      <x-jet-secondary-button wire:click="$toggle('openSaveModal')" wire:loading.attr="disabled">
        Salir
      </x-jet-secondary-button>
      <x-jet-button wire:click="invoiceSave" wire:loading.attr="disabled">
        Guardar
      </x-jet-button>
      </div>
    </x-slot>
  </x-jet-dialog-modal>

  <x-jet-dialog-modal icon='edit' wire:model="afipModal">
    <x-slot name="title">AFIP ERROR</x-slot>
    <x-slot name="content">
      <div class="text-red-800 text-md">{{ $afipError }}</div>
    </x-slot>
    <x-slot name="footer">
      <x-jet-secondary-button wire:click="$toggle('afipModal')" wire:loading.attr="disabled">
        Salir
      </x-jet-secondary-button>
    </x-slot>
  </x-jet-dialog-modal>

  <x-jet-dialog-modal icon='edit' wire:model="openModal" maxWidth="full">
    <x-slot name="title">
      <div class="flex items-center">
        <x-svg.cartPlus class="w-8 h-8 mr-2" />
        <div class="w-3/4 mx-1">
          <x-jet-label for="ProdSearch" class="text-gray-50">Buscar</x-jet-label>
          <x-jet-input id="ProdSearch" type="search"
            wire:model.lazy="ProdSearch"
            class="w-full"
            placeholder="Buscar producto" />
        </div>
        <div class="w-1/4 mx-1">
          <x-jet-label for="quantity" class="text-gray-50">Cantidad</x-jet-label>
          <x-jet-input id="quantity" type="number" wire:model.defer="quantity" min="0" class="w-full" />
        </div>
      </div>
    </x-slot>

    {{-- <x-slot name="content">
      <table class="w-full overflow-hidden rounded-md" id="myTable"
      x-on:keyup.down="nextProduct()"
      x-on:keyup.up="prevProduct()"
      >
        <thead class="text-gray-100 bg-gray-800 text-center text-sm">
          <tr>
            <th>Productos</th>
            @if (($products!=[]) && ($products->count() ==1))
            <th>Precios</th>
            <th>Descuento</th>
            <th><x-svg.collection class="inline" /></th>
            @endif
          </tr>
        </thead>
        <tbody>
          @foreach ($products as $product)
            <tr>
              <td>
                <p class="w-full truncate px-2">
                  <button wire:click="selectProduct({{$product->id}})" 
                    id="prod{{$loop->index}}"
                    class="w-full text-left focus:bg-blue-200 focus:p-1">
                  {{ $product->brand }}: {{ $product->model }}: {{ $product->description }}
                  </button>
                </p>
              </td>
              @if (($products!=[]) && ($products->count() ==1))
              <td>
                <input list="prices" wire:model="price" id="priceDropdown" autocomplete="off" class="w-full" /></label>
                <datalist id="prices">
                  <option value="{{$product->sale_price1}}">
                  <option value="{{$product->sale_price2}}">
                </datalist>               
              </td>
              <td>
                <x-jet-input type="number" min="0" max="{{$product->discount_max}}" class="w-full"
                  wire:model.lazy="discount" />
              </td>
              <td>
                <button wire:click="addToCart({{$product->id}},'{{$price}}')"
                  class="m-0 px-4 py-2 w-full border-2 border-white focus:outline-none text-white bg-green-800 hover:bg-green-700 focus:ring-4 focus:ring-purple-500 rounded-lg text-sm">
                  <x-svg.cartPlus class="inline w-5 h-5 mx-auto" />
                </button>
              </td>
              @endif
            </tr>
          @endforeach
        </tbody>
      </table>

    </x-slot> --}}

    <x-slot name="content">
      <select multiple size=20 class="w-full rounded overflow-hidden">
      @foreach ($products as $product)
        <option value="{{ $product->id }}" class="p-0 m-0">
          {{ $product->brand }}: {{ $product->model }}: {{ $product->description }}
        </option>

        {{-- if only one product --}}
        @if (($products!=[]) && ($products->count() ==1))

        <input list="prices" wire:model="price" id="priceDropdown" autocomplete="off" class="w-full" /></label>
        <datalist id="prices">
          <option value="{{$product->sale_price1}}">
          <option value="{{$product->sale_price2}}">
        </datalist> 
        
        <button wire:click="addToCart({{$product->id}},'{{$price}}')"
          class="m-0 px-4 py-2 w-full border-2 border-white focus:outline-none text-white bg-green-800 hover:bg-green-700 focus:ring-4 focus:ring-purple-500 rounded-lg text-sm">
          <x-svg.cartPlus class="inline w-5 h-5 mx-auto" />
        </button>
        
        @endif
        {{-- end of one product --}}


      @endforeach
      </select>

    </x-slot>

    <x-slot name="footer">
      <div class="flex justify-between">
        <x-jet-secondary-button wire:click="$toggle('openModal')" wire:loading.attr="disabled">
          Salir
        </x-jet-secondary-button>

      </div>
    </x-slot>
  </x-jet-dialog-modal>

  <div class="mx-auto mt-5 max-w-7xl sm:px-6 lg:px-8">
    <div class="overflow-hidden bg-gray-200 rounded-md shadow-xl">
      <div class="flex items-center px-3 pt-2 text-white d2c">
        <div><x-svg.user class="w-8 h-8" /></div>
        <div class="w-full mx-1 text-sm overflow-clip">
          {{ $customer->name ?? 'N/A' }}<br />
          {{ $customer->business_name ?? 'N/A' }}
          {{-- <x-svg.warehouse class="inline w-6 ml-4" /> {{ $warehouse->id ?? 'N/A' }}:
          {{ $warehouse->name ?? 'N/A' }} --}}
        </div>
        <div>
          <x-svg.fileInvoice class="w-8 h-8" />
        </div>
        <div class="w-full mx-1">
          <label for="CbteTipo" class="block text-xs">
            Tipo de comprobante
          </label>
          <select wire:model="CbteTipo" class="w-full mt-0 py-1">
            @foreach ($voucher_types as $voucherType)
              <option value="{{ $voucherType->id }}">{{ $voucherType->value }}</option>
            @endforeach
          </select>
        </div>
        <div class="w-full mx-1">
          <label for="invoice_PtoVta" class="block text-xs">
            Punto de Venta
          </label>
          <x-jet-input wire:model="invoice_PtoVta" class="w-full mt-0 py-1" type="number" min="1" max="9999" />
          <x-jet-input-error for="invoice_PtoVta" class="mt-1" />
        </div>
        <div class="w-full mx-1">
          <label for="invoice_PtoVta" class="block text-xs">
            Número
          </label>
          <x-jet-input readonly wire:model="invoice_number" class="w-full mt-0 py-1" type="number" min="1"
            max="99999999" />
          <x-jet-input-error for="invoice_number" class="mt-1" />
        </div>
      </div>


      <div class="flex px-4 py-0">
        @if($searchType==true)
        <div class="flex w-3/4 align-middle">
          <x-jet-secondary-button wire:click="$toggle('searchType')" class="mr-1">
          <x-svg.barcodeScan />
          </x-jet-secondary-button>
          <x-jet-input wire:model.lazy="search" wire:keydown.enter='inputBarcode()' class="mr-1 py-1 w-max"
            type="text" />

          <x-svg.collection class="inline mt-3 mr-1" />
            <x-jet-input wire:model="quantity" class="mr-1 py-1" type="number" min="1" max="9999" />
            <select wire:model="defaultPriceCol" class="py-1 pr-8 mx-1 appearance-none">
              <option value="1">Precio 1</option>
              <option value="2">Precio 2</option>
            </select>
        </div>
        @else
        <div class="flex w-3/4 align-middle">
          <div class="flex flex-wrap gap-2">
          <x-jet-secondary-button wire:click="$toggle('searchType')" class="mr-1">
          <x-svg.search />
          </x-jet-secondary-button>
          <x-jet-input id="ProdSearch" type="search"
          wire:model.lazy="ProdSearch" class="w-max"
          placeholder="Buscar producto" /><br />
          <select class="rounded">
            @foreach ($products as $product)
              <option value="{{ $product->id }}" class="p-0 m-0">
                {{ $product->brand }}: {{ $product->model }}: {{ $product->description }}
              </option>
            @endforeach
      

          <x-svg.collection class="w-6 h-6" />
            <x-jet-input wire:model="quantity" class="mr-1 py-1" type="number" min="1" max="9999" />

            <input list="prices" wire:model="price" id="priceDropdown" autocomplete="off" /></label>
            <datalist id="prices">
              <option value="{{$product->sale_price1 ?? 0}}">
              <option value="{{$product->sale_price2 ?? 0}}">
            </datalist> 
            
            <button 
            {{-- wire:click="addToCart({{$product->id}},'{{$price}}')" --}}
              class="px-4 py-2 border-2 border-white focus:outline-none text-white bg-green-800 hover:bg-green-700 focus:ring-4 focus:ring-purple-500 rounded-lg text-sm">
              <x-svg.cartPlus class="inline w-5 h-5 mx-auto" />
            </button>
          </div>
        </div>
        @endif
        <div class="text-center pt-1 w-1/4 text-3xl bg-gray-100">
          <small>TOTAL: $</small> <strong>{{ $total_integer }}</strong>,<sup>{{ $total_decimal }}</sup><br />
        </div>
      </div>

      <table class="w-full">
        <thead class="text-gray-100 bg-gray-800 text-sm">
          <tr>
            <th class="px-2 py-1">Código</th>
            <th class="px-2 py-1">Descripción</th>
            <th class="px-2 py-1">Cant.</th>
            <th class="px-2 py-1">Precio Unitario</th>
            <th class="px-2 py-1">Desc. %</th>
            <th class="px-2 py-1">Subtotal</th>
            <th class="px-2 py-1">
              {{-- green button rounded with text Agregar --}}
              <button class="bg-green-700 hover:bg-green-600 text-white font-bold py-1 px-2 rounded uppercase text-xs"
                wire:click="searchProductsModal" accesskey="a">
                <x-svg.cartPlus class="inline" />
                {{Cart::content()->count();}}&ThinSpace;
                Agregar
              </button>
            </th>
          </tr>
        </thead>
        <tbody>
          @foreach ($cart as $key=>$item)
            <tr class="max-h-1">
              <td class="px-2 py-1 text-center">{{ $item->id }}</td>
              <td class="px-2 py-1 text-sm">{{ $item->name }}</td>
              <td class="px-2 py-1 text-right">{{ $item->qty }}</td>
              <td class="px-2 py-1 text-right">{{ number_format($item->price, 2, ',', '.') }}</td>
              <td class="px-2 py-1 text-center">{{ $item->discountRate }}</td>
              <td class="px-2 py-1 text-right">{{ number_format($item->qty * ($item->price-($item->price*$item->discountRate/100)), 2, ',', '.') }}</td>
              <td class="px-2 py-1 text-center">
              <x-jet-danger-button wire:click="removeItem('{{ $item->rowId }}')">
                <x-svg.trash />
              </x-jet-danger-button>
              <x-jet-button wire:click="removeOneItem('{{ $item->rowId }}')">
                <x-svg.cartDash />
              </x-jet-button>
              </td>
            </tr>
          @endforeach
        </tbody>
      </table>
    </div>

      <div class="flex text-center">
      @if($total > 0)
        <a href="#"
        {{-- target="_blank"  --}}
          class="px-3 py-1 text-white border-2 border-gray-700 rounded-md shadow-md bg-sky-700 hover:bg-sky-600"
            wire:click="invoiceCreate">
          <x-svg.afip class="w-14 mr-2" />Facturar
        </a>

        <a href="#"
          class="px-3 py-1 text-white border-2 border-gray-700 rounded-md shadow-md bg-green-700 hover:bg-green-600"
            wire:click="$set('openSaveModal',true)">
          <x-svg.cloudUp class="w-14 mr-2" />Guardar
        </a>

      @endif
        <a href="/laterfiles"
        class="px-3 py-1 text-white border-2 border-gray-700 rounded-md shadow-md bg-green-700 hover:bg-green-600"
        >
        <x-svg.fileInvoice class="w-14 mr-2" />Buscar
        </a>
    </div>
  </div>

  {{-- <x-jet-button color="green" wire:click="$set('debugging', {{!$debugging}})" >
    debugCart {{$debugging}}
  </x-jet-button> --}}

<script>
  var prodIndex=0;
  function nextProduct(){
    //document.preventDefault();
    this.prodIndex++;
    document.getElementById('prod'+prodIndex).focus();
  }
  function prevProduct(){
    //document.preventDefault();
    this.prodIndex--;
    document.getElementById('prod'+prodIndex).focus();
  }

</script>
  


</div>
