@extends('layouts.master')

@section('title', 'Tax | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Sửa Đơn hàng</h1>
                <p>Mẫu sửa</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Mẫu</li>
                <li class="breadcrumb-item"><a href="#">Đơn hàng</a></li>
            </ul>
        </div>

        @if (session()->has('message'))
            <div class="alert alert-success">
                {{ session()->get('message') }}
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        <div class="">
            <a class="btn btn-primary" href="{{ route('order.index') }}">
                <i class="fa fa-edit">
                    Danh sách Đơn hàng
                </i>
            </a>
        </div>
        <div class="row mt-2">
            <div class="clearix"></div>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Thông tin</h3>
                    <div class="tile-body">
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <form method="POST" action="{{ route('order.update', $order->id) }}" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="totalamoutId" value="{{ $total->id }}">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Khách hàng:</label>
                                    <div class="d-flex align-items-center">
                                        <select class="form-control select2 me-2" name="customer_id">
                                            <option value="{{ $order->customer->id }}">{{ $order->customer->name }}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Số điện thoại:</label>
                                    <input value="{{ $order->phone }}" name="phone"
                                        class="form-control @error('phone') is-invalid @enderror" type="text"
                                        placeholder="0987654321" required>
                                    @error('phone')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Địa chỉ:</label>
                                    <input value="{{ $order->address }}" name="address"
                                        class="form-control @error('address') is-invalid @enderror" type="text" required>
                                    @error('address')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Ghi chú:</label>
                                    <input value="{{ $order->note }}" name="note"
                                        class="form-control @error('note') is-invalid @enderror" type="text" required>
                                    @error('note')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tổng tiền đơn hàng:</label>
                                    <input value="{{ $order->total_price }}" name="total_price"
                                        class="form-control @error('total_price') is-invalid @enderror" type="number"
                                        required>
                                    @error('total_price')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Giảm giá(nếu có):</label>
                                    <input value="{{ $order->discount }}" name="discount"
                                        class="form-control @error('discount') is-invalid @enderror" type="number">
                                    @error('discount')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Hình thức vận chuyển:</label>
                                    <div class="d-flex align-items-center">
                                        <select class="form-control me-2" name="shipping_id">
                                            @foreach ($shipping as $item)
                                                <option value="{{ $item->id }}" {{ $item->id == $order->shipping->id ? 'selected' : '' }}>{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Hình thức thanh toán:</label>
                                    <div class="d-flex align-items-center">
                                        <select class="form-control me-2" name="payment_id">
                                            @foreach ($payments as $payment)
                                                <option value="{{ $payment->id }}" {{ $payment->id == $order->payment->id ? 'selected' : '' }}>{{ $payment->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Trạng thái đơn hàng:</label>
                                    <div class="d-flex align-items-center">
                                        <select class="form-control me-2" name="status_id" value="{{ $order->status->id }}">
                                            @foreach ($status as $item)
                                                <option value="{{ $item->id }}" {{ $item->id == $order->status->id ? 'selected' : '' }}>{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>

                            @php
                                $items = $order->products;
                                // dd($items);
                            @endphp
                            <div class="tile">
                                <h4>Danh sách sản phẩm</h4>
                                @foreach ($items as $item)
                                    <input type="hidden" name="productdetailId[]" value="{{ $item->pivot->id }}">
                                    <div id="example-2" class="content">
                                        <div class="group row">
                                            <div class="form-group col-md-3">
                                                <select class="form-control" name="productId[]">
                                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <input name="qty[]" value="{{ $item->pivot->qty }}"
                                                    class="form-control @error('qty') is-invalid @enderror"
                                                    type="number" placeholder="Số lượng cho mượn" required>
                                                <span
                                                    class="text-danger">{{ $errors->has('additional_body') ? $errors->first('body') : '' }}</span>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>

                            <div class="form-group col-md-4 align-self-end">
                                <button class="btn btn-primary" type="submit"><i
                                        class="fa fa-fw fa-lg fa-check-circle"></i>Sửa đơn hàng</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
@push('js')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="{{ asset('assets/js/multifield/jquery.multifield.min.js') }}"></script>

    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

    <script type="text/javascript">
        $(document).ready(function() {
            var maxField = 10;
            var addButton = $('.add_button');
            var wrapper = $('.field_wrapper');
            var fieldHTML =
                '<div><select name="supplier_id[]" class="form-control"><option class="form-control">Select Supplier</option>@foreach ($products as $product)<option value="{{ $product->id }}">{{ $product->name }}</option>@endforeach</select><input name="supplier_price[]" class="form-control" type="text" placeholder="Enter Sales Price"><a href="javascript:void(0);" class="remove_button btn btn-danger" title="Delete field"><i class="fa fa-minus"></i></a></div>'
            var x = 1;

            $(addButton).click(function() {
                if (x < maxField) {
                    x++;
                    $(wrapper).append(fieldHTML);
                }
            });

            $(wrapper).on('click', '.remove_button', function(e) {
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            });

            $('#example-2').multifield({
                section: '.group',
                btnAdd: '#btnAdd-2',
                btnRemove: '.btnRemove'
            });
        });
    </script>
@endpush
