@extends('layouts.master')

@section('title', 'Tax | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Thêm sản nhập nho</h1>
                <p>Mẫu thêm</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Mẫu</li>
                <li class="breadcrumb-item"><a href="#">Sản phẩm nhập nho</a></li>
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
            <a class="btn btn-primary" href="{{ route('purchase.index') }}">
                <i class="fa fa-edit">
                    Danh sách sản phẩm nhập kho
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
                        <form method="POST" action="{{ route('purchase.store') }}" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="totalamoutId" value="{{$total->id}}">
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label class="control-label">Nhà cung cấp: </label>
                                    <select name="supplier_id" class="form-control" required>
                                        @foreach($suppliers as $supplier)
                                            <option value="{{$supplier->id}}">{{$supplier->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Tổng tiền nhập: </label>
                                    <input name="total_amount" class="form-control @error('total_amount') is-invalid @enderror"
                                        type="number" placeholder="" required>
                                    @error('total_amount')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Ghi chú: </label>
                                    <input name="note" class="form-control" type="text" placeholder="Ghi chú">
                                </div>
                            </div>

                            <div class="tile">
                                <div id="example-2" class="content">
                                    <div class="group row">
                                        <div class="form-group col-md-6">
                                            <select class="form-control" name="productId[]">
                                                <option>Sản phẩm nhập</option>
                                                @foreach ($products as $product)
                                                    <option value="{{ $product->id }}">{{ $product->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-md-5">
                                            <input name="qty[]"
                                                class="form-control @error('qty') is-invalid @enderror" type="number"
                                                placeholder="Số lượng nhập" required>
                                            <span
                                                class="text-danger">{{ $errors->has('additional_body') ? $errors->first('body') : '' }}</span>
                                        </div>
                                        <div class="form-group col-md-1">
                                            <button type="button" id="btnAdd-2" class="btn btn-primary float-right"><i
                                                    class="fa fa-plus"></i></button>
                                            <button type="button" style="margin-right: 10px"
                                                class="btn btn-danger btnRemove float-right"><i
                                                    class="fa fa-trash"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-4 align-self-end">
                                <button class="btn btn-primary" type="submit"><i
                                        class="fa fa-fw fa-lg fa-check-circle"></i>Thêm mới</button>
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

@push('css')
    <style>
        .toggle-switch {
            margin: 0 auto;
            /* width: 141px; */
            position: relative;
        }

        .toggle-switch label {
            padding: 0;
        }

        input#cb-switch {
            display: none;
        }

        .toggle-switch label input+span {
            position: relative;
            display: inline-block;
            margin-right: 10px;
            width: 4.5rem;
            height: 2rem;
            background: #bdc1c8;
            border: 1px solid #eee;
            border-radius: 50px;
            transition: all 0.3s ease-in-out;
        }

        .toggle-switch label input+span small {
            position: absolute;
            display: block;
            width: 1.5rem;
            height: 1.5rem;
            border-radius: 1.875rem;
            background: #fff;
            transition: all 0.3s ease-in-out;
            top: 0.2rem;
            left: 0.2rem;
        }

        .toggle-switch label input:checked+span {
            background-color: #0bb12f;
        }

        .toggle-switch label input:checked+span small {
            left: 2.7rem;
            transition: left .25s;
        }

        .toggle-switch span:after {
            line-height: 2.5rem;
            width: 4.5rem;
            text-align: center;
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 2px;
            position: absolute;
            bottom: 0;
            transition: opacity .25s;
            left: 6rem;
            opacity: 0.5;
            color: #6b7381;
        }

        .toggle-switch label input:checked+span:after {
            opacity: 1;
        }
    </style>
@endpush
