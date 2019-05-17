{if !$list_spam}
<form action="index.php" method="get" accept-charset="{#charset#}">
<div style="margin-bottom:20px;">
<input type="hidden" name="mode" value="search" />
<input type="search" name="search" value="{$search|default:""}" size="30" />
{if $categories}
<select size="1" name="p_category">
<option value="0"{if $category==0} selected="selected"{/if}>{#all_categories#}</option>
{foreach key=key item=val from=$categories}
{if $key!=0}<option value="{$key}"{if $key==$p_category} selected="selected"{/if}>{$val}</option>{/if}
{/foreach}
</select>
{/if}
<button name="search_submit" value="{#search_submit_button#}">{#search_submit_button#}</button>{if $settings.tags>0}<br />
<span class="small"><input id="searchfulltext" type="radio" name="method" value="0"{if $method == 'fulltext'} checked="checked"{/if} class="small-input" /><label for="searchfulltext">{#search_fulltext#}</label> <input id="searchtags" type="radio" name="method" value="tags"{if $method == 'tags'} checked="checked"{/if} class="small-input" /><label for="searchtags">{#search_tags#}</label></span>{/if}
</div></form>
{/if}
{if $search || $list_spam}
{if $search_results}
<p>{if $search_results_count>1}{$smarty.config.several_postings_found|replace:"[number]":$search_results_count}{else}{#one_posting_found#}{/if}</p>
<ul class="searchresults">
{section name=result loop=$search_results}
<li><a class="{if $search_results[result].pid==0}thread-search{else}reply-search{/if}{if $search_results[result].is_read} read{/if}" href="index.php?id={$search_results[result].id}">{$search_results[result].subject}</a>{if $search_results[result].no_text} <img class="no-text" src="{$THEMES_DIR}/{$theme}/images/no_text.png" alt="{#no_text_alt#}" width="11" height="9" />{/if} - <strong>{$search_results[result].name}</strong>, <span id="p{$search_results[result].id}" class="tail">{$search_results[result].formated_time} <a href="index.php?mode=thread&amp;id={$search_results[result].id}"><img src="{$THEMES_DIR}/{$theme}/images/thread-entries-nested.svg" alt="{#open_whole_thread#}" width="12" height="12" /></a> {if $search_results[result].category}<a href="index.php?mode=index&amp;category={$search_results[result].category}"><span class="category">({$search_results[result].category_name})</span></a>{/if}</span></li>
{/section}
</ul>
{if $page_browse && $page_browse.total_items > $page_browse.items_per_page}
<ul class="pagination">
{if $page_browse.previous_page!=0}<li><a href="index.php?mode={$mode}{if $list_spam}&amp;list_spam=1{/if}{if $action}&amp;action={$action}{/if}{if $search_encoded}&amp;search={$search_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $page_browse.previous_page>1}&amp;page={$page_browse.previous_page}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#previous_page_link#}</a></li>{/if}
{section name=x loop=$page_browse.browse_array}
{if $page_browse.browse_array[x]==$page_browse.page}<li><a>{$page_browse.browse_array[x]}</a></li>{elseif $page_browse.browse_array[x]==0}<li>…</li>{else}<li><a href="index.php?mode={$mode}{if $list_spam}&amp;list_spam=1{/if}{if $action}&amp;action={$action}{/if}{if $search_encoded}&amp;search={$search_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $page_browse.browse_array[x]>1}&amp;page={$page_browse.browse_array[x]}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{$page_browse.browse_array[x]}</a></li>{/if}
{/section}
{if $page_browse.next_page!=0}<li><a href="index.php?mode={$mode}{if $list_spam}&amp;list_spam=1{/if}{if $action}&amp;action={$action}{/if}{if $search_encoded}&amp;search={$search_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$page_browse.next_page}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#next_page_link#}</a></li>{/if}
</ul>
{/if}
{else}
<p>{#no_postings_found#}</p>
{/if}
{/if}

