<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title">{!! $follow_up->heading !!}</h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12">
                    {!! $follow_up->description !!}
                </div>
            </div>
            @if(($follow_up->media)->count() > 0)
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <h4>@lang('lang_v1.documents')</h4>
                        @foreach($follow_up->media as $media)
                            <a href="{{$media->display_url}}" download="{{$media->display_name}}">
                                <i class="fa fa-download"></i>
                                {{$media->display_name}}
                            </a><br>
                        @endforeach
                    </div>
                </div>
            @endif
        </div>
        <div class="modal-footer">
            <span class="pull-left">
                <i class="fas fa-pencil-alt"></i>
                {{$follow_up->createdBy->user_full_name}}
                &nbsp;
                <i class="fa fa-calendar-check-o"></i>
                {{@format_date($follow_up->created_at)}}
            </span>
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">
                @lang('messages.close')
            </button>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->