{if $no_authorisation}
<p class="notice caution"><img src="{$FORUM_ADDRESS}/{$THEMES_DIR}/{$theme}/images/general-caution.svg" class="icon" alt="" height="20" width="20">{#no_authorisation#}</p>
{elseif $page}
{$page.content}
{else}
<p class="notice caution"><img src="{$FORUM_ADDRESS}/{$THEMES_DIR}/{$theme}/images/general-caution.svg" class="icon" alt="" height="20" width="20">{#page_doesnt_exist#}</p>
{/if}
