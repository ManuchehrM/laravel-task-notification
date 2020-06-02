@extends('layouts.app')

@section('content')
    <div class="container">
        @if(Auth::user())
        <div class="row">
            <div class="col-md-12">
                <h2>Welcome - {{Auth::user()->role.' '.Auth::user()->email}}</h2>
            </div>
        </div>
        @else
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Home Page</div>
                    <div class="card-body text-center">
                        <h2>Welcome!</h2>
                    </div>
                </div>
            </div>
        </div>
        @endif
    </div>
@endsection
