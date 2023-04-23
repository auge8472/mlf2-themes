{config_load file=$language_file section="remove_user_account"}
<h2 class="caution">{#remove_user_account_h1#}</h2>
<p>{#remove_user_account_warning#|replace:"[user_name]":$user_name}</p>
{if $errors}
<p class="caution">{#error_headline#}</p>
<ul>
{section name=mysec loop=$errors}
	{assign var="error" value=$errors[mysec]}
	<li>{$smarty.config.$error}</li>
{/section}
</ul>
{/if}
<div>
 <form action="index.php" method="post" accept-charset="{#charset#}">
  <input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
  <input type="hidden" name="mode" value="user">
  <input type="hidden" name="action" value="edit_profile">
  <p><label for="password">{#remove_user_confirm_password#}</label><br><input id="password" type="password" spellcheck="false" autocomplete="off" name="user_password" size="25"></p>
  <button name="remove_account_submit" value="{#submit_button_ok#}">{#submit_button_ok#}</button>
 </form>
</div> 