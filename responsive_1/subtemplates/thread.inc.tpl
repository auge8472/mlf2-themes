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

{if (($settings.user_area_access == 0 and ($admin or $mod)) or ($settings.user_area_access == 1 and $user) or $settings.user_area_access == 2) && $data.$element.user_id>0}
{assign var=posting_user_id value=$data.$element.user_id}
{assign var=name value="<a href=\"index.php?mode=user&amp;show_user=$posting_user_id\">$name</a>"}
{/if}
<article class="thread-posting{if $data.$element.new} new{/if}{if $data.$element.is_read} read{/if}" id="p{$data.$element.id}">
<header class="header">
{if $data.$element.avatar}<img id="avatar-{$data.$element.id}" class="avatar" src="{$data.$element.avatar.image}" alt="{#avatar_img_alt#}" width="{$data.$element.avatar.width}" height="{$data.$element.avatar.height}" />
{elseif $data.$element.user_id>0}<img class="avatar" src="themes/responsive_1/images/user.svg" alt="{#avatar_img_alt#}" width="48" height="48" />
{else}<img class="avatar" src="themes/responsive_1/images/visitor.svg" alt="{#avatar_img_alt#}" width="48" height="48" />
{/if}
<h2 id="headline-{$data.$element.id}">{$data.$element.subject}{if $data.$element.pid==0 && $category_name} <span class="category">{$category_name}</span>{/if}</h2>
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
</div>
{if $data.$element.signature}
<div class="signature">
<p>--<br />
{$data.$element.signature}</p>
</div>
{/if}
</div>
<footer class="posting-footer">
<ul class="options">
 <li>{if $data.$element.locked==0}<a class="stronglink" href="index.php?mode=posting&amp;id={$data.$element.id}&amp;back=thread"><span class="icon"></span><span>{#reply_link#}</span></a>{else}<span class="locked"><span class="icon"></span><span>{#posting_locked#}</span></span>{/if}</li>
{if $data.$element.options}
{if $data.$element.options.add_bookmark} <li><a href="index.php?mode=posting&amp;bookmark={$data.$element.id}&amp;back=thread" class="add-bookmark"><span class="icon"></span><span>{#add_bookmark_message_linkname#}</span></a></li>
{/if}
{if $data.$element.options.delete_bookmark} <li><a href="index.php?mode=posting&amp;bookmark={$data.$element.id}&amp;back=thread" class="delete-bookmark"><span class="icon"></span><span>{#delete_bookmark_message_linkname#}</span></a></li>
{/if}
{if $data.$element.options.edit} <li><a href="index.php?mode=posting&amp;edit={$data.$element.id}&amp;back=thread" class="edit"><span class="icon"></span><span>{#edit_message_linkname#}</span></a></li>
{/if}
{if $data.$element.options.delete} <li><a href="index.php?mode=posting&amp;delete_posting={$data.$element.id}&amp;csrf_token={$CSRF_TOKEN}&amp;back=thread" class="delete"><span class="icon"></span><span>{#delete_message_linkname#}</span></a></li>
{/if}
{if $data.$element.options.move} <li><a href="index.php?mode=posting&amp;move_posting={$data.$element.id}&amp;back=thread" class="move"><span class="icon"></span><span>{#move_posting_linkname#}</span></a></li>
{/if}
{if $data.$element.options.report_spam} <li><a href="index.php?mode=posting&amp;report_spam={$data.$element.id}&amp;back=thread" class="report"><span class="icon"></span><span>{#report_spam_linkname#}</span></a></li>
{/if}
{if $data.$element.options.flag_ham} <li><a href="index.php?mode=posting&amp;flag_ham={$data.$element.id}&amp;back=thread" class="report"><span class="icon"></span><span>{#flag_ham_linkname#}</span></a></li>
{/if}
{if $data.$element.options.lock} <li><a href="index.php?mode=posting&amp;lock={$data.$element.id}&amp;back=thread" class="{if $data.$element.locked==0}lock{else}unlock{/if}"><span class="icon"></span><span>{if $data.$element.locked==0}{#lock_linkname#}{else}{#unlock_linkname#}{/if}</span></a></li>
{if $data.$element.pid==0} <li><a href="index.php?mode=posting&amp;lock_thread={$data.$element.id}&amp;back=thread" class="lock-thread"><span class="icon"></span><span>{#lock_thread_linkname#}</a></li>
 <li><a href="index.php?mode=posting&amp;unlock_thread={$data.$element.id}&amp;back=thread" class="unlock-thread"><span class="icon"></span><span>{#unlock_thread_linkname#}</span></a></li>
{/if}
{/if}
{/if}
</ul>
</footer>
</article>
{if is_array($child_array[$element])}
{foreach from=$child_array[$element] item=child}{tree element=$child level=$level+1}{/foreach}
{/if}
</div>
{/function}
{tree element=$tid}
{if $settings.rss_feed==1}<p class="thread-feed"><a class="rss" href="index.php?mode=rss&amp;thread={$tid}">{#rss_feed_thread#}</a></p>{/if}
