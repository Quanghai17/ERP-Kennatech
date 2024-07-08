@extends('layouts.master')

@section('title', 'Tax | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Sửa sản phẩm</h1>
                <p>Mẫu sửa</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Mẫu</li>
                <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
            </ul>
        </div>

        @if (session()->has('message'))
            <div class="alert alert-success">
                {{ session()->get('message') }}
            </div>
        @endif

        <div class="">
            <a class="btn btn-primary" href="{{ route('product.index') }}"><i class="fa fa-edit"> Danh sách sản phẩm</i></a>
        </div>
        <div class="row mt-2">

            <div class="clearix"></div>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Sản phẩm</h3>
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
                        <form method="POST" action="{{route('product.update', $product->id)}}" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên sản phẩm: </label>
                                    <input value="{{$product->name}}" name="name" class="form-control @error('name') is-invalid @enderror"
                                        type="text" placeholder="VD: Rong biển nấu canh">
                                    @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Hình ảnh:</label>
                                    <input value="{{$product->image}}" name="image" class="form-control @error('image') is-invalid @enderror"
                                        type="file">
                                        <img style="width: 50px" src="{{ asset($product->image) }}" alt="">
                                    @error('image')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Giá nhập: </label>
                                    <input name="cost" value="{{$product->cost}}"
                                        class="form-control @error('cost') is-invalid @enderror" type="number"
                                        placeholder="100.000">
                                    @error('cost')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Giá bán: </label>
                                    <input name="price" value="{{$product->price}}"
                                        class="form-control @error('price') is-invalid @enderror" type="number"
                                        placeholder="150.000">
                                    @error('price')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Số lượng nhập: </label>
                                    <input name="qty_import" value="{{$product->qty_import}}"
                                        class="form-control @error('qty_import') is-invalid @enderror" type="number"
                                        placeholder="100">
                                    @error('qty_import')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Số lượng bán:</label>
                                    <input name="qty_export" value="{{$product->qty_export}}"
                                        class="form-control @error('qty_export') is-invalid @enderror" type="number"
                                        placeholder="80">
                                    @error('qty_export')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Tồn kho: </label>
                                    <input name="stock" value="{{$product->stock}}"
                                        class="form-control @error('stock') is-invalid @enderror" type="number"
                                        placeholder="2000">
                                    @error('stock')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Ghi chú: </label>
                                    <textarea name="note" class="form-control" type="text" placeholder="Ghi chú">
                                        {{$product->note}}
                                    </textarea>
                                </div>
                                <div class="form-group col-md-4 align-self-end">
                                    <button class="btn btn-primary" type="submit"><i
                                            class="fa fa-fw fa-lg fa-check-circle"></i>Cập nhật</button>
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
        <script src="{{ asset('/') }}js/multifield/jquery.multifield.min.js"></script>
@endpush
