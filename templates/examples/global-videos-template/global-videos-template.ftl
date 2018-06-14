<style>

    .video-list {
        max-height: 404px;
        overflow-y: auto;
    }

    .video-list__item {
        display: block;
        position: relative;
        height: auto;
        margin: 5px 15px;
        padding: 10px 15px;
        border-bottom: solid 1px #CED2D9;
        cursor: pointer;
        font-weight: bold;
        transition: all .2s ease-in;
    }

    .video-list__item:hover {
        opacity: 0.7;
    }

    .content-big-video {
        position:relative;
        width:100%;
        height:auto;
        overflow:hidden;
        margin:0 auto;
        padding:0;
    }

    .video-title {
        color: #696969;
        display: block;
        font-family: 'Trebuchet MS',sans-serif;
        font-size: 32px;
        height: auto;
        line-height: 32px;
        margin: 0;
        overflow: hidden;
        padding: 6px 15px 12px;
        position: relative;
        font-weight: inherit;
        background-color: #fff;
    }

    .content-big-video .content-big-iframe-video {
        display: block;
        position:r elative;
        height: 245px;
        margin: 10px auto;
        padding: 0;
        overflow: hidden;
    }

    @media (min-width: 768px) {
        .content-big-video .content-big-iframe-video {
            height: 400px;
        }
    }

    .video-aspect-ratio {
        height: 245px;
    }

    /* Desktop */
    @media (min-width: 768px) {
        .video-aspect-ratio {
            height: 400px;
        }
    }

    /* Between 980px and 1199px */
    @media (min-width: 980px) and (max-width: 1199px) {
        .content-big-video .content-big-iframe-video {
            height: 299px;
        }
        .video-aspect-ratio {
            height:312px;
        }
    }
</style>

<div class="videos-viewer">
    <div class="row">
        <div class="col-md-8">
            <div class="content-big-video">
                <p class="video-preview-title video-title">
                    ${tituloVideo.getData()}
                </p>

                <#assign videoPath = tituloVideo.enlaceVideo.getData()>

                <div class="content-big-iframe-video">
                    <div class="first-video-url-path hide">
                        ${videoPath}
                    </div>

                    <div id="video-remote">
                        <#--  youtube  -->
                        <iframe class="video-preview-area youtube-video-asset video-aspect-ratio" src="${videoPath}" frameborder="0" width="100%" allowfullscreen></iframe> 
                    </div>
                    <div id="video-local">
                        <#--  documents and media  -->
                        <video class="video-aspect-ratio" id="video-local-instance" width="100%" controls allowfullscreen preload="metadata">
                            <source class="video-preview-area" src="${videoPath}" type="video/mp4">
                        </video>
                    </div>
            
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <p class="video-title">
                Videos
            </p>

            <ul class="video-list">
                <#if tituloVideo.getSiblings()?has_content>
                    <#list tituloVideo.getSiblings() as cur_tituloVideo>
                        <li class="video-list__item">
                            <div class="video-trigger">
                                <span class="video-url-value hide">
                                    ${cur_tituloVideo.enlaceVideo.getData()}
                                </span>
                                <span class="video-given-name">
                                    ${cur_tituloVideo.getData()}
                                </span>
                            </div>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function() {
        var videoTrigger = $('.video-trigger');
        var videoPreviewArea = $('.video-preview-area');
        var videoPreviewTitle = $('.video-preview-title');
        var videoLocal = $('#video-local');
        var videoLocalInstance = $('#video-local-instance');
        var videoRemote = $('#video-remote');
        var firstVideoUrl = $('.first-video-url-path').text().trim();

        validateURL(firstVideoUrl);

        videoTrigger.click(function() {

            var videoUrl = $(this).find('.video-url-value').text().trim();
            var videoTitle = $(this).find('.video-given-name').text().trim();

            videoPreviewArea.attr('src', videoUrl);
            videoPreviewTitle.text(videoTitle);

            validateURL(videoUrl);
        })

        function validateURL(videoURLParameter) {
            var isHttp = videoURLParameter.indexOf('http');
            if (isHttp === 0) {
                videoLocal.hide();
                videoRemote.show();
            } else {
                videoLocal.show();
                videoRemote.hide();

                videoLocalInstance.load();
            }
        }
    });

</script>