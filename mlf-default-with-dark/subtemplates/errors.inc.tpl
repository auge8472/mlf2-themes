 <p class="notice caution"><img src="{$FORUM_ADDRESS}/{$THEMES_DIR}/{$theme}/images/general-caution.svg" class="icon" alt="" height="20" width="20">{#error_headline#}</p>
 <ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
  <li>{$smarty.config.$error}</li>
{/section}
 </ul>
