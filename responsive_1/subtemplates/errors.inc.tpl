<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
