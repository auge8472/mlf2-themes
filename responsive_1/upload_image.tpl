{config_load file=$language_file section="general"}{config_load file=$language_file section="upload_image"}<!DOCTYPE html>
<html lang="{#language#}" dir="{#dir#}">
<head>
<meta charset="{#charset#}" />
<title>{$settings.forum_name}{if $page_title} - {$page_title}{elseif $subnav_location} - {$subnav_location}{/if}</title>
<style type="text/css">
{literal}
html {
	margin: 0;
	color: #000;
	background: #fff;
	font-family: verdana, arial, sans-serif;
	text-align: start;
	font-size: 1em;
	font-size: 1rem;
}
body,
header,
main,
#image-table {
	margin: 0;
}
body {
	padding: 0;
}
header {
	padding: 0 0.5em;
	background: hsl(210, 100%, 90%);
	border-bottom: 1px solid #bacbdf;
	display: flex;
	justify-content: space-between;
}
h1 {
	font-size: 1em;
	font-weight: bold;
}
.nav, h1 {
	margin: 0.25em 0;
	padding: 0.25em;
}
.nav a,
h1 { padding: 0.25em;
}
main {
	padding: 0.5em;
}
img {
	border: none;
}
#image-table {
	padding: 0;
	list-style: none;
	display: flex;
	flex-wrap: wrap;
	gap: 0.5em;
}
#image-table li {
	text-align: center;
	padding: 0;
	background: #e4eff8;
}
#image-table button {
	padding: 0;
	margin-bottom: 0.25em;
	font-size: 1em;
	font-weight: bold;
	border: none;
	border-bottom: 1px dotted #aaa;
	background: transparent;
	cursor: pointer;
}
#image-table img {
	height: 9em;
}
#image-table p {
	margin: 0.25em 0;
}
#image-table .deletelink a {
	margin: 0.2em 0 0 0;
	display: inline-block;
}

.caution,
.ok,
.deletelink a {
	padding: 0 0 0 1.2em;
	font-weight: bold;
	background-repeat: no-repeat;
	background-position: left center;
	background-size: 1em 1em;
}
.caution {
	color: red;
	background-image: url({/literal}{$THEMES_DIR}/{$settings.theme}{literal}/images/warning.svg);
}
.ok {
	color: red;
	background-image: url({/literal}{$THEMES_DIR}/{$settings.theme}{literal}/images/check-mark.svg);
}
.deletelink a {
	background-image: url({/literal}{$THEMES_DIR}/{$settings.theme}{literal}/images/marker-cross.svg);
}

