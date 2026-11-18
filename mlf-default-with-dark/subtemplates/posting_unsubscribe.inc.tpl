{config_load file=$language_file section="unsubscribe_posting"}
{if $unsubscribe_status === true}
<h2>{#unsubscribed_hl#}</h2>
<p>{#unsubscribed_message#}</p>
{else}
<h2>{#unsubscribe_error_hl#}</h2>
<p class="notice caution"><img src="{$FORUM_ADDRESS}/{$THEMES_DIR}/{$theme}/images/general-caution.svg" class="icon" alt="" height="20" width="20">{#unsubscribe_error_message#}</p>
{/if}
