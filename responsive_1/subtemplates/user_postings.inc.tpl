{if $pagination}
<ul class="pagination">
{if $pagination.previous}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $id}&amp;id={$id}{/if}{if $pagination.previous>1}&amp;page={$pagination.previous}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $id}&amp;id={$id}{/if}{if $item>1}&amp;page={$item}{/if}">{$item}</a></li>{/if}
{/foreach}
{if $pagination.next}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$pagination.next}">{#next_page_link#}</a></li>{/if}
</ul>
{/if}
{if $user_postings_data}
<p>{if $user_postings_count>1}{$smarty.config.several_postings_by_user|replace:"[number]":$user_postings_count}{else}{#one_posting_by_user#}{/if}</p>
<ul class="searchresults">
{section name=ix loop=$user_postings_data}
<li><a class="{if $user_postings_data[ix].pid==0}thread-search{else}reply-search{/if} {if $visited && in_array($user_postings_data[ix].id,$visited)} visited{/if}" href="index.php?mode=entry&amp;id={$user_postings_data[ix].id}">{$user_postings_data[ix].subject}</a> - 
<strong>{$user_postings_data[ix].name}</strong> <time>{$user_postings_data[ix].disp_time}</time>
{if $user_postings_data[ix].category && $category<=0} <a href="index.php?mode=index&amp;category={$user_postings_data[ix].category}" class="category" title="{#change_category_link#|replace:"[category]":$user_postings_data[ix].category_name|escape:"html"}"><span class="category">{$user_postings_data[ix].category_name}</span></a>{/if} · 
<span id="p{$user_postings_data[ix].id}" class="tail"><a href="index.php?mode=thread&amp;id={$user_postings_data[ix].id}"><img src="{$THEMES_DIR}/{$theme}/images/thread-entries-nested.svg" alt="{#open_whole_thread#}" width="12" height="12" /></a></span></li>
{/section}
</ul>
{if $pagination}
<ul class="pagination">
{if $pagination.previous}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $id}&amp;id={$id}{/if}{if $pagination.previous>1}&amp;page={$pagination.previous}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $id}&amp;id={$id}{/if}{if $item>1}&amp;page={$item}{/if}">{$item}</a></li>{/if}
{/foreach}
{if $pagination.next}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$pagination.next}">{#next_page_link#}</a></li>{/if}
</ul>
{/if}
{else}
<p>{#no_postings_by_user#}</p>
{/if}
