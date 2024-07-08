@extends('layouts.master')

@section('content')
    <section class="material-half-bg">
        <div class="cover"></div>
    </section>
    <section class="login-content">
        <div class="logo">
            <h1 class="login-head">Kennatech</h1>
        </div>
        <div class="login-box">
            <form class="login-form" method="POST" action="{{ route('postlogin') }}">
                @csrf
                <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>Đăng nhập</h3>
                <div class="form-group">
                    <label class="control-label">Email</label>
                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror"
                        name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                    @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="control-label">Mật khẩu</label>
                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror"
                        name="password" required autocomplete="current-password">
                    @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group">
                    <div class="utility">
                        <div class="animated-checkbox">
                            <label>
                                <input type="checkbox"><span class="label-text">Lưu đăng nhập</span>
                            </label>
                        </div>
                        <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Quên mật khẩu ?</a></p>
                    </div>
                </div>
                <div class="form-group btn-container">
                    <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-sign-in fa-lg fa-fw"></i>Đăng nhập</button>
                </div>
            </form>
        </div>
    </section>
@endsection
