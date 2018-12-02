{config_load file=$language_file section="general"}{config_load file=$language_file section="upload_image"}<!DOCTYPE html>
<html lang="{#language#}" dir="{#dir#}">
<head>
<meta charset="{#charset#}" />
<title>{$settings.forum_name}{if $page_title} - {$page_title}{elseif $subnav_location} - {$subnav_location}{/if}</title>
<style type="text/css">
{literal}
<!--
img.delete    { max-width:300px; max-height:150px; }
img.uploaded  { max-width:300px; max-height:110px; /*cursor:pointer;*/ }
img.browse    { max-width:320px; cursor:pointer; }
.small        { font-size:11px; line-height:16px; }
code          { font-family:"courier new", courier; color:#000080; }
a:link        { color:#0000cc; text-decoration: none; }
a:visited     { color:#0000cc; text-decoration: none; }
a:hover       { color:#0000ff; text-decoration: underline; }
a:active      { color:#ff0000; text-decoration: none; }
-->
body, header, #wrapper { margin: 0; }
#nav-1, #nav-2, h1 { margin: 0.25em 0; }
body, #nav-1, #nav-2 { padding: 0; }
body { color: #000; background: #fff; font-family: verdana, arial, sans-serif; font-size: 1em; font-size: 1rem; }
header { padding: 0 0.5em; background: hsl(210, 100%, 90%); border-bottom: 1px solid #bacbdf; display: flex; justify-content: space-between; }
#nav-1 a, #nav-2 a { border: 1px solid; }
#nav-1 a, #nav-2 a, h1 { padding: 0.25em; }
h1 { font-size: 1em; font-weight: bold; text-align: center; }
img { border: none; }
#wrapper { padding: 0.5em; }
.caution, .ok, .deletelink { padding: 0 0 0 1.2em; font-weight: bold; background-repeat: no-repeat; background-position: left center; background-size: 1em 1em; }
.caution { color: red; background-image: url({/literal}{$THEMES_DIR}/{$settings.theme}{literal}/images/warning.svg); }
.ok { color: red; background-image: url({/literal}{$THEMES_DIR}/{$settings.theme}{literal}/images/check-mark.svg); }
.deletelink { background-image: url({/literal}{$THEMES_DIR}/{$settings.theme}{literal}/images/marker-cross.svg); }
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
<div id="wrapper">
{if $errors}
<p class="caution">{#error_headline#}</p>
<ul>
{section name=mysec loop=$errors}
 <li>{assign var="error" value=$errors[mysec]}{$smarty.config.$error|replace:"[width]":$width|replace:"[height]":$height|replace:"[filesize]":$filesize|replace:"[max_width]":$max_width|replace:"[max_height]":$max_height|replace:"[max_filesize]":$max_filesize|replace:"[server_max_filesize]":$server_max_filesize}</li>
{/section}
</ul>
{/if}
<form id="uploadform" action="index.php" method="post" enctype="multipart/form-data" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="upload_image" />
<p><input type="file" name="probe" size="17" /></p>
<p><input type="submit" name="" value="{#upload_image_button#}" onclick="document.getElementById('throbber-submit').style.visibility='visible'" /> <img id="throbber-submit" style="visibility:hidden;" src="{$THEMES_DIR}/{$theme}/images/throbber_submit.gif" alt="" width="16" height="16" /></p>
</div>
</form>
<p class="small"><a href="index.php?mode=upload_image&amp;browse_images=1">{#browse_uploaded_images#}</a></p>
</div>
{elseif $uploaded_file}
 <header>
  <h1>{#upload_image_hl#}</h1>
 </header>
<div id="wrapper">
<p class="ok">{#upload_successful#}</p>
{*<script type="text/javascript">/* <![CDATA[ */document.write('<p>{#insert_image_exp#|escape:quotes}<\/p>'); /* ]]> */</script>*}
<noscript><p>{#insert_image_exp_no_js#}</p>
<p><code>[img]images/uploaded/{$uploaded_file}[/img]</code></p></noscript>
<img class="uploaded" src="images/uploaded/{$uploaded_file}" title="{#insert_image#}" {*onclick="insertCode('images/uploaded/{$uploaded_file}'); return false;" *}alt="{#insert_image#}" />
{if $image_downsized}<p class="small">{$smarty.config.image_downsized|replace:"[width]":$new_width|replace:"[height]":$new_height|replace:"[filesize]":$new_filesize}</p>{/if}
<p class="small"><a href="index.php?mode=upload_image&amp;browse_images=1">{#browse_uploaded_images#}</a></p>
</div>
<script type="text/javascript">/* <![CDATA[ */ insertCode('images/uploaded/{$uploaded_file}'); /* ]]> */</script>
{elseif $browse_images}
 <header>
  <p id="nav-1"><a href="index.php?mode=upload_image">{#back#}</a></p>
  <p id="nav-2">{if $previous}<a href="index.php?mode=upload_image&amp;browse_images={$previous}" title="{#previous_page_link_title#}">&laquo;</a>{/if}{if $previous && next} {/if}{if $next}<a href="index.php?mode=upload_image&amp;browse_images={$next}" title="{#next_page_link_title#}">&raquo;</a>{/if}</p>
 </header>
{if $images}
<ul id="imgtab">
{section name=nr loop=$images start=$start max=$images_per_page}
<li><button type="button" onclick="insertCode('images/uploaded/{$images[nr]}');"><img class="browse" src="images/uploaded/{$images[nr]}" alt="{#insert_image#}" /><br />{#insert_image#}</button>{if $admin || $mod}<br /><a class="deletelink" href="index.php?mode=upload_image&amp;delete={$images[nr]}&amp;current={$current}">{#delete#}</a>{/if}</li>
{/section}
</ul>
{else}
<div id="wrapper">
<p>{#no_images#}</p>
</div>
{/if}
{elseif $delete_confirm}
 <header>
  <p id="nav-1"><a href="index.php?mode=upload_image&amp;browse_images={$current|default:'1'}">{#back#}</a></p>
 </header>
<div id="wrapper">
<p class="caution">{#delete_image_confirm#}</p>
<p><img class="delete" src="images/uploaded/{$delete}" alt="{$delete}" /></p>
<form id="uploadform" action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="upload_image" />
<input type="hidden" name="delete" value="{$delete}" />
{if $current}<input type="hidden" name="current" value="{$current}" />{/if}
<input type="submit" name="delete_confirm" value="{#delete_image_button#}" />
</div>
</form>
</div>
{else}
 <header>
  <h1>{#upload_image_hl#}</h1>
 </header>
<div id="wrapper">
<p class="caution">{#image_upload_not_enabled#}</p>
</div>
{/if}
</body>
</html>
