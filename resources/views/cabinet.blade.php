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
{{--                                <th>Send SMS</th>--}}
                                <th>Notification</th>
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
{{--                                    <td>--}}
{{--                                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal"--}}
{{--                                                data-target="#myModal" data-id="{{$order->user_id}}"  onclick="f(this)">--}}
{{--                                            Send SMS--}}
{{--                                        </button>--}}
{{--                                    </td>--}}
                                    <td>
                                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                                data-target="#myModal" data-id="{{$order->user_id}}" onclick="f(this)">
                                            Send Message
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <form method="POST" action="{{ route('send') }}">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Send Notification</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    @csrf
                    <div class="form-group col-xs-12">
                        <label for="notify_type"
                               class="control-label">{{ __('Choose Notification Type') }}</label>
                            <select  id="notify_type" type="notify_type" class="form-control @error('notify_type') is-invalid @enderror"
                                     name="notify_type" value="{{ old('notify_type') }}" required autocomplete="notify_type" autofocus>
                                <option value="email">Email</option>
                                <option value="phone">Phone</option>
                            </select>
                            @error('notify_type')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                    </div>
                    <div class="form-group col-xs-12">
                        <label for="message"
                               class="control-label">{{ __('Message') }}</label>
                        <textarea  id="message" class="form-control @error('message') is-invalid @enderror"
                                 name="message" value="{{ old('message') }}" required autocomplete="message">Thank you for your purchase!!!</textarea>
                        @error('notify_type')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group col-xs-12">
                        <input type="hidden" name="uid" id="uid">
                    </div>
                    <div class="row" id="logs">

                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">
                        {{ __('Send') }}
                    </button>
                </div>

            </div>
        </form>
    </div>
</div>
<script>
    function f(el) {
        var id = $(el).data('id');
        $('#uid').val(id);
        $.ajax({
            url: '/getlogs/'+id,
            type: 'GET',
            data: {uid: id},
            dataType: 'JSON',
            success: function (data) {
                var template = '';
                var i=0;
                $.each(data.logs, function(key, value) {
                    i+=1;
                    if(value.status==1){
                        template = template + '<div class="col-md-12 text-success">'+i+' ('+value.notify_type+') '+value.status_description+' '+value.created_at+'</div>';
                    }else{
                        template = template + '<div class="col-md-12 text-danger ">'+i+' ('+value.notify_type+') '+value.status_description+' '+value.created_at+'</div>';
                    }
                });
                $('#logs').html(template);
            }
        });
    }
</script>
