@extends('layouts.master')

@section('titel', 'Customer | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')

    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Quản lý kho hàng</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Danh sách</li>
                <li class="breadcrumb-item active"><a href="#">Nhập kho</a></li>
            </ul>
        </div>
        <div class="">
            <a class="btn btn-primary" href="{{ route('purchase.create') }}"><i class="fa fa-plus"> Thêm mới</i></a>
        </div>

        <div class="row mt-2">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>STT </th>
                                    <th>Tổng đơn hàng</th>
                                    <th>Nhà cung cấp</th>
                                    <th>Ghi chú</th>
                                    <th>Danh sách sản phẩm nhập</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($purchases as $key => $purchase)
                                    {{-- @dd($purchase); --}}
                                    <tr>
                                        <td>{{ $key + 1 }}</td>
                                        <td>{{ number_format($purchase->total_amount) }} VNĐ</td>
                                        <td>{{ $purchase->supplier->name }}</td>
                                        <td>{{ $purchase->note }}</td>
                                        <td>
                                            <ul>
                                                @foreach ($purchase->products as $item)
                                                {{-- @dd($item) --}}
                                                    <li>{{ $item->name }} (Số lượng nhâp: {{ $item->pivot->qty_import }})</li>
                                                @endforeach
                                            </ul>
                                        </td>
                                        <td>{{ $purchase->created_at->format('d-m-Y') }}</td>
                                        <td>
                                            <a class="btn btn-primary" href="#"><i
                                                    class="fa fa-edit"></i></a>
                                            <button class="btn btn-danger waves-effect" type="submit"
                                                onclick="deleteTag({{ $purchase->id }})">
                                                <i class="fa fa-trash-o"></i>
                                            </button>
                                            <form id="delete-form-{{ $purchase->id }}"
                                                action="{{ route('purchase.destroy', $purchase->id) }}" method="POST"
                                                style="display: none;">
                                                @csrf
                                                @method('DELETE')
                                            </form>
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
    <script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
    <script type="text/javascript">
        function deleteTag(id) {
            swal({
                title: 'Xóa?',
                text: "Bạn có muốn xóa?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Có!',
                cancelButtonText: 'Không!',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    event.preventDefault();
                    document.getElementById('delete-form-' + id).submit();
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    swal(
                        'Cancelled',
                        'Your data is safe :)',
                        'error'
                    )
                }
            })
        }
    </script>
@endpush

@push('css')
    <style>
        .btn .btn-success {
            margin-left: 10px !important
        }
    </style>
@endpush
