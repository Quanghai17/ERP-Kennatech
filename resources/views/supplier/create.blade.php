@extends('layouts.master')

@section('title', 'Tax | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Thêm mới nhà cung cấp</h1>
                <p>Mẫu thêm</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Mẫu</li>
                <li class="breadcrumb-item"><a href="#">Nhà cung cấp</a></li>
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
            <a class="btn btn-primary" href="{{ route('supplier.index') }}"><i class="fa fa-edit"> Danh sách nhà cung cấp</i></a>
        </div>
        <div class="row mt-2">

            <div class="clearix"></div>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Nhà cung cấp</h3>
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
                        <form method="POST" action="{{ route('supplier.store') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên nhà cung cấp: </label>
                                    <input name="name" class="form-control @error('name') is-invalid @enderror"
                                        type="text" placeholder="Rong biển Hàn Quốc" required>
                                    @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Số điện thoại: </label>
                                    <input name="phone" class="form-control @error('phone') is-invalid @enderror"
                                        type="number" placeholder="0987654321" required>
                                    @error('phone')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Email: </label>
                                    <input name="email" class="form-control @error('email') is-invalid @enderror"
                                        type="email" placeholder="admin@example.com" required>
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Địa chỉ: </label>
                                    <input name="address" class="form-control @error('address') is-invalid @enderror"
                                        type="text" placeholder="Tân Thịnh - TP Thái Nguyên - Thái Nguyên" required>
                                    @error('address')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Ghi chú: </label>
                                    <textarea name="note" class="form-control" type="text" placeholder="Ghi chú">
                                    </textarea>
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
        <script src="{{ asset('/') }}js/multifield/jquery.multifield.min.js"></script>
@endpush
