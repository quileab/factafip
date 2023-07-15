<div wire:init="loadData">

  <x-jet-dialog-modal wire:model="openModal">
    <x-slot name="title">Producto</x-slot>

    <x-slot name="content">

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="ID" />
          <x-jet-input readonly type="number" wire:model.defer='product_id' class="w-full"
            value="{{ $product_id ?? '' }}" />
          <x-jet-input-error for="product_id" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Categoría" />
          <select wire:model.lazy="product_category_id" name="product_category_id" id="product_category_id"
            class="w-full">
            @foreach ($foreign_categories as $category)
              <option value="{{ $category->id }}">
                {{ $category->id }}· {{ $category->name }}
              </option>
            @endforeach
          </select>
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Marca" />
          <x-jet-input type='text' wire:model.lazy='product_brand' value="{{ $product_brand ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="product_brand" />
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="Nombre/Modelo" />
          <x-jet-input type='text' wire:model.lazy='product_model' value="{{ $product_model ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="product_model" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Descripción" />
          <x-jet-input type='text' wire:model.lazy='product_description' value="{{ $product_description ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="product_description" />
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="Código de Barras" />
          <x-jet-input type='text' wire:model.lazy='product_barcode' value="{{ $product_barcode ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="product_barcode" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Código de Origen" />
          <x-jet-input type='text' wire:model.lazy='product_origin_code' value="{{ $product_origin_code ?? '' }}"
            class="w-full" />
          <x-jet-input-error for="product_origin_code" />
        </div>
      </div>

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="Precio" />
          <x-jet-input type='number' min='0' step='0.01' wire:model.lazy='product_price'
            value="{{ $product_price ?? '' }}" class="w-full" />
          <x-jet-input-error for="product_price" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Cantidad Mínima" />
          <x-jet-input type='number' min='0' step='1' wire:model.lazy='product_quantity_min'
            value="{{ $product_quantity_min ?? '' }}" class="w-full" />
          <x-jet-input-error for="product_quantity_min" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Unidad" />
          <select wire:model.lazy="product_unit_type_id" name="product_unit_type_id" id="product_unit_type_id"
            class="w-full">
            @foreach ($foreign_units as $unit)
              <option value="{{ $unit->id }}">
                {{ $unit->id }}· {{ $unit->value }}
              </option>
            @endforeach
          </select>
        </div>
      </div>

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="Alícuota" />
          <select wire:model.lazy="product_tax_condition_type_id" name="product_tax_condition_type_id"
            id="product_tax_condition_type_id" class="w-full">
            @foreach ($foreign_taxes as $tax)
              <option value="{{ $tax->id }}">
                {{ $tax->id }}· {{ $tax->description }}
              </option>
            @endforeach
          </select>
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="% Descuento Permitido" />
          <x-jet-input type='number' min='0' step='0.01' wire:model.lazy='product_discount_max'
            value="{{ $product_discount_max ?? '' }}" class="w-full" />
          <x-jet-input-error for="product_discount_max" />
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="% Ganancia 1" />
          <div class="flex w-full">
            <x-jet-input type='number' min="0" step="0.01" wire:model.lazy='product_profit_percentage1'
              value="{{ $product_profit_percentage1 ?? '' }}" class="w-full" />
            <x-jet-input-error for="product_profit_percentage1" />
            <x-jet-button wire:click="calcSalePrice(1)">
              <x-svg.calculator />
            </x-jet-button>
          </div>
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="% Ganancia 2" />
          <div class="flex w-full">
            <x-jet-input type='number' min="0" step="0.01" wire:model.lazy='product_profit_percentage2'
              value="{{ $product_profit_percentage2 ?? '' }}" class="w-full" />
            <x-jet-input-error for="product_profit_percentage2" />
            <x-jet-button wire:click="calcSalePrice(2)">
              <x-svg.calculator />
            </x-jet-button>
          </div>
        </div>
      </div>

      <div class="flex w-full">
        <div class="w-full ml-3">
          <x-jet-label value="Precio Vta. 1" />
          <x-jet-input type='number' min="0" step="0.01" wire:model.lazy='product_sale_price1'
            value="{{ $product_sale_price1 ?? '' }}" class="w-full" />
          <x-jet-input-error for="product_sale_price1" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Precio Vta. 2" />
          <x-jet-input type='number' min="0" step="0.01" wire:model.lazy='product_sale_price2'
            value="{{ $product_sale_price2 ?? '' }}" class="w-full" />
          <x-jet-input-error for="product_sale_price2" />
        </div>
      </div>

    </x-slot>

    <x-slot name="footer">
      <div class="flex justify-between">
        <x-jet-secondary-button wire:click="$toggle('openModal')" wire:loading.attr="disabled">
          Salir
        </x-jet-secondary-button>

        @if ($updating == true)
          <x-jet-button wire:click="update" class="px-3 py-1 text-xs font-bold text-white rounded">
            Modificar
          </x-jet-button>
        @else
          <x-jet-button class="ml-2" wire:click="create" wire:loading.attr="disabled">
            Guardar
          </x-jet-button>
        @endif

      </div>
    </x-slot>
  </x-jet-dialog-modal>

  <x-jet-dialog-modal wire:model="inventoryModal">
    <x-slot name="title">Inventario</x-slot>
    <x-slot name="content">
      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="Producto" />
          <x-jet-input type='text' readonly aria-readonly="true" class="w-full"
          value="{{ $product_id ?? '' }} {{ $product_model ?? '' }}" />
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Depósito" />
          <x-jet-input type='text' readonly aria-readonly="true" class="w-full"
          value="{{ $warehouse_name ?? '' }}" />
        </div>
      </div>

      <div class="flex">
        <div class="w-full ml-3">
          <x-jet-label value="Agregar al Stock (Cantidad)" />
          <div class="flex">
          <x-jet-input type='number' wire:model.defer='add_qty' class="w-full" id="add_qty"
            value="{{ $add_qty ?? '0' }}"
          />
          <x-jet-input-error for="add_qty" />
          <x-jet-button wire:click="calcNewQuantity">
            <x-svg.leftArrow />
          </x-jet-button>
          </div>
        </div>
        <div class="w-full ml-3">
          <x-jet-label value="Stock (Cantidad)" />
          <x-jet-input type='number' readonly aria-readonly="true" wire:model.lazy='inventory_qty' value="{{ $inventory_qty ?? '0' }}"
            class="w-full" />
        </div>
      </div>

    </x-slot>

    <x-slot name="footer">
      <div class="flex justify-between">
        <x-jet-secondary-button wire:click="$toggle('inventoryModal')" wire:loading.attr="disabled">
          Salir
        </x-jet-secondary-button>

        <x-jet-button wire:click="saveInventoryQty" class="px-3 py-1 text-xs font-bold text-white rounded">
          Guardar
        </x-jet-button>

      </div>
    </x-slot>
  </x-jet-dialog-modal>

  <div class="mx-auto">
    <div class="overflow-hidden bg-gray-200 rounded-md shadow-xl">
      <div class="flex justify-between px-3 py-2 text-white d2c">
        <div class="flex mt-2">
          <x-svg.cube class="w-8 h-8" />
          <div class="ml-4 text-lg">Productos</div>
        </div>
        <x-jet-input wire:model.lazy="search" type="search" class="w-full mx-3" placeholder="Buscar..." />

        <x-jet-button wire:click="newProduct">Nuevo</x-jet-button>
      </div>
      <div class="pb-4">
        {{-- show list of products in table --}}
        <table class="table-auto w-full">
          <thead>
            <tr class="bg-gray-800 text-white">
              <th class="px-2 py-2 text-sm">ID/Cat.</th>
              <th class="px-2 py-2 text-sm">Marca · Producto/Modelo</th>
              <th class="px-2 py-2">Descripción</th>
              <th class="px-2 py-2 text-sm">Acciones</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($products as $product)
              <tr>
                <td class="px-2 py-1 text-sm">{{ $product->id }}<br />{{ $product->category->name }}</td>
                <td class="px-2 py-1 text-sm">{{ $product->brand }}<br />{{ $product->model }}</td>
                <td class="px-2 py-0.5">
                  <b>{{ $product->description }}</b>
                  <div class="w-full flex justify-evenly">
                  <span>🏷️${{ $product->sale_price1 }}</span>
                  <span>🏷️${{ $product->sale_price2 }}</span>
                  </div>
                </td>
                <td class="px-1 py-1 text-right inline-flex">
                  <x-jet-button wire:click="edit({{ $product->id }})" class="mr-1">
                    <x-svg.edit />
                  </x-jet-button>
                  <x-jet-secondary-button title="VER STOCK" wire:click="openInventory({{ $product->id }})" class="mr-1">
                    <x-svg.cube />
                  </x-jet-secondary-button>
                  <x-jet-danger-button wire:click="delete({{ $product->id }})" class="mr-1">
                    <x-svg.trash />
                  </x-jet-danger-button>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>


      </div>
    </div>
  </div>
</div>
