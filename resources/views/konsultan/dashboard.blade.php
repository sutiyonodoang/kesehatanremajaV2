@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Konsultan Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in as a Konsultan!') }}

                    <h3 class="mt-4">Recent Consultations</h3>
                    @if($recent_consultations->isEmpty())
                        <p>No recent consultations.</p>
                    @else
                        <ul class="list-group">
                            @foreach($recent_consultations as $consultation)
                                <li class="list-group-item">
                                    <strong>{{ $consultation->user->name }}</strong> - {{ $consultation->category->name }}
                                    <p>{{ Str::limit($consultation->description, 100) }}</p>
                                    <a href="{{ route('konsultan.consultations.show', $consultation->id) }}" class="btn btn-sm btn-primary">View Details</a>
                                </li>
                            @endforeach
                        </ul>
                    @endif

                    <h3 class="mt-4">My Recent Responses</h3>
                    @if($my_recent_responses->isEmpty())
                        <p>No recent responses from you.</p>
                    @else
                        <ul class="list-group">
                            @foreach($my_recent_responses as $response)
                                <li class="list-group-item">
                                    <strong>{{ $response->consultation->user->name }}</strong> - {{ Str::limit($response->response_text, 100) }}
                                    <p><small>Consultation: {{ Str::limit($response->consultation->description, 50) }}</small></p>
                                    <a href="{{ route('konsultan.consultations.show', $response->consultation->id) }}" class="btn btn-sm btn-info">View Consultation</a>
                                </li>
                            @endforeach
                        </ul>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
