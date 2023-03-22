{config_load file=$language_file section="user_show"}
{if $user_name}
{if $mod||$admin}
<ul class="adminmenu">
{if $p_user_type==0} <li>{if $user_is_locked}<a href="index.php?mode=user&amp;user_lock={$p_user_id}" class="unlock-user"><span class="icon"></span><span>{#user_unlock_account#}</span></a>{else}<a href="index.php?mode=user&amp;user_lock={$p_user_id}" class="lock-user"><span class="icon"></span><span>{#user_lock_account#}</span></a>{/if}</li>{/if}

{if $admin} <li><a href="index.php?mode=admin&amp;edit_user={$p_user_id}"><span class="icon"></span><span>{#user_edit_account#}</span></a></li>{/if}

{if $admin}{if $postings} <li><a href="index.php?mode=admin&amp;user_delete_all_entries={$p_user_id}"><span class="icon"></span><span>{#user_delete_all_entries#}</span></a></li>{/if}{/if}

{if $admin} <li><a href="index.php?mode=admin&amp;delete_user={$p_user_id}"><span class="icon"></span><span>{#user_delete_account#}</span></a></li>{/if}
</ul>
{/if}
<table class="settings below-adminmenu">
 <tbody>
  <tr>
   <th><strong>{#user_name#}</strong></th>
   <td><strong>{$user_name}</strong>{if $gender==1} <img src="{$THEMES_DIR}/{$theme}/images/gender-male.svg" alt="{#male#}" width="18" height="18" />{elseif $gender==2} <img src="{$THEMES_DIR}/{$theme}/images/gender-female.svg" alt="{#female#}" width="18" height="18" />{/if} <span class="xsmall">{if $p_user_type==2}({#admin#}){elseif $p_user_type==1}({#mod#}){else}<!--({#user#})-->{/if}</span>{if $user_is_locked} <span class="small user-locked">({#user_locked#})</span>{/if}</td>
  </tr>
{if $avatar}
  <tr>
   <th><strong>{#user_avatar#}</strong></th>
   <td><img class="avatar" src="{$avatar.image}" alt="{#avatar_img_alt#}" width="{$avatar.width}" height="{$avatar.height}" /></td>
  </tr>
{/if}
{if $user_hp || $user_email}
  <tr>
   <th><strong>{#user_hp_email#}</strong></th>
   <td>{if $user_hp=='' && $user_email==''}-{/if}{if $user_hp!=''}<a href="{$user_hp}"><img src="{$THEMES_DIR}/{$theme}/images/home.svg" alt="{#homepage#}" width="15" height="15" /></a> &nbsp;{/if}{if $user_email}<a href="index.php?mode=contact&amp;recipient_user_id={$p_user_id}" rel="nofollow"><img src="{$THEMES_DIR}/{$theme}/images/contact-email.svg" alt="{#email#}" width="15" height="15" /></a>{/if}</td>
  </tr>
{/if}
{if $user_real_name}
  <tr>
   <th><strong>{#user_real_name#}</strong></th>
   <td>{$user_real_name|default:'-'}</td>
  </tr>
{/if}
{if $birthdate}
  <tr>
   <th><strong>{#age_birthday#}</strong></th>
   <td>{$years} / {$birthdate.year}-{$birthdate.month}-{$birthdate.day}</td>
  </tr>
{/if}
{if $user_location}
  <tr>
   <th><strong>{#user_location#}</strong></th>
   <td>{$user_location|default:'-'}</td>
  </tr>
{/if}
  <tr>
   <th><strong>{#user_registered#}</strong></th>
   <td>{$user_registered}</td>
  </tr>
{if $user_last_login}
  <tr>
   <th><strong>{#user_last_login#}</strong></th>
   <td>{$user_last_login|default:'-'}</td>
  </tr>
{/if}
  <tr>
   <th><strong>{#user_logins#}</strong></th>
   <td>{$logins}</td>
  </tr>
  <tr>
   <th><strong>{#logins_per_day#}</strong></th>
   <td>{$logins_per_day}</td>
  </tr>
  <tr>
   <th><strong>{#user_postings#}</strong></th>
   <td>{$postings} ({$postings_percent}%){if $postings>0} <span class="small">[ <a href="index.php?mode=user&amp;action=show_posts&amp;id={$p_user_id}">{#show_postings_link#}</a> ]</span>{/if}</td>
  </tr>
  <tr>
   <th><strong>{#postings_per_day#}</strong></th>
   <td>{$postings_per_day}</td>
  </tr>
{if $last_posting_subject}
  <tr>
   <th><strong>{#last_posting#}</strong></th>
   <td>{if $last_posting_subject}{$last_posting_time|date_format:#time_format#}: <a id="user-last-posting" href="index.php?mode=entry&amp;id={$last_posting_id}">{$last_posting_subject}</a>{else}-{/if}</td>
  </tr>
{/if}
{if $profile}
  <tr>
   <th><strong>{#user_profile#}</strong></th>
   <td>{$profile|default:'-'}</td>
  </tr>
{/if}
 </tbody>
</table>
{else}
<p class="caution">{#user_account_doesnt_exist#}</p>
{/if}
