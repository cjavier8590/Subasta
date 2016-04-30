<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'materialize.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
                <g:javascript src='jquery.js'/>
                <g:javascript src='materialize.min.js'/>
                <g:javascript src='jqueryui.js'/>
                
		<g:layoutHead/>
		<r:layoutResources />
                
                <style>

        .ui-helper-hidden-accessible{
           display: none
        }
        .ui-corner-all
        {
            -moz-border-radius: 4px 4px 4px 4px;
        }
        .ui-widget-content
        {
            border: 2px solid #a4c6fd;
            color: #222222;
            /*background-color: Red;*/
        }
        .ui-widget
        {
            font-family: Verdana,Arial,sans-serif;
            font-size: 15px;
        }
        .ui-menu
        {
            display: block;
            float: left;
            list-style: none outside none;
            margin: 0;
            padding: 2px;
        }
        .ui-autocomplete
        {
            cursor: default;
            position: absolute;
        }
        .ui-menu .ui-menu-item
        {
            clear: left;
            float: left;
            margin: 0;
            padding: 0;
            width: 100%;
        }
        .ui-menu .ui-menu-item a
        {
            display: block;
            padding: 3px 3px 3px 3px;
            text-decoration: none;
            cursor: pointer;
            background-color: #ffffff;
        }
        .ui-menu .ui-menu-item a:hover,
        .ui-menu .ui-menu-item a:active
        {
            display: block;
            padding: 3px 3px 3px 3px;
            text-decoration: none;
            color: White;
            cursor: pointer;
            background-color: #26a69a;
        }
        .ui-widget-content a
        {
            color: #222222;
        }

        .navbar-form navbar-right{
          
        }

    </style>
	</head>
        <script>    
          $(document).ready(function(){
            $('.parallax').parallax();
            
            
          })
          {}
        </script>
	<body>
                
                <div class="parallax-container">
                    <div class="parallax"><img src="images/banner_transubasta.jpg"></div>
                </div>
                
		<g:layoutBody/>
		
                
                <footer class="page-footer teal">
                  <div class="container">
                    <div class="row">
                      <div class="col l6 s12">
                        <h5 class="white-text">Transubastas</h5>
                        <p class="grey-text text-lighten-4">Su envío en un clic</p>
                      </div>
                      <div class="col l4 offset-l2 s12">
                        <h5 class="white-text">Contáctanos</h5>
                        <ul>
                          <li><a class="grey-text text-lighten-3" href="https://www.facebook.com/Transubasta-253068591709847">Facebook</a></li>
                          <li><a class="grey-text text-lighten-3" href="https://twitter.com/Transubasta">Twitter</a></li>
                          <li><a class="grey-text text-lighten-3" href="https://plus.google.com/u/0/116025724480960148443/posts">Google+</a></li>
                          
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="footer-copyright">
                    <div class="container">
                    © 2016 TransSubastas
                    
                    </div>
                  </div>
                </footer>
                
                
                
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
