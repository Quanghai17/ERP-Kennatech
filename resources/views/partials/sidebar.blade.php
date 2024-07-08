@php
    $menu = menu('home_menu', '_json');
    //  dd($menu);
@endphp

<div class="app-sidebar__overlay" data-toggle="sidebar"></div>

<aside class="app-sidebar">
    <div class="app-sidebar__user"><img width="40 px" class="app-sidebar__user-avatar"
            src="{{ Voyager::image(Auth::user()->avatar) }}" alt="User Image">
        <div>
            <p class="app-sidebar__user-name">{{ Auth::user()->name }}</p>
        </div>
    </div>
    <ul class="app-menu">

        @foreach ($menu as $item)
        {{-- @dd($item->url) --}}
            @if (count($item->children) > 0)
                <li class="treeview">
                    <a href="{{ asset($item->url) }}" class="app-menu__item  @if (request()->is(trim($item->url, '/'))) active @endif"
                        href="#" data-toggle="treeview">
                        <i class="{{$item->icon_class}}"></i>
                        <span class="app-menu__label">
                        {{ $item->title }}</span>
                        <i class="treeview-indicator fa fa-angle-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        @foreach ($item->children as $child)
                            <li ><a href="{{ asset($child->url) }}"
                                    class="treeview-item"> <i class="{{$child->icon_class}}"></i> {{ $child->title }}</a>
                            </li>
                        @endforeach
                    </ul>
                </li>
            @else
                <li>
                    <a class="app-menu__item  @if (request()->is(trim($item->url, '/'))) active @endif" href="{{ asset($item->url) }}">
                        <i class="{{$item->icon_class}}"></i>
                        <span class="app-menu__label"> {{ $item->title }}</span> </a>
                </li>
            @endif
        @endforeach
    </ul>
</aside>
