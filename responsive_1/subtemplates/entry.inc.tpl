{config_load file=$language_file section="entry"}
{assign var=email_alt value=$smarty.config.email}
{assign var=homepage_alt value=$smarty.config.homepage}
{if $hp && !$email}
{assign var=email_hp value=" <a class=\"posting-hp\" href=\"$hp\"><img src=\"$THEMES_DIR/$theme/images/home.svg\" alt=\"⌂\" width=\"15\" height=\"15\" /></a>"}
{elseif !$hp && $email}
{assign var=email_hp value=" <a class=\"posting-email\" href=\"index.php?mode=contact&amp;id=$id\" rel=\"nofollow\"><img src=\"$THEMES_DIR/$theme/images/contact-email.svg\" alt=\"@\" width=\"15\" height=\"15\" /></a>"}
{elseif $hp && $email}
{assign var=email_hp value=" <a class=\"posting-hp\" href=\"$hp\"><img src=\"$THEMES_DIR/$theme/images/home.svg\" alt=\"⌂\" width=\"15\" height=\"15\" /></a> <a class=\"posting-email\" href=\"index.php?mode=contact&amp;id=$id\" rel=\"nofollow\"><img src=\"$THEMES_DIR/$theme/images/contact-email.svg\" alt=\"@\" width=\"15\" height=\"15\" /></a>"}
{else}
{assign var=email_hp value=""}
{/if}
{if $user_type==2}
{assign var=admin_title value=$smarty.config.administrator_title}
{assign var=name value="<span class=\"admin registered_user\">$name</span>"}
{elseif $user_type==1}
{assign var=mod_title value=$smarty.config.moderator_title}
{assign var=name value="<span class=\"mod registered_user\">$name</span>"}
{elseif $posting_user_id>0}
{assign var=name value="<span class=\"registered_user\">$name</span>"}
{else}
{assign var=name value="<span class=\"unregistered\">$name</span>"}
{/if}
{if $posting_user_id>0 && ($user || $settings.user_area_public==1)}{assign var=name value="<a href=\"index.php?mode=user&amp;show_user=$posting_user_id\">$name</a>"}{/if}
<article class="posting{if $is_read} read{/if}">{if $spam}<p class="spam-note">{#spam_note#}</p>{/if}
<header>
{if $avatar}<img class="avatar" src="{$avatar.image}" alt="{#avatar_img_alt#}" width="{$avatar.width}" height="{$avatar.height}" />{/if}
<h2>{$subject}{if $category_name} <span class="category">({$category_name})</span>{/if}</h2>
<p class="author">{*{assign var=formated_time value=$disp_time|date_format:#time_format_full#}*}{if $location}{#posted_by_location#|replace:"[name]":$name|replace:"[email_hp]":$email_hp|replace:"[location]":"<span class=\"posting-location\">`$location`</span>"|replace:"[time]":"<span class=\"posting-time\">`$formated_time`</span>"}{else}{#posted_by#|replace:"[name]":$name|replace:"[email_hp]":$email_hp|replace:"[time]":"<span class=\"posting-time\">`$formated_time`</span>"}{/if} <span class="posting-ago">({if $ago.days>1}{#posting_several_days_ago#|replace:"[days]":$ago.days_rounded}{else}{if $ago.days==0 && $ago.hours==0}{#posting_minutes_ago#|replace:"[minutes]":$ago.minutes}{elseif $ago.days==0 && $ago.hours!=0}{#posting_hours_ago#|replace:"[hours]":$ago.hours|replace:"[minutes]":$ago.minutes}{else}{#posting_one_day_ago#|replace:"[hours]":$ago.hours|replace:"[minutes]":$ago.minutes}{/if}{/if})</span>{if $admin && $ip} <span class="posting-ip">({$ip})</span>{/if}{if $pid!=0} <span class="op-link"><a href="index.php?id={$pid}">@ {$data.$pid.name}</a></span>{/if}{if $views}<span class="posting-views">{if $views==1}{#one_view#}{else}{#several_views#|replace:"[views]":$views}{/if}</span>{/if}{if $edited}{*{assign var=formated_edit_time value=$edit_time|date_format:#time_format_full#}*}<br />
<span class="posting-edited">{#edited_by#|replace:"[name]":$edited_by|replace:"[time]":$formated_edit_time}</span>{/if}</p>
</header>
<div class="body">
{if $posting}
{$posting}
{else}
<p>{#no_text#}</p>
{/if}
{if $signature}
<p class="signature">--<br />
{$signature}</p>
{/if}
</div>
<footer class="posting-footer">
{if $tags}
<div class="tags">
 <h3>{#tags_marking#}</h3>
 <ul>
{foreach name="tags" from=$tags item=tag}  <li><a href="index.php?mode=search&amp;search={$tag.escaped}&amp;method=tags">{$tag.display}</a></li>
{/foreach}
 </ul>
</div>
{/if}
<ul class="options">
 <li>{if $locked==0}<a class="stronglink" href="index.php?mode=posting&amp;id={$id}&amp;back=entry"><span class="icon"></span><span>{#reply_link#}</span></a>{else}<span class="locked"><span class="icon"></span><span>{#posting_locked#}</span></span>{/if}</li>
{if $options}
{if $options.add_bookmark} <li><a href="index.php?mode=posting&amp;bookmark={$id}&amp;back=entry" class="add-bookmark"><span class="icon"></span><span>{#add_bookmark_message_linkname#}</span></a></li>
{/if}
{if $options.delete_bookmark} <li><a href="index.php?mode=posting&amp;bookmark={$id}&amp;back=entry" class="delete-bookmark"><span class="icon"></span><span>{#delete_bookmark_message_linkname#}</span></a></li>
{/if}
{if $options.edit} <li><a href="index.php?mode=posting&amp;edit={$id}&amp;back=entry" class="edit"><span class="icon"></span><span>{#edit_message_linkname#}</span></a></li>
{/if}
{if $options.delete} <li><a href="index.php?mode=posting&amp;delete_posting={$id}&amp;csrf_token={$CSRF_TOKEN}&amp;back=entry" class="delete"><span class="icon"></span><span>{#delete_message_linkname#}</span></a></li>
{/if}
{if $options.move} <li><a href="index.php?mode=posting&amp;move_posting={$id}&amp;back=entry" class="move"><span class="icon"></span><span>{#move_posting_linkname#}</span></a></li>
{/if}
{if $options.report_spam} <li><a href="index.php?mode=posting&amp;report_spam={$id}&amp;back=entry" class="report"><span class="icon"></span><span>{#report_spam_linkname#}</span></a></li>
{/if}
{if $options.flag_ham} <li><a href="index.php?mode=posting&amp;flag_ham={$id}&amp;back=entry" class="report"><span class="icon"></span><span>{#flag_ham_linkname#}</span></a></li>
{/if}
{if $options.lock} <li><a href="index.php?mode=posting&amp;lock={$id}&amp;back=entry" class="{if $locked==0}lock{else}unlock{/if}"><span class="icon"></span><span>{if $locked==0}{#lock_linkname#}{else}{#unlock_linkname#}{/if}</span></a></li>
 <li><a href="index.php?mode=posting&amp;lock_thread={$id}&amp;back=entry" class="lock-thread"><span class="icon"></span><span>{#lock_thread_linkname#}</span></a></li>
 <li><a href="index.php?mode=posting&amp;unlock_thread={$id}&amp;back=entry" class="unlock-thread"><span class="icon"></span><span>{#unlock_thread_linkname#}</span></a></li>
{/if}
{/if}
</ul>
</footer>
</article>
<hr class="entryline" />
<section class="thread-tree">
 <header>
  <h2>{#complete_thread_marking#}</h2>
{if $settings.rss_feed==1}<p><a class="rss" href="index.php?mode=rss&amp;thread={$tid}">{#rss_feed_thread#}</a></p>{/if}
 </header>
 <ul class="thread openthread">
{function name=tree level=0}
  <li><a class="{if $data.$element.pid==0}opening-entry{else}following-entry{/if}{if $data.$element.new} new{/if}{if $data.$element.sticky==1} sticky{/if}{if $data.$element.locked==1} locked{/if}{if $data.$element.is_read} read{/if}"{if $data.$element.id!=$id} href="index.php?id={$data.$element.id}"{/if}>{$data.$element.subject}</a>{if $data.$element.no_text} <img class="no-text" src="{$THEMES_DIR}/{$theme}/images/no_content.svg" alt="[ {#no_text_alt#} ]" width="12" height="12" />{/if} - 

<strong{if $data.$element.user_type==2} class="admin registered_user"{elseif $data.$element.user_type==1} class="mod registered_user"{elseif $data.$element.user_id>0} class="registered_user"{/if}>{$data.$element.name}</strong>, 

<span id="p{$data.$element.id}" class="tail">{$data.$element.formated_time}{if $data.$element.pid==0} <a href="index.php?mode=thread&amp;id={$data.$element.id}"><img src="{$THEMES_DIR}/{$theme}/images/thread-entries-nested.svg" title="{#open_whole_thread#}" alt="[*]" width="12" height="12" /></a>{/if}{if $admin || $mod} <a id="marklink_{$data.$element.id}" href="index.php?mode=posting&amp;mark={$data.$element.id}&amp;back={$id}" title="{#mark_linktitle#}" onclick="mark({$data.$element.id},'{$THEMES_DIR}/{$theme}/images/marked.png','{$THEMES_DIR}/{$theme}/images/unmarked.png','{$THEMES_DIR}/{$theme}/images/mark_process.png','{#mark_linktitle#}','{#unmark_linktitle#}'); return false">{if $data.$element.marked==0}<img id="markimg_{$data.$element.id}" src="{$THEMES_DIR}/{$theme}/images/unmarked.png" title="{#mark_linktitle#}" alt="[○]" width="11" height="11" />{else}<img id="markimg_{$data.$element.id}" src="{$THEMES_DIR}/{$theme}/images/marked.png" title="{#unmark_linktitle#}" alt="[●]" width="11" height="11" />{/if}</a> <a href="index.php?mode=posting&amp;delete_posting={$data.$element.id}&amp;csrf_token={$CSRF_TOKEN}&amp;back=entry" title="{#delete_posting_title#}" onclick="return delete_posting_confirm(this, '{$smarty.config.delete_posting_confirm|escape:"url"}')"><img src="{$THEMES_DIR}/{$theme}/images/marker-cross.svg" alt="[x]" width="12" height="12" /></a>{/if}</span>
{if is_array($child_array[$element])}
<ul class="{if $level<$settings.deep_reply}reply{elseif $level>=$settings.deep_reply&&$level<$settings.very_deep_reply}deep-reply{else}very-deep-reply{/if}{if $fold_threads==1} js-display-none{/if}">{foreach from=$child_array[$element] item=child}{tree element=$child level=$level+1}{/foreach}</ul>{/if}</li>
{/function}
{tree element=$tid}
 </ul>
</section>
