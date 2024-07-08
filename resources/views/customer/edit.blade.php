@extends('layouts.master')

@section('title', 'Tax | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Sửa khách hàng</h1>
                <p>Mẫu sửa</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Mẫu</li>
                <li class="breadcrumb-item"><a href="#">khách hàng</a></li>
            </ul>
        </div>

        @if (session()->has('message'))
            <div class="alert alert-success">
                {{ session()->get('message') }}
            </div>
        @endif

        <div class="">
            <a class="btn btn-primary" href="{{ route('customer.index') }}"><i class="fa fa-edit"> Danh sách khách hàng</i></a>
        </div>
        <div class="row mt-2">

            <div class="clearix"></div>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">khách hàng</h3>
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
                        <form method="POST" action="{{route('customer.update', $customer->id)}}" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên khách hàng: </label>
                                    <input value="{{$customer->name}}" name="name" class="form-control @error('name') is-invalid @enderror"
                                        type="text" placeholder="VD: Rong biển nấu canh">
                                    @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Số điện thoại: </label>
                                    <input name="phone" value="{{$customer->phone}}"
                                        class="form-control @error('phone') is-invalid @enderror" type="number"
                                        >
                                    @error('phone')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Email: </label>
                                    <input name="email" value="{{$customer->email}}"
                                        class="form-control @error('email') is-invalid @enderror" type="email"
                                        >
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Địa chỉ: </label>
                                    <input name="address" value="{{$customer->address}}"
                                        class="form-control @error('address') is-invalid @enderror" type="text"
                                        placeholder="100">
                                    @error('address')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Ghi chú: </label>
                                    <textarea name="note" class="form-control" type="text" placeholder="Ghi chú">
                                        {{$customer->note}}
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
