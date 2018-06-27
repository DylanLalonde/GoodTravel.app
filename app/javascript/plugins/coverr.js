//jQuery is required to run this code
// $( document ).ready(function() {

//     scaleVideoContainer();

//     initBannerVideoSize('.video-container .poster img');
//     initBannerVideoSize('.video-container .filter');
//     initBannerVideoSize('.video-container video');

//     $(window).on('resize', function() {
//         scaleVideoContainer();
//         scaleBannerVideoSize('.video-container .poster img');
//         scaleBannerVideoSize('.video-container .filter');
//         scaleBannerVideoSize('.video-container video');
//     });

// });

function scaleVideoContainer() {

    var height = $(window).height() + 5;
    var unitHeight = parseInt(height) + 'px';
    console.log("unitHeight", unitHeight);
    $('.homepage-hero-module').css('height',unitHeight);

}

function initBannerVideoSize(element){

    $(element).each(function(){
        $(this).data('height', $(this).height());
        $(this).data('width', $(this).width());
    });

    scaleBannerVideoSize(element);

}

function scaleBannerVideoSize(element){

    var windowWidth = $(window).width(),
      windowHeight = $(window).height() + 5,
      videoWidth,
      videoHeight;

    $(element).each(function(){
        // var videoAspectRatio = $(this).data('height')/$(this).data('width');

        console.log("e", this);

        var elemHeight = this.offsetHeight;
        var elemWidth = this.offsetWidth;
        var videoAspectRatio = elemHeight / elemWidth;

        console.log("values", elemHeight, elemWidth, videoAspectRatio);

        $(this).width(windowWidth);

        if(windowWidth < 1000){
            videoHeight = windowHeight;
            videoWidth = videoHeight / videoAspectRatio;

            // console.log("videoHeight", videoHeight);
            // console.log("videoAspectRatio", videoAspectRatio);
            // console.log(windowWidth);
            // console.log("videoWidth", videoWidth);
            // console.log("div", videoHeight / videoAspectRatio);

            console.log("margin", -(videoWidth - windowWidth) / 2)
            $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});
            $(this).width(videoWidth).height(videoHeight);
        }

        else {
            $(this).removeAttr("style");
        }

        $('.homepage-hero-module .video-container video').addClass('fadeIn animated');

    });
}