img.delete { max-width: 300px; max-height: 150px; }
img.uploaded { max-width: 300px; max-height: 110px; }
.small { font-size: 0.82em; }
code { font-family: "courier new", courier, monospace; color:#008; }
a:link { color: #00c; text-decoration: none; }
a:visited { color: #00c; text-decoration: none; }
a:focus,
a:hover { color: #35f; text-decoration: underline; }
a:active { color: #f00; text-decoration: none; }
{/literal}
</style>
<script type="text/javascript">{literal}/* <![CDATA[ */
function insertCode(image_url) {
	if (opener && opener.mlfBBCodeButton) {
		var bbcodeButton = opener.mlfBBCodeButton;
		if (!bbcodeButton.canInsert()) 
			return;
		var buttonGroup = bbcodeButton.getButtonGroup();
		var txtarea = buttonGroup.getTextArea();
		txtarea.insertTextRange( txtarea.getSelection() + "[img]" + image_url + "[/img]" );
	}
	//self.close();
}
/* ]]> */{/literal}
{if $browse_images}
{literal}/* <![CDATA[ */
function getMaxWidth() {
	if (document.getElementById('imgtab')) {
		var maxWidth = document.getElementById('imgtab').offsetWidth-20;
		var obj=getElementsByClassName('browse');
		for (i=0; i<obj.length; i++) {
			obj[i].style.maxWidth=maxWidth+'px';
		}
	}
}
window.onload = getMaxWidth;
window.onresize = getMaxWidth;
/* ]]> */{/literal}
{/if}
</script>
</head>
 <body>
{if $form}
  <header>
   <h1>{#upload_image_hl#}</h1>
  </header>
  <main role="main">
{if $errors}
   <p class="caution">{#error_headline#}</p>
   <ul>
{section name=mysec loop=$errors}
    <li>{assign var="error" value=$errors[mysec]}{$smarty.config.$error|replace:"[width]":$width|replace:"[height]":$height|replace:"[filesize]":$filesize|replace:"[max_width]":$max_width|replace:"[max_height]":$max_height|replace:"[max_filesize]":$max_filesize|replace:"[server_max_filesize]":$server_max_filesize}</li>
{/section}
   </ul>
{/if}
   <form id="uploadform" action="index.php" method="post" enctype="multipart/form-data" accept-charset="{#charset#}">
    <input type="hidden" name="mode" value="upload_image" />
    <div>
     <p><input type="file" name="probe" size="17" /></p>
     <p><input type="submit" name="" value="{#upload_image_button#}" onclick="document.getElementById('throbber-submit').style.visibility='visible'" /> <img id="throbber-submit" style="visibility:hidden;" src="{$THEMES_DIR}/{$theme}/images/throbber.svg" alt="" width="16" height="16" /></p>
    </div>
   </form>
   <p class="small"><a href="index.php?mode=upload_image&amp;browse_images=1">{#browse_uploaded_images#}</a></p>
  </main>
{elseif $uploaded_file}
  <header>
   <h1>{#upload_image_hl#}</h1>
  </header>
  <main role="main">
   <p class="ok">{#upload_successful#}</p>
{*<script type="text/javascript">/* <![CDATA[ */document.write('<p>{#insert_image_exp#|escape:quotes}<\/p>'); /* ]]> */</script>*}
   <noscript><p>{#insert_image_exp_no_js#}</p>
   <p><code>[img]images/uploaded/{$uploaded_file}[/img]</code></p></noscript>
   <button type="button" class="image-inserter">
    <img class="uploaded" src="images/uploaded/{$uploaded_file}" alt="[img]images/uploaded/{$uploaded_file}[/img]" />
    <p>{#insert_image#}</p>
   </button>
   {if $image_downsized}<p class="small">{$smarty.config.image_downsized|replace:"[width]":$new_width|replace:"[height]":$new_height|replace:"[filesize]":$new_filesize}</p>{/if}
   <p class="small"><a href="index.php?mode=upload_image&amp;browse_images=1">{#browse_uploaded_images#}</a></p>
  </main>
{elseif $browse_images}
  <header>
   <p class="nav"><a href="index.php?mode=upload_image"><span>{#back#}</span></a></p>
   <p class="nav">{if $previous}<a href="index.php?mode=upload_image&amp;browse_images={$previous}">&laquo; <span>{#previous_page_link_title#}</span></a>{/if}{if $previous && next} {/if}{if $next}<a href="index.php?mode=upload_image&amp;browse_images={$next}"><span>{#next_page_link_title#}</span> &raquo;</a>{/if}</p>
  </header>
{if $images}
  <main role="main">
   <ul id="image-table">
{section name=nr loop=$images start=$start max=$images_per_page}
    <li>
     <button type="button" class="image-inserter">
      <img class="browse" src="images/uploaded/{$images[nr]}" alt="[img]images/uploaded/{$images[nr]}[/img]" />
      <p>{#insert_image#}</p>
     </button>
     {if $admin || $mod}<p class="deletelink"><a href="index.php?mode=upload_image&amp;delete={$images[nr]}&amp;current={$current}">{#delete#}</a></p>{/if}
    </li>
{/section}
   </ul>
  </main>
{else}
  <main role="main" id="wrapper">
   <p>{#no_images#}</p>
  </main>
{/if}
{elseif $delete_confirm}
  <header>
   <p class="nav"><a href="index.php?mode=upload_image&amp;browse_images={$current|default:'1'}"><span>{#back#}</span></a></p>
  </header>
  <main role="main">
   <p class="caution">{#delete_image_confirm#}</p>
   <p><img class="delete" src="images/uploaded/{$delete}" alt="{$delete}" /></p>
   <form id="uploadform" action="index.php" method="post" accept-charset="{#charset#}">
    <input type="hidden" name="mode" value="upload_image" />
    <input type="hidden" name="delete" value="{$delete}" />
    {if $current}<input type="hidden" name="current" value="{$current}" />{/if}
    <div>
     <input type="submit" name="delete_confirm" value="{#delete_image_button#}" />
    </div>
   </form>
  </main>
{else}
  <header>
   <h1>{#upload_image_hl#}</h1>
  </header>
  <main role="main">
   <p class="caution">{#image_upload_not_enabled#}</p>
  </main>
{/if}
 </body>
</html>
