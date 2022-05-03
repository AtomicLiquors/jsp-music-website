<%@page contentType="text/html; charset=EUC-KR"%>
<%


%>


<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com -->
<!-- Last Published: Sun May 01 2022 13:21:17 GMT+0000 (Coordinated Universal Time) -->

<head>
<style>
/* Generated on: Tue May 03 2022 04:19:28 GMT+0000 (Coordinated Universal Time) */
/* ==========================================================================
   normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css 
   ========================================================================== */
/*! normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css */html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,hgroup,main,menu,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block;vertical-align:baseline}audio:not([controls]){display:none;height:0}[hidden],template{display:none}a{background-color:transparent}a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:bold}dfn{font-style:italic}h1{font-size:2em;margin:.67em 0}mark{background:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sup{top:-0.5em}sub{bottom:-0.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{box-sizing:content-box;height:0}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}button,input,optgroup,select,textarea{color:inherit;font:inherit;margin:0}button{overflow:visible}button,select{text-transform:none}button,html input[type="button"],input[type="reset"]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}input{line-height:normal}input[type='checkbox'],input[type='radio']{box-sizing:border-box;padding:0}input[type='number']::-webkit-inner-spin-button,input[type='number']::-webkit-outer-spin-button{height:auto}input[type='search']{-webkit-appearance:none}input[type='search']::-webkit-search-cancel-button,input[type='search']::-webkit-search-decoration{-webkit-appearance:none}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:.35em .625em .75em}legend{border:0;padding:0}textarea{overflow:auto}optgroup{font-weight:bold}table{border-collapse:collapse;border-spacing:0}td,th{padding:0}

/* ==========================================================================
   Start of base Webflow CSS - If you're looking for some ultra-clean CSS, skip the boilerplate and see the unminified code below.
   ========================================================================== */

/* ==========================================================================
   Start of custom Webflow CSS
   ========================================================================== */
.w-layout-grid {
  display: -ms-grid;
  display: grid;
  grid-auto-columns: 1fr;
  -ms-grid-columns: 1fr 1fr;
  grid-template-columns: 1fr 1fr;
  -ms-grid-rows: auto auto;
  grid-template-rows: auto auto;
  grid-row-gap: 16px;
  grid-column-gap: 16px;
}

.column {
  border: 0px solid #000;
}

.columns {
  min-height: 500px;
  border-style: solid;
  border-width: 1px;
  border-color: #000;
}

.main-content {
  padding-top: 100px;
  padding-bottom: 100px;
}

.column-2 {
  min-height: 720px;
  background-color: #272121;
}

.column-3 {
  min-height: 720px;
}

.header_title {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  min-height: 50px;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
  -ms-flex-pack: justify;
  justify-content: space-between;
  background-color: #111010;
}

.footer {
  padding-top: 60px;
  padding-bottom: 40px;
  -webkit-box-align: start;
  -webkit-align-items: flex-start;
  -ms-flex-align: start;
  align-items: flex-start;
  background-color: #111010;
  text-align: center;
}

.footer-flex-container {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 40px;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
  -ms-flex-pack: justify;
  justify-content: space-between;
  text-align: left;
}

.footer-logo-link {
  max-height: 60px;
  min-width: 60px;
  -webkit-box-flex: 0;
  -webkit-flex: 0 auto;
  -ms-flex: 0 auto;
  flex: 0 auto;
}

.footer-image {
  width: 100%;
  height: 100%;
  -o-object-fit: contain;
  object-fit: contain;
  -o-object-position: 0% 50%;
  object-position: 0% 50%;
}

.footer-heading {
  margin-top: 0px;
  margin-bottom: 20px;
  font-size: 14px;
  line-height: 1.5;
}

.footer-link {
  display: block;
  margin-bottom: 10px;
  color: #444;
  text-decoration: none;
}

.footer-link:hover {
  text-decoration: underline;
}

.column-4 {
  min-height: 500px;
  background-color: #000;
}

.column-5 {
  min-height: 500px;
}

.column-6 {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  min-height: 500px;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  background-color: #291d1d;
}

.headbar {
  background-color: #160b0b;
}

.body {
  min-height: 500px;
}

.container {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-right: auto;
  margin-left: auto;
  background-color: #8d7878;
}

.column-7 {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  min-height: 500px;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
  -ms-flex-direction: row;
  flex-direction: row;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  background-color: #0e0505;
}

.column-8 {
  min-height: 300px;
  background-color: #251414;
}

.column-9 {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  min-height: 400px;
  -webkit-flex-wrap: wrap;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  background-color: #362626;
}

