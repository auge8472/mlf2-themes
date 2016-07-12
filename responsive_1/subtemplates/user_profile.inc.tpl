{config_load file=$language_file section="user_show"}
{if $user_name}
<table>
 <tbody>
  <tr>
   <th><strong>{#user_name#}</strong></th>
   <td class="d"><p class="userdata"><strong>{$user_name}</strong>{if $gender==1} <img src="{$THEMES_DIR}/{$theme}/images/male.png" alt="{#male#}" width="16" height="16" />{elseif $gender==2} <img src="{$THEMES_DIR}/{$theme}/images/female.png" alt="{#female#}" width="16" height="16" />{/if} <span class="xsmall">{if $p_user_type==2}({#admin#}){elseif $p_user_type==1}({#mod#}){else}<!--({#user#})-->{/if}</span>{if $user_is_locked} <span class="small user-locked">({#user_locked#})</span>{/if}</p></td>
  </tr>
{if $avatar}
  <tr>
   <th><strong>{#user_avatar#}</strong></th>
   <td class="d"><p class="userdata"><img src="{$avatar.image}" alt="{#avatar_img_alt#}" width="{$avatar.width}" height="{$avatar.height}" /></p></td>
  </tr>
{/if}
{if $user_hp || $user_email}
  <tr>
   <th><strong>{#user_hp_email#}</strong></th>
   <td class="d">{if $user_hp=='' && $user_email==''}-{/if}{if $user_hp!=''}<a href="{$user_hp}" title="{$user_hp}"><img src="{$THEMES_DIR}/{$theme}/images/homepage.png" alt="{#homepage#}" width="13" height="13" /></a> &nbsp;{/if}{if $user_email}<a href="index.php?mode=contact&amp;user_id={$p_user_id}" title="{#mailto_user#|replace:"[user]":$user_name}" rel="nofollow"><img src="{$THEMES_DIR}/{$theme}/images/email.png" alt="{#email#}" width="13" height="10" /></a>{/if}</td>
  </tr>
{/if}
{if $user_real_name}
  <tr>
   <th><strong>{#user_real_name#}</strong></th>
   <td class="d">{$user_real_name|default:'-'}</td>
  </tr>
{/if}
{if $birthdate}
  <tr>
   <th><strong>{#age_birthday#}</strong></th>
   <td class="d">{$years} / {$birthdate.year}-{$birthdate.month}-{$birthdate.day}</td>
  </tr>
{/if}
{if $user_location}
  <tr>
   <th><strong>{#user_location#}</strong></th>
   <td class="d">{$user_location|default:'-'}</td>
  </tr>
{/if}
  <tr>
   <th><strong>{#user_registered#}</strong></th>
   <td class="d">{$user_registered}</td>
  </tr>
{if $user_last_login}
  <tr>
   <th><strong>{#user_last_login#}</strong></th>
   <td class="d">{$user_last_login|default:'-'}</td>
  </tr>
{/if}
  <tr>
   <th><strong>{#user_logins#}</strong></th>
   <td class="d">{$logins}</td>
  </tr>
  <tr>
   <th><strong>{#logins_per_day#}</strong></th>
   <td class="d">{$logins_per_day}</td>
  </tr>
  <tr>
   <th><strong>{#user_postings#}</strong></th>
   <td class="d">{$postings} ({$postings_percent}%){if $postings>0} <span class="small">[ <a href="index.php?mode=user&amp;action=show_posts&amp;id={$p_user_id}">{#show_postings_link#}</a> ]</span>{/if}</td>
  </tr>
  <tr>
   <th><strong>{#postings_per_day#}</strong></th>
   <td class="d">{$postings_per_day}</td>
  </tr>
{if $last_posting_subject}
  <tr>
   <th><strong>{#last_posting#}</strong></th>
   <td class="d">{if $last_posting_subject}{$last_posting_time|date_format:#time_format#}: <a id="user-last-posting" href="index.php?mode=entry&amp;id={$last_posting_id}">{$last_posting_subject}</a>{else}-{/if}</td>
  </tr>
{/if}
{if $profile}
  <tr>
   <th><strong>{#user_profile#}</strong></th>
   <td class="d">{$profile|default:'-'}</td>
  </tr>
{/if}
 </tbody>
</table>

{if $mod||$admin}
<ul class="adminmenu">
{if $admin}{if $postings} <li><a href="index.php?mode=admin&amp;user_delete_all_entries={$p_user_id}"><img src="{$THEMES_DIR}/{$theme}/images/delete_entries.png" alt="" width="16" height="16" /><span>{#user_delete_all_entries#}</span></a></li>{/if}{/if}
{if $p_user_type==0} <li><a href="index.php?mode=user&amp;user_lock={$p_user_id}">{if $user_is_locked}<img src="{$THEMES_DIR}/{$theme}/images/unlock_user.png" alt="" width="16" height="16" /><span>{#user_unlock_account#}</span></a>{else}<img src="{$THEMES_DIR}/{$theme}/images/lock_user.png" alt="" width="16" height="16" /><span>{#user_lock_account#}</span></a>{/if}</li>{/if}
{if $admin} <li><a href="index.php?mode=admin&amp;edit_user={$p_user_id}"><img src="{$THEMES_DIR}/{$theme}/images/edit_user.png" alt="" width="16" height="16" /><span>{#user_edit_account#}</span></a></li>{/if}
{if $admin} <li><a href="index.php?mode=admin&amp;delete_user={$p_user_id}"><img src="{$THEMES_DIR}/{$theme}/images/delete_user.png" alt="" width="16" height="16" /><span>{#user_delete_account#}</span></a></li>{/if}
</ul>
{/if}

{else}
<p class="caution">{#user_account_doesnt_exist#}</p>
{/if}
