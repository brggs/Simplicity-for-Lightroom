<!DOCTYPE html>
<html>
  <head>
    <title>$model.metadata.siteTitle</title>

    <meta name="description" content="$model.metadata.siteDescription">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="styles/bootstrap.min.css" />
    <link rel="stylesheet" href="fancybox/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="styles/socicon.css" />
    <link rel="stylesheet" type="text/css" href="styles/style.css" />
    <link rel="stylesheet" type="text/css" href="styles/custom.css" />
  </head>

  <body class="text-center">

    <div class="row">
      <% if model.appearance.headerPic.display then %>
      <img id="header-pic" class="img-circle" src="img/me.png" alt="$model.metadata.siteTitle" />
      <% end %>
      <h1 id="header-text">$model.metadata.siteTitle</h1>
      <h4 id="header-description">$model.metadata.siteDescription</h4>
    </div>

    <% if model.appearance.socialIcons.display then %>
    <div class="row">
      <a class="social-link" href="https://500px.com/$model.metadata.social.fivehundredpx" title="500px" target="_blank"><span class="socicon">w</span></a>
      <a class="social-link" href="https://www.flickr.com/photos/$model.metadata.social.flickr/" title="Flickr" target="_blank"><span class="socicon">v</span></a>
      <a class="social-link" href="http://<%= model.metadata.social.deviantArt %>.deviantart.com/" title="deviantART" target="_blank"><span class="socicon">J</span></a>
      <a class="social-link" href="http://instagram.com/$model.metadata.social.instagram" title="Instagram" target="_blank"><span class="socicon">x</span></a>
      <a class="social-link" href="https://twitter.com/$model.metadata.social.twitter" title="Twitter" target="_blank"><span class="socicon">a</span></a>
    </div>
    <% end %> 

    <div class="row">
      <a id="email" href="mailto:$model.metadata.email" title="Email" target="_blank"><h5>$model.metadata.email</h5></a>
    </div>

    <noscript>
      <div class="jumbotron">
        <h1>This site requires javascript!</h1>
        <p>To view the gallery, please ensure that javascript is not disabled in your browser settings, or upgrade to a browser which supports javascript such as Google's Chrome.</p>
        <p><a class="btn btn-primary btn-lg" href="https://www.google.com/chrome/browser/desktop/" role="button">Get Chrome</a></p>
      </div>
    </noscript>

    <% if model.appearance.categories.display then %>
    <div class="row" id="cat-menu">
      <ul class="list-inline">
        <li><a href="#" onclick="resetCategory();return false;">All</a></li>
      
        <% for category in string.gmatch(model.appearance.categories.value, '([^,]+)') do %>
          <% local trimmedCat = category:gsub("%s+", "") %>
          <li><a href="#" onclick="setCategory('$trimmedCat');return false;">$trimmedCat</a></li>
        <% end %>
      </ul>      
    </div>
    <% end %> 

    <div class="row">
      <div id="isotope-container">

      <lr:ThumbnailGrid>
        <lr:GridPhotoCell>
          <% local categories = image.metadata.keywords:gsub("[,]", '') %>
          <a class="fancybox $categories" href="bin/images/large/<%= image.exportFilename %>.jpg" title="<%= image.metadata.title %>"> 
            <img class="item lazy" alt="<%= image.metadata.title %>" data-original="bin/images/thumb/<%= image.exportFilename %>.jpg" style="width: <%=image.renditions.thumb.width%>px; height: <%=image.renditions.thumb.height%>px;" alt="Loading..." src="img/NFFFFFF-0.png" />
            <div class="loading"></div>
          </a>
        </lr:GridPhotoCell>
      </lr:ThumbnailGrid>
        
      </div>
    </div>
    <button type="button" class="btn btn-default scroll-to-top">Scroll to top &#x25B2;</button>

    <div class="footer">
      <p>
        Photography &copy; $model.metadata.copyright - Powered by <a href="http://brggs.github.io/Simplicity-for-Lightroom" title="Simplicity for Lightroom" target="_blank">Simplicity for Lightroom</a>
      </p>
    </div>

    <script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
    <script type="text/javascript" src="js/centermasonry.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
  </body>
</html>