.grid {
  grid-template-areas: ". Area";
  -ms-grid-columns: 0.25fr 1fr;
  grid-template-columns: 0.25fr 1fr;
}

.grid-2 {
  grid-auto-flow: row;
  grid-column-gap: 0px;
  grid-row-gap: 0px;
  -ms-grid-columns: 0.25fr 1fr 0.25fr;
  grid-template-columns: 0.25fr 1fr 0.25fr;
  -ms-grid-rows: auto;
  grid-template-rows: auto;
  background-color: #4e3838;
}

.nav-menu {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
}

.div-block {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  min-height: 500px;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-pack: start;
  -webkit-justify-content: flex-start;
  -ms-flex-pack: start;
  justify-content: flex-start;
  -webkit-box-align: stretch;
  -webkit-align-items: stretch;
  -ms-flex-align: stretch;
  align-items: stretch;
  grid-auto-columns: 1fr;
  grid-column-gap: 0px;
  grid-row-gap: 0px;
  -ms-grid-columns: 1fr 1fr;
  grid-template-columns: 1fr 1fr;
  -ms-grid-rows: auto auto;
  grid-template-rows: auto auto;
}

.column-10 {
  min-height: 200px;
  background-color: #350e0e;
}

.column-11 {
  background-color: #723b3b;
  -o-object-fit: fill;
  object-fit: fill;
}

.column-12 {
  background-color: #472e2e;
}

.container-2 {
  float: left;
  clear: none;
  background-color: #655;
}

.nav-menu-2 {
  min-width: 200px;
}

.navbar {
  overflow: visible;
  float: left;
  clear: none;
  -o-object-fit: fill;
  object-fit: fill;
}

.nav-link {
  outline-color: #222;
  outline-offset: 0px;
  outline-style: none;
  outline-width: 3px;
}

.nav-menu-3 {
  max-width: 100px;
  min-height: 0px;
  min-width: 200px;
  background-color: #964b4b;
  opacity: 1;
  outline-color: #333;
  outline-offset: 0px;
  outline-style: none;
  outline-width: 3px;
}

.column-13 {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  min-height: 800px;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-align-self: stretch;
  -ms-flex-item-align: stretch;
  align-self: stretch;
  background-color: #1a1919;
}

.ateam_contents {
  min-height: 800px;
  -webkit-align-self: stretch;
  -ms-flex-item-align: stretch;
  -ms-grid-row-align: stretch;
  align-self: stretch;
  background-color: #fff;
}

.column-15 {
  min-height: 800px;
  -webkit-align-self: stretch;
  -ms-flex-item-align: stretch;
  -ms-grid-row-align: stretch;
  align-self: stretch;
  background-color: #1a1919;
}

.list {
  min-height: 0px;
  text-align: center;
}

.list-item {
  position: static;
}

.header_navbar {
  min-height: 50px;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  -ms-grid-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
  -ms-grid-rows: auto;
  grid-template-rows: auto;
  background-color: #3b3838;
  font-family: Oswald, sans-serif;
  color: #fff;
  text-align: center;
}

.grid-4 {
  grid-column-gap: 0px;
  grid-row-gap: 0px;
  -ms-grid-columns: 1fr 1fr 1fr;
  grid-template-columns: 1fr 1fr 1fr;
  -ms-grid-rows: auto;
  grid-template-rows: auto;
}

.side_profile_img {
  width: 100%;
  height: auto;
  margin-top: 25px;
  margin-bottom: 10px;
  padding-top: 100%;
  color: #f8f8f8;
  font-size: 20px;
}

.side_profile_saveicon {
  height: 50px;
  color: #fff;
  line-height: 10px;
}

.side_profile_iconbar {
  width: 80%;
  height: auto;
  margin-top: 10px;
  color: #f0f0f0;
  line-height: 10px;
}

.side_profile_likeicon {
  height: 50px;
}

.side_profile_editicon {
  height: 50px;
}

.div-block-3 {
  line-height: 20px;
}

.side_profile_text {
  width: 100%;
  height: 30px;
  margin-top: 10px;
  margin-bottom: 10px;
  line-height: 0px;
}

.ateam_sidebar {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
}

.side_chart {
  width: 100%;
  margin-top: 38px;
  padding-top: 130%;
}

.div-block-4 {
  width: 20%;
  margin-top: 1%;
  margin-bottom: 1%;
  margin-left: 1%;
}

.column-16 {
  margin-top: 1%;
}

.column-17 {
  margin-top: 1%;
}

.columns-4 {
  min-width: auto;
  margin-top: 1%;
  margin-right: 1%;
  margin-bottom: 1%;
}

