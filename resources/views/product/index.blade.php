

@extends('layouts.master')

@section('titel', 'Customer | ')
@section('content')
    @include('partials.header')
    @include('partials.sidebar')

    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Quản lý sản phẩm</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Danh sách</li>
                <li class="breadcrumb-item active"><a href="#">Sản phẩm</a></li>
            </ul>
        </div>
        <div class="">
            <a class="btn btn-primary" href="{{route('product.create')}}"><i class="fa fa-plus"> Thêm mới sản phẩm</i></a>
        </div>

        <div class="row mt-2">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                            <tr>
                                <th>STT </th>
                                <th>Tên sản phẩm</th>
                                <th>Hình ảnh</th>
                                <th>Giá nhập (VNĐ)</th>
                                <th>Giá bán (VNĐ)</th>
                                <th>Tồn kho</th>
                                <th>Số lượng nhập vào</th>
                                <th>Số lượng bán ra</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                             <tbody>

                             @foreach($products as $key => $product)
                             {{-- @dd($product); --}}
                                 <tr>
                                    <td>{{$key+1}}</td>
                                     <td>{{$product->name}}</td>
                                     {{-- <td><img style="width: 50px" src="{{ Voyager::image($product->image) }}" alt="{{$product->name}}"></td> --}}
                                     <td><img style="width: 50px" src="{{ asset($product->image) }}" alt=""></td>
                                     <td>{{ number_format($product->cost) }}</td>
                                     <td>{{ number_format($product->price) }}</td>
                                     <td>{{ number_format($product->stock) }}</td>
                                     <td>{{ number_format($product->qty_import) }}</td>
                                     <td>{{ number_format($product->qty_export) }}</td>
                                     <td>
                                         <a class="btn btn-primary" href="{{route('product.edit', $product->id)}}"><i class="fa fa-edit" ></i></a>
                                         <button class="btn btn-danger waves-effect" type="submit" onclick="deleteTag({{ $product->id }})">
                                             <i class="fa fa-trash-o"></i>
                                         </button>
                                         <form id="delete-form-{{ $product->id }}" action="{{ route('product.destroy',$product->id) }}" method="POST" style="display: none;">
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
                title: 'Xóa sản phẩm?',
                text: "Bạn có muốn xóa sản phẩm?",
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
