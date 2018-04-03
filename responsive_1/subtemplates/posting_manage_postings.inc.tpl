{config_load file=$language_file section="manage_postings"}
{if $no_authorisation}
<p class="caution">{$smarty.config.$no_authorisation}</p>
{else}
{assign var='input_days' value='</label><input type="text" name="days" value="" size="5" />'}
<h1>{#manage_postings_hl#}</h1>
<form action="index.php" method="post" accept-charset="{#charset#}">
<fieldset class="manage-postings">
<legend><img src="{$THEMES_DIR}/{$theme}/images/marker-cross.svg" width="15" height="15" alt="" /> {#mark_postings#}</legend>
<input type="hidden" name="mode" value="posting" />
<p><input id="mark_mode_1" type="radio" name="mark_mode" value="1" class="small-input" /><label for="mark_mode_1">{$smarty.config.mark_old_threads|replace:"[days]":$input_days}<br />
<input id="mark_mode_2" type="radio" name="mark_mode" value="2" class="small-input" /><label for="mark_mode_2">{#mark_all_postings#}</label><br />
<input id="mark_mode_3" type="radio" name="mark_mode" value="3" class="small-input" /><label for="mark_mode_3">{#unmark_all_postings#}</label></p>
<p><button name="mark_submit" value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</fieldset>
</form>

<form action="index.php" method="post" accept-charset="{#charset#}">
<fieldset class="manage-postings">
<legend><img src="{$THEMES_DIR}/{$theme}/images/lock-closed.svg" width="15" height="15" alt="" /> {#lock_postings#}</legend>
<input type="hidden" name="mode" value="posting" />
<p><input id="lock_mode_1" type="radio" name="lock_mode" value="1" class="small-input" /><label for="lock_mode_1">{$smarty.config.lock_old_threads|replace:"[days]":$input_days}<br />
<input id="lock_mode_2" type="radio" name="lock_mode" value="2" class="small-input" /><label for="lock_mode_2">{#lock_all_postings#}</label><br />
<input id="lock_mode_3" type="radio" name="lock_mode" value="3" class="small-input" /><label for="lock_mode_3">{#unlock_all_postings#}</label></p>
<p><button name="lock_submit" value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</fieldset>
</form>
{/if}
