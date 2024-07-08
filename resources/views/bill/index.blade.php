@extends('layouts.master')

@section('titel', 'Customer | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')

    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Quản lý phiếu chi</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Danh sách</li>
                <li class="breadcrumb-item active"><a href="#">phiếu chi</a></li>
            </ul>
        </div>
        <div class="">
            <a class="btn btn-primary" href="{{ route('bill.create') }}"><i class="fa fa-plus"> Thêm mới</i></a>
        </div>

        <div class="row mt-2">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>STT </th>
                                    <th>Loại phiếu chi</th>
                                    <th>Số tiền</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($bills as $key => $bill)
                                    {{-- @dd($bill); --}}
                                    <tr>
                                        <td>{{ $key + 1 }}</td>
                                        <td>{{ $bill->note }}</td>
                                        <td>{{ number_format($bill->price) }} VNĐ</td>
                                        <td>{{ $bill->created_at->format('d-m-Y') }}</td>
                                        <td>
                                            <a class="btn btn-primary" href="{{route('bill.edit', $bill->id)}}"><i
                                                    class="fa fa-edit"></i></a>
                                            <button class="btn btn-danger waves-effect" type="submit"
                                                onclick="deleteTag({{ $bill->id }})">
                                                <i class="fa fa-trash-o"></i>
                                            </button>
                                            <form id="delete-form-{{ $bill->id }}"
                                                action="{{ route('bill.destroy', $bill->id) }}" method="POST"
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
