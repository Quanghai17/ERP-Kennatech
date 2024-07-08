@extends('layouts.master')

@section('titel', 'Customer | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')

    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Danh sách khách hàng</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Danh sách</li>
                <li class="breadcrumb-item active"><a href="#">Danh sách khách hàng</a></li>
            </ul>
        </div>
        <div class="">
            <a class="btn btn-primary" href="{{ route('customer.create') }}"><i class="fa fa-plus"> Thêm mới khách hàng</i></a>
        </div>

        <div class="row mt-2">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>STT </th>
                                    <th>Tên khách hàng</th>
                                    <th>Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Địa chỉ</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($customers as $key => $customer)
                                    <tr>
                                        <td>{{ $key + 1 }}</td>
                                        <td>{{ $customer->name}}</td>
                                        <td>{{ $customer->phone}}</td>
                                        <td>{{ $customer->email}}</td>
                                        <td>{{ $customer->address}}</td>
                                        <td>
                                            <a class="btn btn-primary" href="{{route('customer.edit', $customer->id)}}"><i class="fa fa-edit" ></i></a>
                                            <button class="btn btn-danger waves-effect" type="submit" onclick="deleteTag({{ $customer->id }})">
                                                <i class="fa fa-trash-o"></i>
                                            </button>
                                            <form id="delete-form-{{ $customer->id }}" action="{{ route('customer.destroy',$customer->id) }}" method="POST" style="display: none;">
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
<script type="text/javascript" src="{{asset('assets/js/plugins/jquery.dataTables.min.js')}}"></script>
<script type="text/javascript" src="{{asset('assets/js/plugins/dataTables.bootstrap.min.js')}}"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
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
                    document.getElementById('delete-form-'+id).submit();
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

