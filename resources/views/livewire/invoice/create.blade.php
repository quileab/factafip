<div>

  <x-jet-dialog-modal icon='edit' wire:model="openModal">
    <x-slot name="title">
      <div class="flex items-center">
        <x-svg.cartPlus class="w-8 h-8 mr-2" />
        <div class="w-3/4 mx-1">
          <x-jet-label for="ProdSearch" class="text-gray-50">Buscar</x-jet-label>
          <x-jet-input id="ProdSearch" type="search" wire:model.lazy="ProdSearch" class="w-full"
            placeholder="Buscar producto" />
        </div>
        <div class="w-1/4 mx-1">
          <x-jet-label for="quantity" class="text-gray-50">Cantidad</x-jet-label>
          <x-jet-input id="quantity" type="number" wire:model.lazy="quantity" min="0" class="w-full" />
        </div>
      </div>
    </x-slot>

    <x-slot name="content">
      <table class="w-full">
        <thead class="bg-gray-800 text-gray-100">
          <tr>
            <th>Productos</th>
            @if (($products!=[]) && ($products->count() ==1))
            <th>Precios</th>
            <th>Descuento</th>
            @endif
          </tr>
        </thead>
        <tbody>
          @foreach ($products as $product)
            <tr>
              <td>
                <p class="w-full truncate">
                  <button wire:click="selectProduct({{$product->id}})">
                  {{ $product->brand }}: {{ $product->model }}: {{ $product->description }}
                  </button>
                </p>
              </td>
              @if (($products!=[]) && ($products->count() ==1))
              <td>
                <select wire:model="priceColumn" id="priceDropdown" class="w-full">
                    <option value="1">{{currency_format($product->sale_price1)}}</option>
                    <option value="2">{{currency_format($product->sale_price2)}}</option>
                </select>

              </td>
              <td>
                <x-jet-input type="number" min="0" max="{{$product->discount_max}}"
                  wire:model.lazy="discount" />
                  <x-jet-button wire:click="addToCart({{$product->id}},{{$priceColumn}})" class="ml-2">
                    <x-svg.cartPlus class="w-5 h-5" />
                  </x-jet-button>
              </td>
              @endif
            </tr>
          @endforeach
        </tbody>
      </table>

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
      <div class="flex items-center px-3 py-2 text-white bg-gray-600">
        <div>
          <x-svg.fileInvoice class="h-8 w-8" />
        </div>
        <div class="w-full mx-1">
          <label for="CbteTipo" class="block text-sm">
            Tipo de comprobante
          </label>
          <select wire:model="CbteTipo" class="w-full">
            @foreach ($voucher_types as $voucherType)
              <option value="{{ $voucherType->id }}">{{ $voucherType->value }}</option>
            @endforeach
          </select>
        </div>
        <div class="w-full mx-1">
          <label for="invoice_PtoVta" class="block text-sm">
            Punto de Venta
          </label>
          <x-jet-input wire:model="invoice_PtoVta" class="w-full" type="number" min="1" max="9999" />
          <x-jet-input-error for="invoice_PtoVta" class="mt-1" />
        </div>
        <div class="w-full mx-1">
          <label for="invoice_PtoVta" class="block text-sm">
            Número
          </label>
          <x-jet-input readonly wire:model="invoice_number" class="w-full" type="number" min="1"
            max="99999999" />
          <x-jet-input-error for="invoice_number" class="mt-1" />
        </div>
      </div>

      <div class="flex px-4 py-2 overflow-hidden">
        <div class="w-3/4">
          <x-svg.user class="h-8 w-8 inline" /> {{ $customer->id ?? 'N/A' }}: {{ $customer->name ?? 'N/A' }} »
          {{ $customer->business_name ?? 'N/A' }}
        </div>
        <div class="w-1/4">
          <x-svg.warehouse class="h-8 w-8 inline" /> {{ $warehouse->id ?? 'N/A' }}:
          {{ $warehouse->name ?? 'N/A' }}
        </div>
      </div>

      <div class="flex px-4 py-2 items-center bg-gray-300">
        <div class="w-3/4 flex">
          <div>
            <x-svg.barcodeScan class="h-8 w-8 mr-2" />
          </div>
          <div class="mx-1">
            <label for="barcode" class="block text-sm">Cod. Barras</label>
            <x-jet-input wire:model.lazy="search" wire:keydown.enter='inputBarcode()' class="w-max"
              type="text" />
          </div>
          <div class="mx-1">
            <label for="scanqty" class="block text-sm">Cantidad</label>
            <x-jet-input wire:model="quantity" class="w-max" type="number" min="1" max="9999" />
          </div>
          <div class="mx-1 w-28">
            <label for="Col. Precio" class="block text-sm">Col. Precio</label>
            <select wire:model="defaultPriceCol" class="w-full">
              <option value="1">Precio 1</option>
              <option value="2">Precio 2</option>
            </select>
          </div>
        </div>
        <div class="w-1/4 text-lg text-right">
          <small>TOTAL: $</small> <strong>{{ $total_integer }}</strong>,<sup>{{ $total_decimal }}</sup><br />
        </div>
      </div>

      <table class="w-full">
        <thead class="bg-gray-800 text-gray-100">
          <tr>
            <th class="px-4 py-2">Código</th>
            <th class="px-4 py-2">Descripción</th>
            <th class="px-4 py-2">Cantidad</th>
            <th class="px-4 py-2">Precio Unitario</th>
            <th class="px-4 py-2">Desc.%</th>
            <th class="px-4 py-2">Subtotal</th>
            <th class="px-4 py-2">
              <x-jet-secondary-button wire:click="searchProductsModal">
                <x-svg.cartPlus /> Agregar
              </x-jet-secondary-button>
            </th>
          </tr>
        </thead>
        <tbody>
          @foreach ($cart as $key=>$item)
            <tr>
              <td class="px-4 py-2">{{ $item->id }}</td>
              <td class="px-4 py-2">{{ $item->name }}</td>
              <td class="px-4 py-2 text-right">{{ $item->qty }}</td>
              <td class="px-4 py-2 text-right">{{ number_format($item->price, 2, ',', '.') }}</td>
              <td class="px-4 py-2 text-center">{{ $item->discountRate }}</td>
              <td class="px-4 py-2 text-right">{{ number_format($item->qty * $item->price, 2, ',', '.') }}</td>
              <td class="px-4 py-2">
              <x-jet-danger-button wire:click="removeItem('{{ $item->rowId }}')">
                <x-svg.trash />
              </x-jet-danger-button>
              </td>
            </tr>
          @endforeach
        </tbody>
      </table>


    </div>
  </div>

  <x-jet-button color="green" wire:click="debugCart">
    debugCart
  </x-jet-button>
  <a href="{{ route('pdf.invoice') }}" target="_blank" class="text-gray-500">
    <x-jet-button color="red">
      PDF
    </x-jet-button>
  </a>
  @if($total > 0)
  <x-jet-button wire:click="invoiceCreate" class="w-full">
    <x-svg.fileInvoice /> Facturar
  </x-jet-button>
  @endif



</div>
