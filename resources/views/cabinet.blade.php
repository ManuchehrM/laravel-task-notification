@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Welcome - {{Auth::user()->role.' | '.Auth::user()->email}}</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">Cabinet</div>
                    <div class="card-body text-center">
                        <table class="table table-hover table-bordered table-striped">
                            <tr>
                                <th>№</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Products</th>
                                <th>Total Price</th>
                                <th>Send SMS</th>
                                <th>Send Email</th>
                            </tr>
                            @php $i=0 @endphp
                            @foreach($orders as $order)
                            @php $i++ @endphp
                            <tr>
                                <td>{{$i}}</td>
                                <td>{{$order->email}}</td>
                                <td>{{$order->phone}}</td>
                                <td>{{$order->products}}</td>
                                <td>{{$order->price}}</td>
                                <td><a href="/send-sms" class="btn btn-success btn-sm">Send SMS</a></td>
                                <td><a href="/send-email" class="btn btn-primary btn-sm">Send Email</a></td>
                            </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
