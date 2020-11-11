<link rel="stylesheet" href="{{ asset('css/vendor.css?v='.$asset_v) }}">

@if( in_array(session()->get('user.language', config('app.locale')), config('constants.langs_rtl')) )
	<link rel="stylesheet" href="{{ asset('css/rtl.css?v='.$asset_v) }}">
@endif

<link href="https://fonts.googleapis.com/css?family=Angkor|Battambang|Bayon|Preahvihear&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Hanuman:wght@400;700&display=swap" rel="stylesheet">
@yield('css')

<!-- app css -->
<link rel="stylesheet" href="{{ asset('css/app.css?v='.$asset_v) }}">

@if(isset($pos_layout) && $pos_layout)
	<style type="text/css">
		.content{
			padding-bottom: 0px !important;
		}
	</style>
@endif

@if(!empty($__system_settings['additional_css']))
    {!! $__system_settings['additional_css'] !!}
@endif