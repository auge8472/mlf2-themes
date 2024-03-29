{if $mode=='index'}
<ul id="subnav-2">
 <li><a class="refresh" href="index.php?refresh=1&amp;category={$category}" rel="nofollow"><span class="icon"></span><span>{#refresh_link#}</span></a></li>
 <li>{if $thread_order==0}<a class="order-1" href="index.php?mode=index&amp;thread_order=1" rel="nofollow"><span class="icon"></span><span>{#order_link#}</span></a>{else}<a class="order-2" href="index.php?mode=index&amp;thread_order=0" rel="nofollow"><span class="icon"></span><span>{#order_link#}</span></a>{/if}</li>
 <li>{if $usersettings.fold_threads==0}<a class="fold-1" href="index.php?fold_threads=1"><span class="icon"></span><span>{#fold_threads#}</span></a>{else}<a class="fold-2" href="index.php?fold_threads=0"><span class="icon"></span><span>{#expand_threads#}</span></a>{/if}</li>
 <li>{if $usersettings.user_view==0}<a class="tableview" href="index.php?toggle_view=1"><span class="icon"></span><span>{#table_view#}</span></a>{else}<a class="threadview" href="index.php?toggle_view=0"><span class="icon"></span><span>{#thread_view#}</span></a>{/if}</li>
</ul>
{elseif $mode=='entry'}
<ul id="subnav-2">
 <li><a class="openthread" href="index.php?mode=thread&amp;id={$tid}#p{$id}"><span class="icon"></span><span>{#open_in_thread_link#}</span></a></li>
</ul>
{elseif $mode=='thread'}
<ul id="subnav-2">
 <li>{if $usersettings.thread_display==0}<a class="linear" href="index.php?mode=thread&amp;id={$id}&amp;toggle_thread_display=1"><span class="icon"></span><span>{#thread_linear#}</span></a>{else}<a class="hierarchic" href="index.php?mode=thread&amp;id={$id}&amp;toggle_thread_display=0"><span class="icon"></span><span>{#thread_hierarchical#}</span></a>{/if}</li>
</ul>
{/if}
{if $categories && $mode=='index'}
<!-- subnavigation_2.inc.tpl, $categories && $mode=='index' -->
<form action="index.php" method="get" accept-charset="{#charset#}" id="subnav-3"><div>
<input type="hidden" name="mode" value="{$mode}" />
<select size="1" name="category">
 <option value="0"{if $category==0} selected="selected"{/if}>{#all_categories#}</option>
{if $category_selection} <option value="-1"{if $category==-1} selected="selected"{/if}>{#my_category_selection#}</option>
{/if}
{foreach key=key item=val from=$categories}
{if $key!=0} <option value="{$key}"{if $key==$category} selected="selected"{/if}>{$val}</option>
{/if}
{/foreach}
</select>
<button value="&raquo;">{#go#}</button>
</div></form>{/if}
