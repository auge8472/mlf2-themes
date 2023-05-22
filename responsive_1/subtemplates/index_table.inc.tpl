<div id="main-container">

{if $tag_cloud || $latest_postings || $admin || $mod}
<aside id="bottombar"{if $usersettings.sidebar==0} class="js-display-fold"{/if}>
<h2><a href="index.php?toggle_sidebar=true" title="{#toggle_sidebar#}">{#sidebar#}</a></h2>
<div id="sidebarcontent">
{if $latest_postings}
<section id="latest-postings">
<h3>{#latest_postings_hl#}</h3>
<ul id="latest-postings-container">
{foreach from=$latest_postings item=posting} <li><a href="index.php?id={$posting.id}" {if $posting.is_read} class="read"{/if}>
  <span class="entry-title">{if $posting.pid==0}<strong>{$posting.subject}</strong>{else}{$posting.subject}{/if}</span>
  <span class="entry-metadata">{$posting.name}, {$posting.formated_time}{if $posting.category_name} ({$posting.category_name}){/if}</span>
  <span class="entry-date">{if $posting.ago.days>1}{#posting_several_days_ago#|replace:"[days]":$posting.ago.days_rounded}{else}{if $posting.ago.days==0 && $posting.ago.hours==0}{#posting_minutes_ago#|replace:"[minutes]":$posting.ago.minutes}{elseif $posting.ago.days==0 && $posting.ago.hours!=0}{#posting_hours_ago#|replace:"[hours]":$posting.ago.hours|replace:"[minutes]":$posting.ago.minutes}{else}{#posting_one_day_ago#|replace:"[hours]":$posting.ago.hours|replace:"[minutes]":$posting.ago.minutes}{/if}{/if}</span></a></li>
{/foreach}
</ul>
</section>
{/if}
{if $tag_cloud}
<section id="tagcloud">
<h3>{#tag_cloud_hl#}</h3>
<ul>
{foreach from=$tag_cloud item=tag}
 <li><a href="index.php?mode=search&amp;search={$tag.escaped}&amp;method=tags">{section name=strong_start start=0 loop=$tag.frequency}<strong>{/section}{$tag.tag}{section name=strong_end start=0 loop=$tag.frequency}</strong>{/section}</a></li>
{/foreach}
</ul>
</section>
{/if}
{if $admin || $mod}
<section id="modmenu">
<h3>{#options#}</h3>
<ul id="mod-options">
{if $number_of_non_activated_users}<li><a href="index.php?mode=user" class="non-activated-users"><span class="icon"></span><span>{#non_activated_users_link#|replace:'[counter]':$number_of_non_activated_users}</span></a></li>{/if}
<li><a href="index.php?mode=posting&amp;delete_marked=true" class="delete-marked"><span class="icon"></span><span>{#delete_marked_link#}</span></a></li>
<li><a href="index.php?mode=posting&amp;manage_postings=true" class="manage"><span class="icon"></span><span>{#manage_postings_link#}</span></a></li>
{if $show_spam_link}<li><a href="index.php?show_spam=true" class="include-spam"><span class="icon"></span><span>{$smarty.config.show_spam_link|replace:"[number]":$total_spam}</span></a></li>{/if}
{if $hide_spam_link}<li><a href="index.php?show_spam=true" class="exclude-spam"><span class="icon"></span><span>{$smarty.config.hide_spam_link|replace:"[number]":$total_spam}</span></a></li>{/if}
{if $delete_spam_link}<li><a href="index.php?mode=posting&amp;delete_spam=true" class="delete-spam"><span class="icon"></span><span>{#delete_spam_link#}</span></a></li>{/if}
</ul>
</section>{/if}
</div>
</aside>
{/if}

<section id="main-thread-list">
{if $pagination}
<ul class="pagination pagination-index-table">
{if $pagination.previous}<li><a href="index.php?mode={$mode}&amp;page={$pagination.previous}{if $category}&amp;category={$category}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}&amp;page={$item}{if $category}&amp;category={$category}{/if}">{$item}</a></li>{/if}
{/foreach}
{if $pagination.next}<li><a href="index.php?mode={$mode}&amp;page={$pagination.next}{if $category}&amp;category={$category}{/if}">{#next_page_link#}</a></li>{/if}
</ul>
{/if}
{if $threads}
<table>
 <thead>
  <tr>{*
{if $fold_threads==1}   <th class="cell-folder">&nbsp;</th>{/if}*}
   <th class="cell-subject">{#subject#}</th>
   <th class="cell-author">{#author#}</th>
   <th class="cell-date">{#date#}</th>
{if $settings.count_views}   <th class="cell-count-views">{#views#}</th>
{/if}
   <th class="cell-count-replies">{#replies#}</th>
{if $categories && $category<=0}   <th class="cell-category">{#category#}</th>
{/if}
  </tr>
 </thead>
 <tbody>
{foreach from=$threads item=thread}
  <tr>
{*{if $fold_threads==1}   <td class="fold cell-folder"></td>{/if}*}
   <td class="subject cell-subject">
<ul id="thread-{$thread}" class="thread {if $fold_threads==1}folded{else}expanded{/if}">
{function name=tree level=0}
<li><a class="{if $data.$element.pid==0}opening-entry{else}following-entry{/if}{if $data.$element.new} new{/if}{if $data.$element.sticky>0} sticky{/if}{if $data.$element.locked==1} locked{/if}{if $data.$element.is_read} read{/if}{if $data.$element.spam==1} spam{/if}" href="index.php?mode=thread&amp;id={$data.$element.tid}{if $data.$element.pid!=0}#p{$data.$element.id}{/if}" title="{$data.$element.name}, {$data.$element.formated_time}">{$data.$element.subject}</a>{if $data.$element.no_text} <img class="no-text" src="{$THEMES_DIR}/{$theme}/images/no_content.svg" alt="[ {#no_text_alt#} ]" width="12" height="12" />{/if}
<span id="p{$data.$element.id}" class="tail">{if $admin || $mod}
{if $data.$element.not_classified_spam_ham==1}<a><img src="{$THEMES_DIR}/{$theme}/images/keep_eye_on.svg" title="{#unclassified_linktitle#}" alt="[!]" width="11" height="11" /></a>{/if}
{if $data.$element.marked==0} <a id="marklink_{$data.$element.id}" href="index.php?mode=posting&amp;mark={$data.$element.id}"><img id="markimg_{$data.$element.id}" src="{$THEMES_DIR}/{$theme}/images/unmarked.png" alt="" width="11" height="11" /><span>{#mark_linktitle#}</span></a>
{else} <a id="marklink_{$data.$element.id}" href="index.php?mode=posting&amp;mark={$data.$element.id}"><img id="markimg_{$data.$element.id}" src="{$THEMES_DIR}/{$theme}/images/marked.png" alt="" width="11" height="11" /><span>{#unmark_linktitle#}</span></a>{/if}
 <a href="index.php?mode=posting&amp;delete_posting={$data.$element.id}&amp;csrf_token={$CSRF_TOKEN}&amp;back=index"><img src="{$THEMES_DIR}/{$theme}/images/marker-cross.svg" alt="" width="12" height="12" /><span>{#delete_posting_title#}</span></a>{/if}</span>
{if is_array($child_array[$element])}
<ul class="{if $level<$settings.deep_reply}reply{elseif $level>=$settings.deep_reply&&$level<$settings.very_deep_reply}deep-reply{else}very-deep-reply{/if}{if $fold_threads==1} js-display-none{/if}">{foreach from=$child_array[$element] item=child}{tree element=$child level=$level+1}{/foreach}</ul>{/if}</li>
{/function}
{tree element=$thread}
</ul>
</td>
   <td data-header="{#author#}" class="cell-author"><span class="value nowrap">{if $data.$thread.user_type==2}<span class="admin registered_user">{$data.$thread.name}</span>{elseif $data.$thread.user_type==1}<span class="mod registered_user">{$data.$thread.name}</span>{elseif $data.$thread.user_id>0}<span class="registered_user">{$data.$thread.name}</span>{else}{$data.$thread.name}{/if}</span></td>
   <td data-header="{#date#}" class="cell-date"><span class="value nowrap">{$data.$thread.formated_time}</span></td>
{if $settings.count_views}   <td data-header="{#views#}" class="cell-count-views"><span class="value">{$total_views.$thread}</span></td>
{/if}
   <td data-header="{#replies#}" class="cell-count-replies"><span class="value">{$replies.$thread}</span></td>
{if $categories && $category<=0}   <td data-header="{#category#}" class="cell-category">{if $data.$thread.category_name}<a href="index.php?mode=index&amp;category={$data.$thread.category}" class="value category nowrap" title="{#change_category_link#|replace:"[category]":$data.$thread.category_name|escape:"html"}">{$data.$thread.category_name}</a>{else}&nbsp;{/if}</td>
{/if}
</tr>
{/foreach}
 </tbody>
</table>
{if $pagination}
<ul class="pagination pagination-index-table">
{if $pagination.previous}<li><a href="index.php?mode={$mode}&amp;page={$pagination.previous}{if $category}&amp;category={$category}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}&amp;page={$item}{if $category}&amp;category={$category}{/if}">{$item}</a></li>{/if}
{/foreach}
{if $pagination.next}<li><a href="index.php?mode={$mode}&amp;page={$pagination.next}{if $category}&amp;category={$category}{/if}">{#next_page_link#}</a></li>{/if}
</ul>
{/if}
{else}<p>{if $category!=0}{#no_messages_in_category#}{else}{#no_messages#}{/if}</p>{/if}
</section>
</div>