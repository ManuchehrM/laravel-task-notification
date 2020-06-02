@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Home Page</div>
                    <div class="card-body text-center">
                        <h2>Welcome!</h2><br>
                        <a href="/cabinet" class="btn btn-success"><i class="fa fa-user"></i> Go To {{Auth::user()->role}} Dashboard</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
