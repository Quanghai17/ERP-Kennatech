@extends('layouts.master')

@section('title', 'Tax | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-edit"></i>Nạp / Rút tiền</h1>
                <p>Mẫu thêm</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Mẫu</li>
                <li class="breadcrumb-item"><a href="#">Nạp - Rút tiền</a></li>
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
            <a class="btn btn-primary" href="{{ route('transaction.index') }}"><i class="fa fa-edit"> Lịch sử giao dịch</i></a>
        </div>
        <div class="row mt-2">

            <div class="clearix"></div>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Giao dịch</h3>
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
                        <form method="POST" action="{{ route('transaction.store') }}" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="totalamoutId" value="{{$total->id}}">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Số tiền: </label>
                                    <input name="price" class="form-control @error('price') is-invalid @enderror"
                                        type="number" placeholder="VD: 100.000" required>
                                    @error('price')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Hình thức: </label>
                                    <select name="type" class="form-control" required>
                                        <option value="in">Nạp tiền</option>
                                        <option value="out">Rút tiền</option>
                                    </select>
                                    @error('type')
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
                                            class="fa fa-fw fa-lg fa-check-circle"></i>Giao dịch</button>
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
