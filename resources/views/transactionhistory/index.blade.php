@extends('layouts.master')

@section('titel', 'Customer | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')

    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Lịch sử giao dịch</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Danh sách</li>
                <li class="breadcrumb-item active"><a href="#">Lịch sử giao dịch</a></li>
            </ul>
        </div>
        <div class="">
            <a class="btn btn-primary" href="{{ route('transaction.create') }}"><i class="fa fa-plus"> Thêm mới lịch sử giao
                    dịch</i></a>
        </div>

        <div class="row mt-2">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>STT </th>
                                    <th>Số tiền</th>
                                    <th>Hình thức</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($transactions as $key => $transaction)
                                    <tr>
                                        <td>{{ $key + 1 }}</td>
                                        <td>{{ number_format($transaction->price) }}</td>
                                        <td>
                                            @if ($transaction->type == 'in')
                                                <span class="bg-success text-white p-2 rounded">Nạp tiền</span>
                                            @else
                                                <span class="bg-warning text-white p-2 rounded">Rút tiền</span>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection

@push('js')
    <script type="text/javascript" src="{{ asset('assets/js/plugins/jquery.dataTables.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/plugins/dataTables.bootstrap.min.js') }}"></script>
    <script type="text/javascript">
        $('#sampleTable').DataTable();
    </script>
@endpush

@push('css')
    <style>
        .btn .btn-success {
            margin-left: 10px !important
        }
    </style>
@endpush