@media screen and (max-width: 991px) {
  .footer {
    padding-right: 20px;
    padding-left: 20px;
    background-color: #111010;
  }

  .column-6 {
    display: inline-block;
  }

  .column-15 {
    background-color: #1a1919;
  }

  .side_profile_saveicon {
    height: 50px;
  }

  .side_profile_iconbar {
    height: 10px;
  }

  .side_profile_likeicon {
    height: 50px;
  }

  .columns-4 {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
  }
}

@media screen and (max-width: 767px) {
  .main-content {
    padding: 40px 20px;
  }

  .footer {
    padding: 40px 20px;
  }

  .footer-image {
    -o-object-fit: contain;
    object-fit: contain;
  }

  .column-13 {
    display: none;
    overflow: visible;
  }

  .column-15 {
    display: none;
    overflow: visible;
  }

  .header_navbar {
    display: none;
  }
}

@media screen and (max-width: 479px) {
  .footer {
    padding-right: 20px;
    padding-left: 20px;
    text-align: left;
  }

  .footer-flex-container {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
  }

  .footer-logo-link {
    height: 60px;
  }

  .footer-heading {
    margin-top: 20px;
  }

  .column-7 {
    display: none;
  }

  .column-8 {
    display: none;
  }
}

#w-node-_79adedc6-1365-4fdf-6dc1-1cc3bc8b061d-af0b2383 {
  -ms-grid-column: span 1;
  grid-column-start: span 1;
  -ms-grid-column-span: 1;
  grid-column-end: span 1;
  -ms-grid-row: span 1;
  grid-row-start: span 1;
  -ms-grid-row-span: 1;
  grid-row-end: span 1;
}

#w-node-_75e7b4e2-344f-0f2b-0909-84eeebc85c5a-af0b2383 {
  -ms-grid-column: span 1;
  grid-column-start: span 1;
  -ms-grid-column-span: 1;
  grid-column-end: span 1;
  -ms-grid-row: span 1;
  grid-row-start: span 1;
  -ms-grid-row-span: 1;
  grid-row-end: span 1;
}

#w-node-_5a21bf1d-e3ce-1a9f-22bc-48a47062e468-af0b2383 {
  -ms-grid-column: span 1;
  grid-column-start: span 1;
  -ms-grid-column-span: 1;
  grid-column-end: span 1;
  -ms-grid-row: span 1;
  grid-row-start: span 1;
  -ms-grid-row-span: 1;
  grid-row-end: span 1;
}

#w-node-aa6a34b9-b222-abf2-d976-8672a1a95417-af0b2383 {
  -ms-grid-column: span 1;
  grid-column-start: span 1;
  -ms-grid-column-span: 1;
  grid-column-end: span 1;
  -ms-grid-row: span 1;
  grid-row-start: span 1;
  -ms-grid-row-span: 1;
  grid-row-end: span 1;
}

#w-node-a84070ed-3147-cdd5-c7b9-819abbca5433-af0b2383 {
  -ms-grid-column: span 1;
  grid-column-start: span 1;
  -ms-grid-column-span: 1;
  grid-column-end: span 1;
  -ms-grid-row: span 1;
  grid-row-start: span 1;
  -ms-grid-row-span: 1;
  grid-row-end: span 1;
}

#w-node-_3bd06b41-9de8-3e2c-388b-1216cf3bc0f0-af0b2383 {
  -ms-grid-column: span 1;
  grid-column-start: span 1;
  -ms-grid-column-span: 1;
  grid-column-end: span 1;
  -ms-grid-row: span 1;
  grid-row-start: span 1;
  -ms-grid-row-span: 1;
  grid-row-end: span 1;
}

#w-node-c14fe235-a437-f3a3-960b-e4bf121fd496-af0b2383 {
  -ms-grid-column: span 1;
  grid-column-start: span 1;
  -ms-grid-column-span: 1;
  grid-column-end: span 1;
  -ms-grid-row: span 1;
  grid-row-start: span 1;
  -ms-grid-row-span: 1;
  grid-row-end: span 1;
}
</style>

</head>

<body class="body">
<%@ include file="jsplayout/top.jsp" %>
	<div class="ateam_sidebar">
		<%@ include file="jsplayout/left.jsp" %>
		
		<div class="ateam_contents w-col w-col-8">
			<!-- ==============본문 내용 시작============= -->
			
			<%@ include file="myPageIndexRaw.jsp" %>
			
			<!-- ==============본문 내용 끝============== -->
		</div>
		
		<%@ include file="jsplayout/right.jsp" %>
		
	</div>
<%@ include file="jsplayout/bottom.jsp" %>
	
	
</body>
</html>
