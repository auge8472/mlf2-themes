{config_load file=$language_file section="unsubscribe_posting"}
{if $unsubscribe_status === true}
<section>
<h2>{#unsubscribed_hl#}</h2>
<p>{#unsubscribed_message#}</p>
</section>
{else}
<section class="errormessage">
<h2>{#unsubscribe_error_hl#}</h2>
<p>{#unsubscribe_error_message#}</p>
</section>
{/if}
