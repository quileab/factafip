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

  <div class="mx-0">
    <div class="bg-gray-200">
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

      <div class="flex gap-2 px-4 py-0 justify-between">
        <x-jet-secondary-button wire:click="$toggle('searchType')" accesskey="x">
          @if($searchType)
            <x-svg.barcodeScan />
          @else
            <x-svg.search />
          @endif
        </x-jet-secondary-button>
        @if($searchType==true)
        <div class="flex align-middle">
          <x-jet-input wire:model.lazy="search" wire:keydown.enter='inputBarcode()' class="mr-1 py-1 w-max"
            type="text" />

          <x-svg.collection class="inline mt-3 ml-3 mr-1 w-6 h-6" />
          <x-jet-input wire:model="quantity" class="mr-1 py-1" type="number" min="1" max="9999" />
          
          <select wire:model="defaultPriceCol" class="py-1 pr-8 mx-1 appearance-none">
            <option value="1">Precio 1</option>
            <option value="2">Precio 2</option>
          </select>
        </div>
        @else <!-- search by description -->
        <div class="flex flex-wrap gap-x-2 gap-y-1">
          <x-jet-input type="search" class="w-3/4" list="prods" autocomplete="off"
            accesskey="a"
            wire:model.lazy="ProdSearch" id="ProdSearch" />
          @if(!empty($ProdSearch))
            @if(!empty($products))
            <datalist id="prods">
              @foreach($products as $i => $product)
              <option value="{{ $product->id }}· {{ $product->description }} / {{ $product->brand }}: {{ $product->model }}" />
              @endforeach
            </datalist>
            @endif
          @else
          <datalist id="prods">
            <option value="Sin resultados!" />
          </datalist>
          @endif
          
          <x-jet-input list="prices" wire:model="price" id="priceDropdown" autocomplete="off" />
          <datalist id="prices">
            <option value="{{$selectedProduct->sale_price1 ?? 0}}">
            <option value="{{$selectedProduct->sale_price2 ?? 0}}">
          </datalist> 
              
          <x-svg.percent-solid class="mt-3 w-6 h-6" />
          <x-jet-input wire:model="discount" autocomplete="off"
            type="number" min="1" max="100" step=1 />
          
          <div class="flex">
            <x-svg.collection class="mt-3 w-6 h-6" />
            <x-jet-input wire:model="quantity" class="mr-1 py-1" type="number" min="1" max="9999" />
          </div>
         
          @if(isset($selectedProduct) &&
             ($selectedProduct->sale_price1+
              $selectedProduct->sale_price2>0 && $price>0))
            <button 
              wire:click="addToCart({{$selectedProduct->id ?? 0}},'{{$price ?? 0}}')"
              class="px-4 py-2 border-2 border-white focus:outline-none text-white bg-green-800 hover:bg-green-700 focus:ring-4 focus:ring-purple-500 rounded-lg text-sm">
              <x-svg.cartPlus class="inline w-5 h-5 mx-auto" />
            </button>
          @endif
          </div>

        @endif
        <div class="text-center pt-2 w-1/4 text-4xl bg-gray-50">
          <small>$</small> <strong>{{ $total_integer }}</strong>,<sup>{{ $total_decimal }}</sup><br />
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
            <th class="px-2 py-1">Acciones</th>
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
        <button class="px-3 py-1 text-white border-2 border-gray-700 rounded-md shadow-md bg-sky-700 hover:bg-sky-600"
          wire:click="invoiceCreate">
          <x-svg.afip class="w-14 mr-2" />Facturar
        </button>

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
</div>
