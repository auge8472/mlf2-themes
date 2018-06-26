{config_load file=$language_file section="entry"}
{function name=tree level=0}
<div class="{if $level==0}thread-wrapper{elseif $level>0&&$level<$settings.deep_reply}reply-wrapper{elseif $level>=$settings.deep_reply&&$level<$settings.very_deep_reply}deep-reply-wrapper{else}very-deep-reply-wrapper{/if}">
{*{assign var=formated_time value=$data.$element.disp_time|date_format:#time_format_full#}*}
{assign var=email_alt value=$smarty.config.email}
{assign var=homepage_alt value=$smarty.config.homepage}
{assign var=hp value=$data.$element.hp}
{assign var=email value=$data.$element.email}
{assign var=email_id value=$data.$element.id}
{if $hp && !$email}
{assign var=email_hp value=" <a class=\"posting-hp\" href=\"$hp\"><img src=\"$THEMES_DIR/$theme/images/home.svg\" alt=\"⌂\" width=\"15\" height=\"15\" /></a>"}
{elseif !$hp && $email}
{assign var=email_hp value=" <a class=\"posting-email\" href=\"index.php?mode=contact&amp;id=$email_id\" rel=\"nofollow\"><img src=\"$THEMES_DIR/$theme/images/contact-email.svg\" alt=\"@\" width=\"15\" height=\"15\" /></a>"}
{elseif $hp && $email}
{assign var=email_hp value=" <a class=\"posting-hp\" href=\"$hp\"><img src=\"$THEMES_DIR/$theme/images/home.svg\" alt=\"⌂\" width=\"15\" height=\"15\" /></a> <a class=\"posting-email\" href=\"index.php?mode=contact&amp;id=$email_id\" rel=\"nofollow\"><img src=\"$THEMES_DIR/$theme/images/contact-email.svg\" alt=\"@\" width=\"15\" height=\"15\" /></a>"}
{else}
{assign var=email_hp value=""}
{/if}

{if $data.$element.user_type==2}
{assign var=admin_name value=$data.$element.name}
{assign var=admin_title value=$smarty.config.administrator_title}
{assign var=name value="<span class=\"admin registered_user\">$admin_name</span>"}
{elseif $data.$element.user_type==1}
{assign var=mod_name value=$data.$element.name}
{assign var=mod_title value=$smarty.config.moderator_title}
{assign var=name value="<span class=\"mod registered_user\">$mod_name</span>"}
{elseif $data.$element.user_id>0}
{assign var=user_name value=$data.$element.name}
{assign var=name value="<span class=\"registered_user\">$user_name</span>"}
{else}
{assign var=name value="<span class=\"unregistered\">{$data.$element.name}</span>"}
{/if}

{if ($user || $settings.user_area_public==1) && $data.$element.user_id>0}
{assign var=posting_user_id value=$data.$element.user_id}
{assign var=name value="<a href=\"index.php?mode=user&amp;show_user=$posting_user_id\">$name</a>"}
{/if}
<article class="thread-posting{if $data.$element.new} new{/if}{if $data.$element.is_read} read{/if}" id="p{$data.$element.id}">
<header class="header">
{if $data.$element.avatar}<img id="avatar-{$data.$element.id}" class="avatar" src="{$data.$element.avatar.image}" alt="{#avatar_img_alt#}" width="{$data.$element.avatar.width}" height="{$data.$element.avatar.height}" />{/if}
<h2 id="headline-{$data.$element.id}">{$data.$element.subject}{if $data.$element.pid==0 && $category_name} <span class="category">({$category_name})</span>{/if}</h2>
<p class="author">{if $data.$element.location}{#posted_by_location#|replace:"[name]":$name|replace:"[email_hp]":$email_hp|replace:"[location]":"<span class=\"posting-location\">`$data.$element.location`</span>"|replace:"[time]":"<span class=\"posting-time\">`$data.$element.formated_time`</span>"}{else}{#posted_by#|replace:"[name]":$name|replace:"[email_hp]":$email_hp|replace:"[time]":"<span class=\"posting-time\">`$data.$element.formated_time`</span>"}{/if} <span class="posting-ago">{if $data.$element.ago.days>1}{#posting_several_days_ago#|replace:"[days]":$data.$element.ago.days_rounded}{else}{if $data.$element.ago.days==0 && $data.$element.ago.hours==0}{#posting_minutes_ago#|replace:"[minutes]":$data.$element.ago.minutes}{elseif $data.$element.ago.days==0 && $data.$element.ago.hours!=0}{#posting_hours_ago#|replace:"[hours]":$data.$element.ago.hours|replace:"[minutes]":$data.$element.ago.minutes}{else}{#posting_one_day_ago#|replace:"[hours]":$data.$element.ago.hours|replace:"[minutes]":$data.$element.ago.minutes}{/if}{/if}</span>{if $admin && $data.$element.ip} <span class="posting-ip">{$data.$element.ip}</span>{/if}{if $data.$element.pid!=0}{assign var="parent_posting" value=$data.$element.pid} <a class="op-link" href="#p{$data.$element.pid}">@ {$data.$parent_posting.name}</a>{/if}{if $data.$element.views} <span class="posting-views">{if $data.$element.views==1}{#one_view#}{else}{#several_views#|replace:"[views]":$data.$element.views}{/if}</span>{/if}</p>{if $data.$element.edited}<p class="posting-edited">{#edited_by#|replace:"[name]":$data.$element.edited_by|replace:"[time]":$data.$element.formated_edit_time}</p>{/if}
{if $data.$element.tags}
<div class="tags">
 <h3>{#tags_marking#}</h3>
 <ul>
{foreach name="tags" from=$data.$element.tags item=tag}  <li><a href="index.php?mode=search&amp;search={$tag.escaped}&amp;method=tags">{$tag.display}</a></li>
{/foreach}
 </ul>
</div>
{/if}
</header>
<div class="wrapper" id="posting-{$data.$element.id}">
<div class="body">
{if $data.$element.posting}
{$data.$element.posting}
{else}
<p>{#no_text#}</p>
{/if}
{if $data.$element.signature}
<p class="signature">--<br />
{$data.$element.signature}</p>
{/if}
</div>
<footer class="posting-footer item-tools">
<ul class="options">
<li>{if $data.$element.locked==0}<a class="stronglink" href="index.php?mode=posting&amp;id={$data.$element.id}&amp;back=thread">{#reply_link#}</a>{else}<span class="locked">{#posting_locked#}</span>{/if}</li>
{if $data.$element.options}
{if $data.$element.options.add_bookmark}<li><a href="index.php?mode=posting&amp;bookmark={$data.$element.id}&amp;back=thread" class="add-bookmark">{#add_bookmark_message_linkname#}</a></li>{/if}
{if $data.$element.options.delete_bookmark}<li><a href="index.php?mode=posting&amp;bookmark={$data.$element.id}&amp;back=thread" class="delete-bookmark">{#delete_bookmark_message_linkname#}</a></li>{/if}
{if $data.$element.options.edit}<li><a href="index.php?mode=posting&amp;edit={$data.$element.id}&amp;back=thread" class="edit">{#edit_message_linkname#}</a></li>{/if}
{if $data.$element.options.delete}<li><a href="index.php?mode=posting&amp;delete_posting={$data.$element.id}&amp;back=thread" class="delete">{#delete_message_linkname#}</a></li>{/if}
{if $data.$element.options.move}<li><a href="index.php?mode=posting&amp;move_posting={$data.$element.id}&amp;back=thread" class="move">{#move_posting_linkname#}</a></li>{/if}
{if $data.$element.options.report_spam}<li><a href="index.php?mode=posting&amp;report_spam={$data.$element.id}&amp;back=thread" class="report">{#report_spam_linkname#}</a></li>{/if}
{if $data.$element.options.flag_ham}<li><a href="index.php?mode=posting&amp;flag_ham={$data.$element.id}&amp;back=thread" class="report">{#flag_ham_linkname#}</a></li>{/if}
{if $data.$element.options.lock}<li><a href="index.php?mode=posting&amp;lock={$data.$element.id}&amp;back=thread" class="{if $data.$element.locked==0}lock{else}unlock{/if}">{if $data.$element.locked==0}{#lock_linkname#}{else}{#unlock_linkname#}{/if}</a></li>
{if $data.$element.pid==0}<li><a href="index.php?mode=posting&amp;lock_thread={$data.$element.id}&amp;back=thread" class="lock-thread">{#lock_thread_linkname#}</a></li>
<li><a href="index.php?mode=posting&amp;unlock_thread={$data.$element.id}&amp;back=thread" class="unlock-thread">{#unlock_thread_linkname#}</a></li>{/if}{/if}
{/if}
</ul>
</footer>
</div>
</article>
{if is_array($child_array[$element])}
{foreach from=$child_array[$element] item=child}{tree element=$child level=$level+1}{/foreach}
{/if}
</div>
{/function}
{tree element=$tid}
{if $settings.rss_feed==1}<div class="small" style="text-align:right;"><a class="rss" href="index.php?mode=rss&amp;thread={$tid}">{#rss_feed_thread#}</a></div>{/if}
