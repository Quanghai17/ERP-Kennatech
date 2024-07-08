@extends('layouts.master')

@section('title', 'Tax | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Sửa sản phẩm cho mượn</h1>
                <p>Mẫu sửa</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Mẫu</li>
                <li class="breadcrumb-item"><a href="#">Sản phẩm cho mượn</a></li>
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
            <a class="btn btn-primary" href="{{ route('loanproduct.index') }}">
                <i class="fa fa-edit">
                    Danh sách sản phẩm cho mượn
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
                        <form method="POST" action="{{route('loanproduct.update', $loanproduct->id)}}" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên người mượn: </label>
                                    <input value="{{$loanproduct->borrower}}" name="borrower" class="form-control @error('borrower') is-invalid @enderror"
                                        type="text" placeholder="VD: Nguyễn Văn A" required>
                                    @error('borrower')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Số điện thoại:</label>
                                    <input value="{{$loanproduct->phone}}" name="phone" class="form-control @error('phone') is-invalid @enderror"
                                        type="text" placeholder="0987654321" required>
                                    @error('phone')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Ngày mượn: </label>
                                    <input name="borrowed_day" value="{{$loanproduct->borrowed_day}}"
                                        class="form-control @error('borrowed_day') is-invalid @enderror" type="date"
                                        required>
                                    @error('borrowed_day')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Ngày trả: </label>
                                    <input name="pay_day"  value="{{$loanproduct->pay_day}}" class="form-control @error('pay_day') is-invalid @enderror"
                                        type="date" required>
                                    @error('pay_day')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Trạng thái: </label>
                                    <select name="status" class="form-control">
                                        <option value="0" {{ $loanproduct->status == 0 ? 'selected' : '' }}>Đang mượn</option>
                                        <option value="1" {{ $loanproduct->status == 1 ? 'selected' : '' }}>Đã trả</option>
                                    </select>
                                    @error('status')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Ghi chú: </label>
                                    <input name="note"  value="{{$loanproduct->note}}" class="form-control" type="text" placeholder="Ghi chú">
                                </div>
                            </div>
                            @php
                                $items = $loanproduct->products;
                                // dd($items);
                            @endphp
                            <div class="tile" >
                                @foreach($items as $item)
                                <input type="hidden" name="loanproductdetailId[]" value="{{$item->pivot->id}}">
                                    <div id="example-2" class="content">
                                        <div class="group row">
                                            <div class="form-group col-md-3">
                                                <select class="form-control" name="productId[]">
                                                    <option value="{{$item->id}}">{{$item->name}}</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <input name="qty_loan[]" value="{{$item->pivot->qty_loan}}"
                                                    class="form-control @error('qty_loan') is-invalid @enderror"
                                                    type="number" placeholder="Số lượng cho mượn" required>
                                                <span
                                                    class="text-danger">{{ $errors->has('additional_body') ? $errors->first('body') : '' }}</span>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <input name="qty_returned[]" value="{{$item->pivot->qty_returned}}"
                                                    class="form-control @error('qty_returned') is-invalid @enderror"
                                                    type="number" placeholder="Số lượng trả" required>
                                                <span
                                                    class="text-danger">{{ $errors->has('additional_body') ? $errors->first('body') : '' }}</span>
                                            </div>
                                            {{-- <div class="form-group col-md-1">
                                                <button type="button" id="btnAdd-2" class="btn btn-primary float-right"><i
                                                        class="fa fa-plus"></i></button>
                                                <button type="button" style="margin-right: 10px"
                                                    class="btn btn-danger btnRemove float-right"><i
                                                        class="fa fa-trash"></i></button>
                                            </div> --}}
                                        </div>
                                    </div>
                                @endforeach
                            </div>

                            <div class="form-group col-md-4 align-self-end">
                                <button class="btn btn-primary" type="submit"><i
                                        class="fa fa-fw fa-lg fa-check-circle"></i>Sửa thông tin</button>
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

