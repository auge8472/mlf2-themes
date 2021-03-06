{config_load file=$language_file section="delete_posting"}
{if $no_authorisation}
<p class="caution">{#no_authorisation#}</p>
{else}
<h1>{#report_spam_hl#}</h1>
{if !$id}
{#postings_doesnt_exist#}
{elseif $spam==1}
{#posting_already_spam#}
{else}
<p class="caution">{#caution#}</p>
<p>{if $spam_check_status==0}
{#spamcheck_posting_not_checked#}
{elseif $spam_check_status==1}
{#spamcheck_posting_passed#}
{elseif $spam_check_status==2}
{#spamcheck_akismet_timeout_error#}
{elseif $spam_check_status==3}
{#spamcheck_akismet_api_error#}
{/if}</p>
<p><strong>{$subject}</strong> - <strong>{$name}</strong>, {$disp_time|date_format:#time_format#}</p>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="posting" />
<input type="hidden" name="id" value="{$id}" />
{if $back}<input type="hidden" name="back" value="{$back}" />{/if}
{if $page}<input type="hidden" name="page" value="{$page}" />{/if}
{if $order}<input type="hidden" name="order" value="{$order}" />{/if}
{if $descasc}<input type="hidden" name="descasc" value="{$descasc}" />{/if}
{if $category}<input type="hidden" name="category" value="{$category}" />{/if}
<p>
 <button name="report_spam_delete_submit" value="{#report_spam_delete_submit#}">{#report_spam_delete_submit#}</button>
 <button name="report_spam_submit" value="{#report_spam_submit#}">{#report_spam_submit#}</button>
 <button name="delete_submit" value="{#delete_only_submit#}">{#delete_only_submit#}</button>
</p>
</div>
</form>
{/if}
{/if}
