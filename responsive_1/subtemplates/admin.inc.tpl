{config_load file=$language_file section="admin"}
{if $action=='settings'}
<h2>{#subnav_settings#}</h2>
{if $saved}<p class="ok">{#settings_saved#}</p>{/if}
<form id="settings" action="index.php" method="post" accept-charset="{#charset#}">
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<div>
 <p class="label"><label for="id_forum_name">{#forum_name#}</label></p>
 <p class="description">{#forum_name_desc#}</p>
 <input type="text" name="forum_name" id="id_forum_name" value="{$edSet.forum_name|escape}" size="40">
</div>
<div>
 <p class="label"><label for="id_forum_description">{#forum_description#}</label></p>
 <p class="description">{#forum_description_desc#}</p>
 <input type="text" name="forum_description" id="id_forum_description" value="{$edSet.forum_description|escape}" size="40">
</div>
<div>
 <p class="label"><label for="id_forum_address">{#forum_address#}</label></p>
 <p class="description">{#forum_address_desc#}</p>
 <input type="text" name="forum_address" id="id_forum_address" value="{$edSet.forum_address|escape}" size="40">
</div>
<div>
 <p class="label"><label for="id_forum_email">{#forum_email#}</label>
 <p class="description">{#forum_email_desc#}</p>
 <input type="text" name="forum_email" id="id_forum_email" value="{$edSet.forum_email|escape}" size="40">
</div>
{if $languages}
<div>
 <p class="label">{#default_language#}</p>
 <p class="description">{#default_language_desc#}</p>
 <div class="radio-select">
  <ul>
{foreach from=$languages item=l}
   <li><input type="radio" name="language_file" id="id_{$l.title}" value="{$l.identifier}"{if $l.identifier==$edSet.language_file} checked="checked"{/if}><label for="id_{$l.title}">{$l.title}</label></li>
{/foreach}
  </ul>
 </div>
</div>
{/if}
{if $time_zones}
<div>
 <p class="label"><label for="id_time_zone">{#default_time_zone#}</label></p>
 <p class="description">{#default_time_zone_desc#}</p>
 <select id="id_time_zone" name="time_zone" size="1">
  <option value=""{if $edSet.time_zone==''} selected="selected"{/if}></option>
{foreach from=$time_zones item=tz}
  <option value="{$tz}"{if $tz==$edSet.time_zone} selected="selected"{/if}>{$tz}</option>
{/foreach}
 </select>
</div>
{else}
<div>
 <p class="label"><label for="id_time_difference">{#default_time_difference#}</label></p>
 <input id="id_time_difference" type="text" name="time_difference" value="{$edSet.time_difference}" size="5">
</div>
{/if}
{if $themes}
<div>
 <p class="label">{#default_theme#}</p>
 <p class="description">{#default_theme_desc#}</p>
 <div class="radio-select">
  <ul>
{foreach from=$themes item=t}
   <li><input type="radio" name="theme" id="id_{$t.title}" value="{$t.identifier}"{if $t.identifier==$edSet.theme} checked="checked"{/if}><label for="id_{$t.title}">{$t.title}</label></li>
{/foreach}
  </ul>
 </div>
</div>
{/if}
<div>
 <p class="label"><label for="id_home_url">{#home_link#}</label></p>
 <p class="description">{#home_link_desc#}</p>
 <input type="text" name="home_linkaddress" id="id_home_url" value="{$edSet.home_linkaddress|escape}" size="40">
</div>
<div>
 <p class="label"><label for="id_home_text">{#home_link_name#}</label></p>
 <p class="description">{#home_link_name_desc#}</p>
 <input type="text" name="home_linkname" id="id_home_text" value="{$edSet.home_linkname|escape}" size="40">
</div>
<div>
 <p class="label">{#terms_of_use_settings#}</p>
 <p class="description">{#terms_of_use_settings_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_terms_of_use_agreement-0" type="radio" name="terms_of_use_agreement" value="0"{if $edSet.terms_of_use_agreement==0} checked="checked"{/if}>
   <label for="id_terms_of_use_agreement-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_terms_of_use_agreement-1" type="radio" name="terms_of_use_agreement" value="1"{if $edSet.terms_of_use_agreement==1} checked="checked"{/if}>
   <label for="id_terms_of_use_agreement-1">{#yes#}</label></li>
  </ul>
 </div>
 <p class="label"><label for="id_terms_of_use_url">{#terms_of_use_url#}</label></p>
 <input id="id_terms_of_use_url" type="text" name="terms_of_use_url" value="{$edSet.terms_of_use_url|escape}" size="40">
</div>
<div>
 <p class="label">{#data_privacy_statement#}</p>
 <p class="description">{#data_privacy_statement_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_data_privacy_agreement-0" type="radio" name="data_privacy_agreement" value="0"{if $edSet.data_privacy_agreement==0} checked="checked"{/if}>
   <label for="id_data_privacy_agreement-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_data_privacy_agreement-1" type="radio" name="data_privacy_agreement" value="1"{if $edSet.data_privacy_agreement==1} checked="checked"{/if}>
   <label for="id_data_privacy_agreement-1">{#yes#}</label></li>
  </ul>
 </div>
 <p class="label"><label for="id_data_privacy_url">{#data_privacy_url#}</label></p>
 <input id="id_data_privacy_url" type="text" name="data_privacy_statement_url" value="{$edSet.data_privacy_statement_url|escape}" size="40">
</div>
<div>
 <p class="label">{#accession#}</p>
 <p class="description">{#accession_desc#}</p>
 <div class="radio-button-native">
  <ul>
   <li><input id="access_for_all" type="radio" name="access_for_users_only" value="0"{if $edSet.access_for_users_only==0} checked="checked"{/if}>
   <label for="access_for_all"><span class="icon"></span><span>{#all_users#}</span></label></li>
   <li><input id="access_for_users_only" type="radio" name="access_for_users_only" value="1"{if $edSet.access_for_users_only==1} checked="checked"{/if}>
   <label for="access_for_users_only"><span class="icon"></span><span>{#only_registered_users#}</span></label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label">{#post_permission#}</p>
 <p class="description">{#post_permission_desc#}</p>
 <div class="radio-button-native">
  <ul>
   <li><input id="entries_by_all" type="radio" name="entries_by_users_only" value="0"{if $edSet.entries_by_users_only==0} checked="checked"{/if}>
   <label for="entries_by_all"><span class="icon"></span><span>{#all_users#}</span></label></li>
   <li><input id="entries_by_users" type="radio" name="entries_by_users_only" value="1"{if $edSet.entries_by_users_only==1} checked="checked"{/if}>
   <label for="entries_by_users"><span class="icon"></span><span>{#only_registered_users#}</span></label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label">{#register_permission#}</p>
 <p class="description">{#register_permission_desc#}</p>
 <div class="radio-button-native">
  <ul>
   <li><input id="register_mode_0" type="radio" name="register_mode" value="0"{if $edSet.register_mode==0} checked="checked"{/if}>
   <label for="register_mode_0"><span class="icon"></span><span>{#register_self#}</span></label></li>
   <li><input id="register_mode_1" type="radio" name="register_mode" value="1"{if $edSet.register_mode==1} checked="checked"{/if}>
   <label for="register_mode_1"><span class="icon"></span><span>{#register_self_locked#}</span></label></li>
   <li><input id="register_mode_2" type="radio" name="register_mode" value="2"{if $edSet.register_mode==2} checked="checked"{/if}>
   <label for="register_mode_2"><span class="icon"></span><span>{#register_only_admin#}</span></label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label">{#user_area#}</p>
 <p class="description">{#user_area_desc#}</p>
 <div class="radio-select">
  <ul>
   <li><input id="public" type="radio" name="user_area_public" value="1"{if $edSet.user_area_public==1} checked="checked"{/if}><label for="public">{#public_accessible#}</label></li>
   <li><input id="not_public" type="radio" name="user_area_public" value="0"{if $edSet.user_area_public==0} checked="checked"{/if}><label for="not_public">{#accessible_reg_users_only#}</label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label"><label for="id_latest_postings">{#latest_postings#}</label></p>
 <p class="description">{#latest_postings_desc#}</p>
 <input type="text" name="latest_postings" id="id_latest_postings" value="{$edSet.latest_postings|escape}" size="5">
</div>
<div>
 <p class="label">{#tag_cloud#}</p>
 <p class="description">{#tag_cloud_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_tag_cloud-0" type="radio" name="tag_cloud" value="0"{if $edSet.tag_cloud==0} checked="checked"{/if}>
   <label for="id_tag_cloud-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_tag_cloud-1" type="radio" name="tag_cloud" value="1"{if $edSet.tag_cloud==1} checked="checked"{/if}>
   <label for="id_tag_cloud-1">{#yes#}</label></li>
  </ul>
 </div>
</div>
<div>
{assign var="settings_edit_delay" value=$edSet.edit_delay}
{assign var="input_edit_delay" value="<input type=\"text\" name=\"edit_delay\" value=\"$settings_edit_delay\" size=\"3\">"}
 <p class="label">{#edit_postings#}</p>
 <p class="description">{#edit_postings_desc#}</p>
 <div>
  <ul class="checkboxlist">
   <li><input id="id_show_if_edited" type="checkbox" name="show_if_edited" value="1"{if $edSet.show_if_edited==1} checked="checked"{/if}><label for="id_show_if_edited"><span class="icon"></span><span>{#show_if_edited#|replace:"[minutes]":$input_edit_delay}</span></label></li>
   <li><input id="id_dont_reg_edit_by_admin" type="checkbox" name="dont_reg_edit_by_admin" value="1"{if $edSet.dont_reg_edit_by_admin==1} checked="checked"{/if}><label for="id_dont_reg_edit_by_admin"><span class="icon"></span><span>{#dont_show_edit_by_admin#}</span></label></li>
   <li><input id="id_dont_reg_edit_by_mod" type="checkbox" name="dont_reg_edit_by_mod" value="1"{if $edSet.dont_reg_edit_by_mod==1} checked="checked"{/if}><label for="id_dont_reg_edit_by_mod"><span class="icon"></span><span>{#dont_show_edit_by_mod#}</span></label></li>
  </ul>
 </div>
</div>
<div>
{assign var="settings_edit_delay" value=$edSet.edit_delay}
{assign var="input_edit_delay" value="<input type=\"text\" name=\"edit_delay\" value=\"$settings_edit_delay\" size=\"3\">"}
 <p class="label">{#edit_own_postings#}</p>
 <div class="radio-button-native">
  <ul>
   <li><input id="id_edit_own_postings_all" type="radio" name="user_edit" value="2"{if $edSet.user_edit==2} checked="checked"{/if}>
   <label for="id_edit_own_postings_all"><span class="icon"></span><span>{#edit_own_postings_all#}</span></label></li>
   <li><input id="id_edit_own_postings_users" type="radio" name="user_edit" value="1"{if $edSet.user_edit==1} checked="checked"{/if}>
   <label for="id_edit_own_postings_users"><span class="icon"></span><span>{#edit_own_postings_users#}</span></label></li>
   <li><input id="id_edit_own_postings_disabled" type="radio" name="user_edit" value="0"{if $edSet.user_edit==0} checked="checked"{/if}>
   <label for="id_edit_own_postings_disabled"><span class="icon"></span><span>{#edit_own_postings_disabled#}</span></label></li>
  </ul>
 </div>
 <div>
{assign var="settings_edit_max_time_period" value=$edSet.edit_max_time_period}
{assign var="input_edit_max_time_period" value="<input type=\"text\" id=\"id_edit_max_time_period\" name=\"edit_max_time_period\" value=\"$settings_edit_max_time_period\" size=\"3\">"}
  <p>
   <label for="id_edit_max_time_period">{#edit_max_time_period#|replace:"[minutes]":$input_edit_max_time_period}</label></p>
{assign var="settings_edit_min_time_period" value=$edSet.edit_min_time_period}
{assign var="input_edit_min_time_period" value="<input type=\"text\" name=\"edit_min_time_period\" value=\"$settings_edit_min_time_period\" size=\"3\">"}
  <p>
   <input id="id_user_edit_if_no_replies" type="checkbox" name="user_edit_if_no_replies" value="1"{if $edSet.user_edit_if_no_replies==1} checked="checked"{/if}><label for="id_user_edit_if_no_replies"><span class="icon"></span><span>{#user_edit_if_no_replies#|replace:"[minutes]":$input_edit_min_time_period}</span></label>
  </p>
 </div>
</div>
<div>
 <p class="label">{#bbcode#}</p>
 <p class="description">{#bbcode_desc#}</p>
 <div>
  <ul class="checkboxlist">
   <li><input id="id_bbcode" type="checkbox" name="bbcode" value="1"{if $edSet.bbcode==1} checked="checked"{/if}><label for="id_bbcode"><span class="icon"></span><span>{#bbcodes_enabled#}</span></label></li>
   <li><input id="id_bbcode_img" type="checkbox" name="bbcode_img" value="1"{if $edSet.bbcode_img==1} checked="checked"{/if}><label for="id_bbcode_img"><span class="icon"></span><span>{#bbcodes_img_enabled#}</span></label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label">{#smilies#}</p>
 <p class="description">{#smilies_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_smilies-0" type="radio" name="smilies" value="0"{if $edSet.smilies==0} checked="checked"{/if}>
   <label for="id_smilies-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_smilies-1" type="radio" name="smilies" value="1"{if $edSet.smilies==1} checked="checked"{/if}>
   <label for="id_smilies-1">{#yes#}</label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label">{#enamble_avatars#}</p>
 <p class="description">{#enamble_avatars_desc#}</p>
 <div class="radio-button-native">
  <ul>
   <li><input id="id_avatars_profiles_postings" type="radio" name="avatars" value="2"{if $edSet.avatars==2} checked="checked"{/if}>
   <label for="id_avatars_profiles_postings"><span class="icon"></span><span>{#avatars_profiles_postings#}</span></label></li>
   <li><input id="id_avatars_profiles" type="radio" name="avatars" value="1"{if $edSet.avatars==1} checked="checked"{/if}>
   <label for="id_avatars_profiles"><span class="icon"></span><span>{#avatars_profiles#}</span></label></li>
   <li><input id="id_avatars_disabled" type="radio" name="avatars" value="0"{if $edSet.avatars==0} checked="checked"{/if}>
   <label for="id_avatars_disabled"><span class="icon"></span><span>{#disabled#}</span></label></li>
  </ul>
 </div>
{assign var="settings_avatar_max_width" value=$edSet.avatar_max_width}
{assign var="input_avatar_max_width" value="<input id=\"avatar_max_width\" type=\"text\" name=\"avatar_max_width\" value=\"$settings_avatar_max_width\" size=\"5\">"}
{assign var="settings_avatar_max_height" value=$edSet.avatar_max_height}
{assign var="input_avatar_max_height" value="<input type=\"text\" name=\"avatar_max_height\" value=\"$settings_avatar_max_height\" size=\"5\">"}
{assign var="settings_avatar_max_filesize" value=$edSet.avatar_max_filesize}
{assign var="input_avatar_max_filesize" value="<input type=\"text\" name=\"avatar_max_filesize\" value=\"$settings_avatar_max_filesize\" size=\"5\">"}
 <p>{#max_avatar_size#|replace:"[width]":$input_avatar_max_width|replace:"[height]":$input_avatar_max_height|replace:"[filesize]":$input_avatar_max_filesize}</p>
</div>
<div>
 <p class="label">{#upload_images#}</p>
 <p class="description">{#upload_images_desc#}</p>
 <div class="radio-button-native">
  <ul>
   <li><input id="id_upload_images_all" type="radio" name="upload_images" value="3"{if $edSet.upload_images==3} checked="checked"{/if}>
   <label for="id_upload_images_all"><span class="icon"></span><span>{#upload_enabled_all#}</span></label></li>
   <li><input id="id_upload_images_users" type="radio" name="upload_images" value="2"{if $edSet.upload_images==2} checked="checked"{/if}>
   <label for="id_upload_images_users"><span class="icon"></span><span>{#upload_enabled_users#}</span></label></li>
   <li><input id="id_upload_images_admins_mods" type="radio" name="upload_images" value="1"{if $edSet.upload_images==1} checked="checked"{/if}>
   <label for="id_upload_images_admins_mods"><span class="icon"></span><span>{#upload_enabled_admins_mods#}</span></label></li>
   <li><input id="id_upload_images_disabled" type="radio" name="upload_images" value="0"{if $edSet.upload_images==0} checked="checked"{/if}>
   <label for="id_upload_images_disabled"><span class="icon"></span><span>{#disabled#}</span></label></li>
  </ul>
 </div>
{assign var="settings_upload_max_width" value=$edSet.upload_max_img_width}
{assign var="input_upload_max_width" value="<input id=\"upload_max_img_width\" type=\"text\" name=\"upload_max_img_width\" value=\"$settings_upload_max_width\" size=\"5\">"}
{assign var="settings_upload_max_height" value=$edSet.upload_max_img_height}
{assign var="input_upload_max_height" value="<input type=\"text\" name=\"upload_max_img_height\" value=\"$settings_upload_max_height\" size=\"5\">"}
{assign var="settings_upload_max_img_size" value=$edSet.upload_max_img_size}
{assign var="input_upload_max_filesize" value="<input type=\"text\" name=\"upload_max_img_size\" value=\"$settings_upload_max_img_size\" size=\"5\">"}
 <p>{#max_upload_size#|replace:"[width]":$input_upload_max_width|replace:"[height]":$input_upload_max_height|replace:"[filesize]":$input_upload_max_filesize}</p>
</div>
<div>
 <p class="label">{#autolink#}</p>
 <p class="description">{#autolink_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_autolink-0" type="radio" name="autolink" value="0"{if $edSet.autolink==0} checked="checked"{/if}>
   <label for="id_autolink-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_autolink-1" type="radio" name="autolink" value="1"{if $edSet.autolink==1} checked="checked"{/if}>
   <label for="id_autolink-1">{#yes#}</label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label">{#count_views#}</p>
 <p class="description">{#count_views_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_count_views-0" type="radio" name="count_views" value="0"{if $edSet.count_views==0} checked="checked"{/if}>
   <label for="id_count_views-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_count_views-1" type="radio" name="count_views" value="1"{if $edSet.count_views==1} checked="checked"{/if}>
   <label for="id_count_views-1">{#yes#}</label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label">{#rss_feed#}</p>
 <p class="description">{#rss_feed_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_rss_feed-0" type="radio" name="rss_feed" value="0"{if $edSet.rss_feed==0} checked="checked"{/if}>
   <label for="id_rss_feed-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_rss_feed-1" type="radio" name="rss_feed" value="1"{if $edSet.rss_feed==1} checked="checked"{/if}>
   <label for="id_rss_feed-1">{#yes#}</label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label"><label for="id_threads_per_page">{#threads_per_page#}</label></p>
 <p class="description">{#threads_per_page_desc#}</p>
 <input type="text" name="threads_per_page" id="id_threads_per_page" value="{$edSet.threads_per_page|escape}" size="5">
</div>
<div>
 <p class="label">{#reset_read_state#}</p>
 <p class="description">{#reset_read_state_desc#}</p>
 <div class="radio-button-native">
 <ul>
   <li><input name="read_state_expiration_method" id="id_rs_no_reset" value="0" type="radio"{if not isset($edSet.read_state_expiration_method) or $edSet.read_state_expiration_method==0} checked="checked"{/if}>
   <label for="id_rs_no_reset"><span class="icon"></span><span>{#read_state_no_reset#}</span></label></li>
   <li><input name="read_state_expiration_method" id="id_rs_number_reset" value="1" type="radio"{if $edSet.read_state_expiration_method==1} checked="checked"{/if}>
   <label for="id_rs_number_reset"><span class="icon"></span><span>{#read_state_numbered_reset#}</span></label></li>
   <li><input name="read_state_expiration_method" id="id_rs_age_reset" value="2" type="radio"{if $edSet.read_state_expiration_method==2} checked="checked"{/if}>
   <label for="id_rs_age_reset">{#read_state_timeout_reset#}</label></li>
   <li><input name="read_state_expiration_method" id="id_rs_lock_reset" value="3" type="radio"{if $edSet.read_state_expiration_method==3} checked="checked"{/if}>
   <label for="id_rs_lock_reset"><span class="icon"></span><span>{#read_state_locktime_reset#}</span></label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label"><label for="id_read_state_expiration_value">{#read_state_value#}</label></p>
 <p class="description">{#read_state_value_desc#}</p>
 <input name="read_state_expiration_value" id="id_read_state_expiration_value" value="{$edSet.read_state_expiration_value|escape}" size="5" type="text">
</div>
<div>
 <p class="label"><label for="id_auto_lock_old_threads">{#auto_lock_old_threads#}</label></p>
 <p class="description">{#auto_lock_old_threads_desc#}</p>
 <input name="auto_lock_old_threads" id="id_auto_lock_old_threads" value="{$edSet.auto_lock_old_threads|escape}" type="text" size="5">
</div>
<div>
 <p class="label"><label for="id_count_users_online">{#count_users_online#}</label></p>
 <p class="description">{#count_users_online_desc#}</p>
 <input name="count_users_online" id="id_count_users_online" value="{$edSet.count_users_online|escape}" type="text" size="5">
</div>
<div>
 <p class="label">{#forum_enabled_marking#}</p>
 <p class="description">{#forum_enabled_desc#}</p>
 <div class="radio-toggle-switch">
  <ul>
   <li><input id="id_forum_enabled-0" type="radio" name="forum_enabled" value="0"{if $edSet.forum_enabled==0} checked="checked"{/if}>
   <label for="id_forum_enabled-0" class="toggle-actor">{#no#}</label></li>
   <li><input id="id_forum_enabled-1" type="radio" name="forum_enabled" value="1"{if $edSet.forum_enabled==1} checked="checked"{/if}>
   <label for="id_forum_enabled-1">{#yes#}</label></li>
  </ul>
 </div>
</div>
<div>
 <p class="label"><label for="id_forum_disabled_message">{#forum_disabled_message#}</label></p>
 <input id="id_forum_disabled_message" type="text" name="forum_disabled_message" value="{$edSet.forum_disabled_message|escape}" size="40">
</div>
<div>
 <p>
  <input id="clear_chache" type="checkbox" name="clear_cache" value="1">
  <label for="clear_chache"><span class="icon"></span><span>{#clear_chache#}</span></label>
 </p>
</div>
<p><button name="settings_submit" value="{#settings_submit_button#}">{#settings_submit_button#}</button></p>
</form>
<p><a class="stronglink" href="index.php?mode=admin&amp;action=advanced_settings">{#advanced_settings_link#}</a></p>
{elseif $action=='advanced_settings'}
{if $saved}<p class="ok">{#settings_saved#}</p>{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="return_to" value="advanced_settings">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<table class="settings">
 <tbody>
{section name=nr loop=$settings_sorted}
  <tr>
   <th><strong>{$settings_sorted[nr].key}</strong></t>
   <td><input type="text" name="{$settings_sorted[nr].key}" value="{$settings_sorted[nr].val|escape}"></td>
  </tr>
{/section}
 </tbody>
</table>
<p><button name="settings_submit" value="{#settings_submit_button#}">{#settings_submit_button#}</button></p>
</div>
</form>
{elseif $action=='categories'}
{if $entries_in_not_existing_categories>0}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div class="caution">
<input type="hidden" name="mode" value="admin">
<p>{#entries_in_not_ex_cat#}</p>
<p><input type="radio" name="entry_action" value="delete" checked="checked">{#entries_in_not_ex_cat_del#}<br>
<input type="radio" name="entry_action" value="move">{#entries_in_not_ex_cat_mov#}
<select class="kat" size="1" name="move_category">
{foreach key=key item=val from=$categories}
{if $key!=0}<option value="{$key}">{$val}</option>{/if}
{/foreach}
</select>
</p>
<p><button name="entries_in_not_existing_categories_submit" value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</div>
</form>
{/if}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
{if $categories_count>0}
<table id="sortable">
 <thead>
  <tr>
   <th>{#category_name#}</th>
   <th>{#category_accession#}</th>
   <th>{#category_topics#}</th>
   <th>{#category_entries#}</th>
   <th>&#160;</th>
  </tr>
 </thead>
 <tbody id="items">
{section name=row loop=$categories_list}
  <tr id="id_{$categories_list[row].id}">
   <td data-header="{#category_name#}" class="cell-subject" class="item">{$categories_list[row].name}</td>
   <td data-header="{#category_accession#}">{if $categories_list[row].accession==2}{#cat_accessible_admin_mod#}{elseif $categories_list[row].accession==1}{#cat_accessible_reg_users#}{else}{#cat_accessible_all#}{/if}</td>
   <td data-header="{#category_topics#}">{$categories_list[row].threads_in_category}</td>
   <td data-header="{#category_entries#}">{$categories_list[row].postings_in_category}</td>
   <td class="item-tools">
    <ul>
     <li><a href="index.php?mode=admin&amp;edit_category={$categories_list[row].id}" class="editor"><span class="icon"></span><span>{#edit#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;delete_category={$categories_list[row].id}" class="terminator"><span class="icon"></span><span>{#delete#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;move_up_category={$categories_list[row].id}" class="move-item-up"><span class="icon"></span><span>{#move_up#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;move_down_category={$categories_list[row].id}" class="move-item-down"><span class="icon"></span><span>{#move_down#}</span></a></li>
    </ul>
   </td>
  </tr>
{/section}
 </tbody>
</table>
{else}
<p>{#no_categories#}</p>
{/if}
<br>
<form action="index.php" method="post" class="normalform" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<p><label for="new_category" class="main">{#new_category#}</label><br>
<input id="new_category" type="text" name="new_category" size="25" value="{if $new_category}{$new_category}{/if}"></p>
<p><strong>{#category_accessible_by#}</strong><br>
<input id="cat_accessible_all" type="radio" name="accession" value="0"{if !$accession || acession==0} checked="checked"{/if}><label for="cat_accessible_all">{#cat_accessible_all#}</label><br>
<input id="cat_accessible_reg_users" type="radio" name="accession" value="1"{if acession==1} checked="checked"{/if}><label for="cat_accessible_reg_users">{#cat_accessible_reg_users#}</label><br>
<input id="cat_accessible_admin_mod" type="radio" name="accession" value="2"{if acession==2} checked="checked"{/if}><label for="cat_accessible_admin_mod">{#cat_accessible_admin_mod#}</label></p>
<p><button value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</div>
</form>
{elseif $action=='edit_category'}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
<form action="index.php" method="post" class="normalform" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="id" value="{$category_id}">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<p><strong>{#edit_category#}</strong><br>
<input type="text" name="category" value="{$edit_category}" size="25"></p>
<p><strong>{#category_accessible_by#}</strong><br>
<input id="cat_accessible_all" type="radio" name="accession" value="0"{if $edit_accession==0} checked="checked"{/if}><label for="cat_accessible_all">{#cat_accessible_all#}</label><br>
<input id="cat_accessible_reg_users" type="radio" name="accession" value="1"{if $edit_accession==1} checked="checked"{/if}><label for="cat_accessible_reg_users">{#cat_accessible_reg_users#}</label><br>
<input id="cat_accessible_admin_mod" type="radio" name="accession" value="2"{if $edit_accession==2} checked="checked"{/if}><label for="cat_accessible_admin_mod">{#cat_accessible_admin_mod#}</label></p>
<p><button name="edit_category_submit" value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</div>
</form>
{elseif $action=='delete_category'}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
<h2>{#delete_category_hl#|replace:"[category]":$category_name}</h2>
<p class="caution">{#caution#}</p>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<input type="hidden" name="category_id" value="{$category_id}">
<p><input type="radio" name="delete_mode" value="complete" checked="checked"> {#delete_category_compl#}</p></td>
<p><input type="radio" name="delete_mode" value="keep_entries"> {if $categories_count <= 1}{#del_cat_keep_entries#}
{else}{#del_cat_move_entries#}
<select class="kat" size="1" name="move_category">
<option value="0">&nbsp;</option>
{foreach key=key item=val from=$move_categories}
{if $key!=0}<option value="{$key}">{$val}</option>{/if}
{/foreach}
</select>
{/if}
<p><button name="delete_category_submit" value="{#delete_category_submit#}">{#delete_category_submit#}</button></p>
</div>
</form>
{elseif $action=='user'}
{if $new_user && !$send_error}<p class="ok">{#new_user_registered#|replace:"[name]":$new_user}</p>{elseif $new_user && $send_error}<p class="caution">{#new_user_reg_send_error#|replace:"[name]":$new_user}</p>{/if}
{*<p>{#num_registerd_users#|replace:"[number]":$total_users}</p>*}

<div id="usernav">
<div id="searchbox">
<form action="index.php" method="get" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="action" value="user">
<label for="searchfield">{#search_user#}</label>
<input id="searchfield" type="search" name="search_user" value="{if $search_user}{$search_user}{/if}" size="25">
<button>{#go#}</button>
</div>
</form>
</div>
{if $pagination}
<div id="userpagination">
<ul class="pagination pagination-index">
{if $pagination.previous}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $pagination.previous>1}&amp;page={$pagination.previous}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$item}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{$item}</a></li>{/if}
{/foreach}
{if $pagination.next}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$pagination.next}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#next_page_link#}</a></li>{/if}
</ul>
</div>
{/if}
</div>
<ul class="adminmenu">
<li><a href="index.php?mode=admin&amp;action=register"><span class="icon"></span><span>{#add_user#}</span></a></li>
<li><a href="index.php?mode=admin&amp;action=reset_tou"><span class="icon"></span><span>{#reset_terms_of_use#}</span></a></li>
<li><a href="index.php?mode=admin&amp;action=reset_dps"><span class="icon"></span><span>{#reset_data_privacy_statement#}</span></a></li>
<li><a href="index.php?mode=admin&amp;action=email_list"><span class="icon"></span><span>{#email_list#}</span></a></li>
<li><a href="index.php?mode=admin&amp;action=clear_userdata"><span class="icon"></span><span>{#clear_userdata#}</span></a></li>
</ul>
{if $result_count > 0}
{if $no_users_in_selection}<p class="caution below-adminmenu">{#no_users_in_sel#}</p>{/if}
<form action="index.php" method="post" accept-charset="{#charset#}" class="below-adminmenu">
<div>
<input type="hidden" name="mode" value="admin">
<table>
 <thead>
  <tr>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_name#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_name&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_name" && $descasc=="DESC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_name&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_name" && $descasc=="ASC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_email#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_email&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_email" && $descasc=="DESC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_email&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_email" && $descasc=="ASC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_type#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_type&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_type" && $descasc=="ASC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_type&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_type" && $descasc=="DESC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_registered#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=registered&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="registered" && $descasc=="DESC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=registered&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="registered" && $descasc=="ASC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_logins#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=logins&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="logins" && $descasc=="DESC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=logins&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="logins" && $descasc=="ASC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#last_login#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=last_login&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="last_login" && $descasc=="DESC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=admin&amp;action=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=last_login&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="last_login" && $descasc=="ASC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>&nbsp;</th>
  </tr>
 </thead>
 <tbody>
{section name=row loop=$userdata}
  <tr>
   <td class="cell-subject"><input type="checkbox" name="selected[]" value="{$userdata[row].user_id}" id="cb_{$userdata[row].user_id}"><label for="cb_{$userdata[row].user_id}"><span class="icon"></span>{$userdata[row].user_name}</label></td>
   <td data-header="{#user_email#}"><span class="value"><a href="mailto:{$userdata[row].user_email}">{$userdata[row].user_email}</a></span></td>
   <td data-header="{#user_type#}"><span class="value">{if $userdata[row].user_type==2}{#admin#}{elseif $userdata[row].user_type==1}{#mod#}{else}{#user#}{/if}</span></td>
   <td data-header="{#user_registered#}"><span class="value">{$userdata[row].registered_time|date_format:#time_format#}</span></td>
   <td data-header="{#user_logins#}"><span class="value">{$userdata[row].logins}</span></td>
   <td data-header="{#last_login#}"><span class="value">{if $userdata[row].logins > 0}{$userdata[row].last_login_time|date_format:#time_format#}{else}&nbsp;{/if}</span></td>
   <td class="item-tools">
    <ul>
     <li>{if $userdata[row].user_type>0}{if $userdata[row].user_lock==0}<span class="replace-tool user-not-locked"><span class="icon"></span><span>{#unlocked#}</span>{else}<span class="user-locked"><span class="icon"></span><span>{#locked#}</span>{/if}{elseif $userdata[row].user_lock==0}<a href="index.php?mode=admin&amp;user_lock={$userdata[row].user_id}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;page={$page}&amp;order={$order}&amp;descasc={$descasc}" class="user-not-locked"><span class="icon"></span><span>{#unlocked#}</span></a>{else}<a href="index.php?mode=admin&amp;user_lock={$userdata[row].user_id}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;page={$page}&amp;order={$order}&amp;descasc={$descasc}" class="user-locked"><span class="icon"></span><span>{#locked#}</span></a>{/if}</li>
     <li>{if $userdata[row].inactive}<span class="replace-tool user-inactive"><span class="icon"></span>{#user_inactive#}</span>{else}<a href="index.php?mode=user&amp;show_user={$userdata[row].user_id}" class="user-profile"><span class="icon"></span><span>{#user_profile#}</span></a>{/if}</li>
     <li><a href="index.php?mode=admin&amp;edit_user={$userdata[row].user_id}" class="editor"><span class="icon"></span><span>{#edit#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;delete_user={$userdata[row].user_id}" class="terminator"><span class="icon"></span><span>{#delete#}</span></a></li>
    </ul>
   </td>
  </tr>
{/section}
 </tbody>
</table>
<div id="admin-usernav-bottom">

<div id="selectioncontrols">
<p><button name="delete_selected_users" value="{#delete_selected_users#}">{#delete_selected_users#}</button></p>
</div>

<div id="userpagination">
{if $pagination}
<ul class="pagination">
{if $pagination.previous}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $pagination.previous>1}&amp;page={$pagination.previous}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$item}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{$item}</a></li>{/if}
{/foreach}
{if $pagination.next}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$pagination.next}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#next_page_link#}</a></li>{/if}
</ul>
{else}
&nbsp;
{/if}
</div>

</div>
</div>
</form>
{else}
<p><em>{#no_users#}</em></p>
{/if}
{elseif $action=='edit_user'}
{config_load file=$language_file section="user_edit"}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error|replace:"[profile_length]":$profil_length|replace:"[profile_maxlength]":$settings.profile_maxlength|replace:"[signature_length]":$signature_length|replace:"[signature_maxlength]":$settings.signature_maxlength|replace:"[word]":$word}</li>
{/section}
</ul>
</section>
{/if}
{if $inactive}<p class="caution">{#caution#}</p><p>{#activate_note#} <a href="index.php?mode=admin&amp;activate={$edit_user_id}">{#activate_link#}</a></p>{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<input type="hidden" name="edit_user_id" value="{$edit_user_id}">
<table class="settings">
 <tbody>
  <tr>
   <th><strong>{#edit_user_name#}</strong></th>
   <td><input type="text" size="24" name="edit_user_name" value="{$edit_user_name}" maxlength="{$settings.name_maxlength}"></td>
  </tr>
{if $avatar}
  <tr>
   <th><strong>{#edit_user_avatar#}</strong></th>
   <td>
    <p class="userdata">
     <img src="{$avatar.image}" alt="{#avatar_img_alt#}" width="{$avatar.width}" height="{$avatar.height}"><br>
     <input id="delete_avatar" type="checkbox" name="delete_avatar" value="1"{if $delete_avatar=="1"} checked="checked"{/if}><label for="delete_avatar"><span class="icon"></span><span>{#delete_avatar#}</span></label>
    </p>
   </td>
  </tr>
{/if}
  <tr>
   <th><strong>{#edit_user_type#}</strong></th>
   <td>
    <div class="radio-select">
     <ul>
      <li><input id="edit_user_type_0" type="radio" name="edit_user_type" value="0"{if $edit_user_type==0} checked="checked"{/if}><label for="edit_user_type_0">{#user#}</label></li>
      <li><input id="edit_user_type_1" type="radio" name="edit_user_type" value="1"{if $edit_user_type==1} checked="checked"{/if}><label for="edit_user_type_1">{#mod#}</label></li>
      <li><input id="edit_user_type_2" type="radio" name="edit_user_type" value="2"{if $edit_user_type==2} checked="checked"{/if}><label for="edit_user_type_2">{#admin#}</label></li>
     </ul>
    </div>
   </td>
  </tr>
  <tr>
   <th><strong>{#edit_user_email#}</strong></th>
   <td>
    <input type="text" size="40" name="user_email" value="{$user_email}"><br>
    <span class="small"><input id="email_contact" type="checkbox" name="email_contact" value="1"{if $email_contact==1} checked="checked"{/if}><label for="email_contact"><span class="icon"></span><span>{#edit_user_email_contact#}</span></label></span>
   </td>
  </tr>
  <tr>
   <th><strong>{#edit_user_hp#}</strong></th>
   <td><input type="text" size="40" name="user_hp" value="{$user_hp}" maxlength="{$settings.hp_maxlength}"></td>
  </tr>
  <tr>
   <th><strong>{#edit_user_real_name#}</strong></th>
   <td><input type="text" size="40" name="user_real_name" value="{$user_real_name}" maxlength="{$settings.name_maxlength}"></td>
  </tr>
  <tr>
   <th><strong>{#edit_user_gender#}</strong></th>
   <td>
    <div class="radio-select">
     <ul>
      <li><input id="no-gender" type="radio" name="user_gender" value="0"{if $user_gender=="0"} checked="checked"{/if}><label for="no-gender">{#gender_not_specified#}</label></li>
      <li><input id="male" type="radio" name="user_gender" value="1"{if $user_gender=="1"} checked="checked"{/if}><label for="male">{#male#}</label></li>
      <li><input id="female" type="radio" name="user_gender" value="2"{if $user_gender=="2"} checked="checked"{/if}><label for="female">{#female#}</label></li>
     </ul>
    </div>
   </td>
  </tr>
  <tr>
   <th><strong>{#edit_user_birthday#}</strong></th>
   <td><input type="date" size="12" name="user_birthday" value="{$user_birthday}"> <span class="small">({#birthday_format#})</span></td>
  </tr>
  <tr>
   <th><strong>{#edit_user_location#}</strong></th>
   <td><input type="text" size="40" name="user_location" value="{$user_location}" maxlength="{$settings.location_maxlength}"></td>
  </tr>
  <tr>
   <th><strong>{#edit_user_profile#}</strong></th>
   <td><textarea cols="65" rows="5" name="profile">{$profile}</textarea></td>
  </tr>
  <tr>
   <th><strong>{#edit_user_signature#}</strong></th>
   <td><textarea cols="65" rows="5" name="signature">{$signature}</textarea></td>
  </tr>
{if $languages}
  <tr>
   <th><strong><label for="user_language">{#edit_user_language#}</label></strong></th>
   <td>
    <select id="user_language" name="user_language" size="1">
     <option value=""{if $user_language==''} selected="selected"{/if}></option>
{foreach from=$languages item=l}
     <option value="{$l.identifier}"{if $l.identifier==$user_language} selected="selected"{/if}>{$l.title}</option>
{/foreach}
    </select>
   </td>
  </tr>
{/if}
  <tr>
   <th><strong>{#edit_user_time_zone#}</strong></th>
   <td>
{if $time_zones}
    <select id="user_time_zone" name="user_time_zone" size="1">
     <option value=""{if $user_time_zone==''} selected="selected"{/if}></option>
{foreach from=$time_zones item=tz}
     <option value="{$tz}"{if $tz==$user_time_zone} selected="selected"{/if}>{$tz}</option>
{/foreach}
    </select>
{/if}
    <p>
     <span class="small"><label for="user_time_difference">{#edit_user_time_difference#}</label></span><br>
     <input id="user_time_difference" type="text" size="6" name="user_time_difference" value="{$user_time_difference}" maxlength="6">
    </p>
   </td>
  </tr>
{if $themes}
  <tr>
   <th><strong><label for="user_theme">{#edit_user_theme#}</label></strong></th>
   <td>
    <select id="user_theme" name="user_theme" size="1">
     <option value=""{if $user_theme==''} selected="selected"{/if}></option>
{foreach from=$themes item=t}
     <option value="{$t.identifier}"{if $t.identifier==$user_theme} selected="selected"{/if}>{$t.title}</option>
{/foreach}
    </select>
   </td>
  </tr>
{/if}
{if $edit_user_type==2 || $edit_user_type==1}
  <tr>
   <th><strong>{#edit_user_notification#}</strong></th>
   <td>
    <input id="new_posting_notification" type="checkbox" name="new_posting_notification" value="1"{if $new_posting_notification=="1"} checked="checked"{/if}><label for="new_posting_notification"><span class="icon"></span><span>{#admin_mod_notif_posting#}</span></label><br>
    <input id="new_user_notification" type="checkbox" name="new_user_notification" value="1"{if $new_user_notification=="1"} checked="checked"{/if}><label for="new_user_notification"><span class="icon"></span><span>{#admin_mod_notif_register#}</span></label>
   </td>
  </tr>
{/if}
 </tbody>
</table>
<p><button name="edit_user_submit" value="{#userdata_submit_button#}">{#userdata_submit_button#}</button></p>
</div>
</form>
{elseif $action=='delete_users'}
<p class="caution">{#caution#}</p>
<p>{if $selected_users_count>1}{#delete_users_confirmation#}{else}{#delete_user_confirmation#}{/if}</p>
<ul>
{section name=nr loop=$selected_users}
<li><a href="index.php?mode=user&amp;show_user={$selected_users[nr].id}"><strong>{$selected_users[nr].name}</strong></a></li>
{/section}
</ul>
<br>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
{section name=nr loop=$selected_users}
<input type="hidden" name="selected_confirmed[]" value="{$selected_users[nr].id}">
{/section}
<p><button name="delete_confirmed" value="{#delete_submit#}">{#delete_submit#}</button></p>
</div>
</form>
{elseif $action=='user_delete_entries'}
<p class="caution">{#caution#}</p>
<p>{#delete_entries_of_user_confirm#|replace:"[user]":$user_delete_entries['user']}</p>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<input type="hidden" name="user_delete_entries" value="{$user_delete_entries.id}">
<p><button name="delete_confirmed" value="{#delete_submit#}">{#delete_submit#}</button></p>
</div>
</form>
{elseif $action=='register'}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<p><label for="ar_username" class="main">{#register_username#}</label><br>
<input id="ar_username" type="text" size="25" name="ar_username" value="{$ar_username|default:''}" maxlength="{$settings.name_maxlength}"></p>
<p><label for="ar_email" class="main">{#register_email#}</label><br>
<input id="ar_email" type="text" size="25" name="ar_email" value="{$ar_email|default:''}" maxlength="{$settings.email_maxlength}"></p>
<p><label for="ar_pw" class="main">{#register_pw#}</label><br>
<input id="ar_pw" type="password" size="25" name="ar_pw" maxlength="50"></p>
<p><label for="ar_pw_conf" class="main">{#register_pw_conf#}</label><br>
<input id="ar_pw_conf" type="password" size="25" name="ar_pw_conf" maxlength="50"></p>
<p><input id="ar_send_userdata" type="checkbox" name="ar_send_userdata" value="true"{if $ar_send_userdata} checked="checked"{/if}> <label for="ar_send_userdata"><span class="icon"></span><span>{#register_send_userdata#}</span></label></p>
<p><button name="register_submit" value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</div>
</form>
<p class="small">{#register_exp#}</p>
{elseif $action=='smilies'}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
<ul class="adminmenu">
<li>{if $settings.smilies==1}<a href="index.php?mode=admin&amp;disable_smilies=true"><span class="icon"></span><span>{#disable_smilies#}</span></a>{else}<a href="index.php?mode=admin&amp;enable_smilies=true"><span class="icon"></span><span>{#enable_smilies#}</span></a>{/if}</li>
</ul>
{if $settings.smilies==1}
<table id="sortable" class="below-adminmenu">
 <thead>
  <tr>
   <th>{#smiley_image#}</th>
   <th>{#smiley_codes#}</th>
   <th>{#smiley_title#}</th>
   <th>&#160;</th>
  </tr>
 </thead>
 <tbody id="items">
{section name=row loop=$smilies}
  <tr id="id_{$smilies[row].id}">
   <td class="cell-subject"><img src="images/smilies/{$smilies[row].file}" alt="{$smilies[row].code_1}"></td>
   <td data-header="{#smiley_codes#}">{$smilies[row].codes}</td>
   <td data-header="{#smiley_title#}">{$smilies[row].title}</td>
   <td class="item-tools">
    <ul>
     <li><a href="index.php?mode=admin&amp;edit_smiley={$smilies[row].id}" class="editor"><span class="icon"></span><span>{#edit#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;delete_smiley={$smilies[row].id}" class="terminator"><span class="icon"></span><span>{#delete#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;move_up_smiley={$smilies[row].id}" class="move-item-up"><span class="icon"></span><span>{#move_up#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;move_down_smiley={$smilies[row].id}" class="move-item-down"><span class="icon"></span><span>{#move_down#}</span></a></li>
    </ul>
   </td>
  </tr>
{/section}
 </tbody>
</table>
{if $smiley_files}
<form action="index.php" method="post" class="normalform below-adminmenu" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<table>
 <thead>
  <tr>
   <th><label for="add_smiley">{#add_smiley#}</label></th>
   <th><label for="smiley_code">{#add_smiley_code#}</label></th>
   <th>&nbsp;</th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td>
    <select id="add_smiley" name="add_smiley" size="1">
{section name=nr loop=$smiley_files}
     <option value="{$smiley_files[nr]}">{$smiley_files[nr]}</option>
{/section}
    </select>
   </td>
   <td><input id="smiley_code" type="text" name="smiley_code" size="10"></td>
   <td><button value="{#submit_button_ok#}">{#submit_button_ok#}</button></td>
  </tr>
 </tbody>
</table>
</div>
</form>
{else}
<p><em>{#no_other_smilies_in_folder#}</em></p>
{/if}
{else}
<p><em>{#smilies_disabled#}</em></p>
{/if}
{elseif $action=='spam_protection'}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
{if $saved}<p class="ok">{#spam_protection_saved#}</p>{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<table class="settings">
 <tbody>
  <tr>
   <th><strong>{#captcha#}</strong>
    <span class="description">{#captcha_desc#}{if !$graphical_captcha_available || !$font_available}<br>{#captcha_graphical_desc#}{/if}</span></th>
   <td>
    <div class="radio-select">
     <h3>{#captcha_posting#}</h3>
     <ul>
      <li><input id="captcha_posting_0" type="radio" name="captcha_posting" value="0"{if $captcha_posting==0} checked="checked"{/if}><label for="captcha_posting_0">{#captcha_disabled#}</label></li>
      <li><input id="captcha_posting_1" type="radio" name="captcha_posting" value="1"{if $captcha_posting==1} checked="checked"{/if}><label for="captcha_posting_1">{#captcha_mathematical#}</label></li>
      <li><input id="captcha_posting_2" type="radio" name="captcha_posting" value="2"{if $captcha_posting==2} checked="checked"{/if}{if !$graphical_captcha_available} disabled="disabled"{/if}><label for="captcha_posting_2"{if !$graphical_captcha_available} class="unavailable"{/if}>{#captcha_graphical#}{if !$graphical_captcha_available || !$font_available}<sup>*</sup>{/if}</label></li>
     </ul>
    </div>
    <div class="radio-select">
     <h3>{#captcha_email#}</h3>
     <ul>
      <li><input id="captcha_email_0" type="radio" name="captcha_email" value="0"{if $captcha_email==0} checked="checked"{/if}><label for="captcha_email_0">{#captcha_disabled#}</label></li>
      <li><input id="captcha_email_1" type="radio" name="captcha_email" value="1"{if $captcha_email==1} checked="checked"{/if}><label for="captcha_email_1">{#captcha_mathematical#}</label></li>
      <li><input id="captcha_email_2" type="radio" name="captcha_email" value="2"{if $captcha_email==2} checked="checked"{/if}{if !$graphical_captcha_available} disabled="disabled"{/if}><label for="captcha_email_2"{if !$graphical_captcha_available} class="unavailable"{/if}>{#captcha_graphical#}{if !$graphical_captcha_available || !$font_available}<sup>*</sup>{/if}</label></li>
     </ul>
    </div>
    <div class="radio-select">
     <h3>{#captcha_register#}</h3>
     <ul>
      <li><input id="captcha_register_0" type="radio" name="captcha_register" value="0"{if $captcha_register==0} checked="checked"{/if}><label for="captcha_register_0">{#captcha_disabled#}</label></li>
      <li><input id="captcha_register_1" type="radio" name="captcha_register" value="1"{if $captcha_register==1} checked="checked"{/if}><label for="captcha_register_1">{#captcha_mathematical#}</label></li>
      <li><input id="captcha_register_2" type="radio" name="captcha_register" value="2"{if $captcha_register==2} checked="checked"{/if}{if !$graphical_captcha_available} disabled="disabled"{/if}><label for="captcha_register_2"{if !$graphical_captcha_available} class="unavailable"{/if}>{#captcha_graphical#}{if !$graphical_captcha_available || !$font_available}<sup>*</sup>{/if}</label></li>
     </ul>
    </div>
 {if !$graphical_captcha_available || !$font_available}
    <p class="xsmall"><sup>*</sup> {if !$graphical_captcha_available}{#gr_captcha_not_available#}{elseif !$font_available}{#gr_captcha_no_font#}{/if}</p>
 {/if}
   </td>
  </tr>
  <tr>
   <th><strong>{#stop_forum_spam#}</strong>
    <span class="description">{#stop_forum_spam_desc#}</span></th>
   <td><input id="stop_forum_spam" type="checkbox" name="stop_forum_spam" value="1"{if $stop_forum_spam==1} checked="checked"{/if}><label for="stop_forum_spam"><span class="icon"></span><span>{#stop_forum_spam_enable#}</span></label></td>
  </tr>
  <tr>
   <th><strong>{#bad_behavior#}</strong>
    <span class="description">{#bad_behavior_desc#}</span></th>
   <td><input id="bad_behavior" type="checkbox" name="bad_behavior" value="1"{if $bad_behavior==1} checked="checked"{/if}><label for="bad_behavior"><span class="icon"></span><span>{#bad_behavior_enable#}</span></label></td>
  </tr>
  <tr>
   <th><strong>{#akismet#}</strong>
    <span class="description">{#akismet_desc#}</span></th>
   <td>
    <p>{#akismet_key#}<br><input type="text" name="akismet_key" value="{$akismet_key}" size="25"></p>
    <p>
     <input id="akismet_entry_check" type="checkbox" name="akismet_entry_check" value="1"{if $akismet_entry_check==1} checked="checked"{/if}><label for="akismet_entry_check"><span class="icon"></span><span>{#akismet_entry#}</span></label><br>
     <input id="akismet_mail_check" type="checkbox" name="akismet_mail_check" value="1"{if $akismet_mail_check==1} checked="checked"{/if}><label for="akismet_mail_check"><span class="icon"></span><span>{#akismet_mail#}</span></label><br>
     <input id="akismet_check_registered" type="checkbox" name="akismet_check_registered" value="1"{if $akismet_check_registered==1} checked="checked"{/if}><label for="akismet_check_registered"><span class="icon"></span><span>{#akismet_registered#}</span></label>
    </p>
    <p>
     <input id="save_spam" type="checkbox" name="save_spam" value="1"{if $save_spam==1} checked="checked"{/if}><label for="save_spam"><span class="icon"></span><span>{#akismet_save_spam#}</span></label><br>{#akismet_auto_delete_spam#}<br>
     <input type="text" name="auto_delete_spam" value="{$auto_delete_spam}" size="5">
    </p>
   </td>
  </tr>
  <tr>
   <th><strong>{#not_accepted_words#}</strong>
    <span class="description">{#not_accepted_words_desc#}</span></th>
   <td><textarea name="not_accepted_words" cols="35" rows="10">{$not_accepted_words}</textarea></td>
  </tr>
  <tr>
   <th><strong>{#banned_ips#}</strong>
    <span class="description">{#banned_ips_desc#}</span></th>
   <td><textarea name="banned_ips" cols="35" rows="5">{$banned_ips}</textarea></td>
  </tr>
  <tr>
   <th><strong>{#banned_user_agents#}</strong>
    <span class="description">{#banned_user_agents_desc#}</span></th>
   <td><textarea name="banned_user_agents" cols="35" rows="5">{$banned_user_agents}</textarea></td>
  </tr>
 </tbody>
</table>
<p><button name="spam_protection_submit" value="{#spam_protection_submit#}">{#spam_protection_submit#}</button></p>
</div>
</form>
{elseif $action=='reset_uninstall'}
<p class="caution">{#caution#}</p>
{if $errors}{include file="$theme/subtemplates/errors.inc.tpl"}{/if}
<h2>{#reset_forum#}</h2>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<p><input id="delete_postings" type="checkbox" name="delete_postings" value="true"><label for="delete_postings"> <span class="icon"></span><span>{#delete_postings#}</span></label></p>
<p><input id="delete_userdata" type="checkbox" name="delete_userdata" value="true"><label for="delete_userdata"> <span class="icon"></span><span>{#delete_userdata#}</span></label></p>
<p>{#admin_confirm_password#}<br>
<input type="password" size="20" name="confirm_pw"> <button name="reset_forum_confirmed" value="{#reset_forum_submit#}">{#reset_forum_submit#}</button></p>
</div>
</form>

<hr>

<h2>{#uninstall_forum#}</h2>
<p>{#uninstall_forum_exp#}</p>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<p>{#reset_uninstall_conf_pw#}<br>
<input type="password" size="20" name="confirm_pw"> <button name="uninstall_forum_confirmed" value="{#uninstall_forum_submit#}">{#uninstall_forum_submit#}</button></p>
</div>
</form>
{elseif $action=='backup'}
{if $errors}{include file="$theme/subtemplates/errors.inc.tpl"}{/if}
{if $message}<p class="ok">{$smarty.config.$message}</p>{/if}
{if $backup_files}
<form id="selectform" action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="delete_backup_files_confirm" value="">
<table>
 <thead>
  <tr>
   <th>&#160;</th>
   <th>{#backup_file#}</th>
   <th>{#backup_date#}</th>
   <th>{#backup_size#}</th>
   <th>&#160;</th>
  </tr>
 </thread>
 <tbody>
{foreach from=$backup_files item=file}
  <tr>
   <td><input type="checkbox" name="delete_backup_files[]" value="{$file.file}"></td>
   <td>{$file.file}</td>
   <td data-header="{#backup_date#}">{$file.date|date_format:#time_format#}</td>
   <td data-header="{#backup_size#}">{$file.size}</td>
   <td class="item-tools">
    <ul>
     <li><a href="index.php?mode=admin&amp;download_backup_file={$file.file}" class="download-backup"><span class="icon"></span><span>{#download_backup_file#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;restore={$file.file}" class="restore-backup"><span class="icon"></span><span>{#restore#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;delete_backup_files[]={$file.file}" onclick="return delete_backup_confirm(this, '{$smarty.config.delete_backup_file_confirm|escape:"url"}')" class="backup-terminator"><span class="icon"></span><span>{#delete_backup_file#}</span></a></li>
    </ul>
   </td>
  </tr>
{/foreach}
 </tbody>
</table>
<div id="selectioncontrols">
 <button name="delete_selected_backup_files" value="{#delete_selected#}">{#delete_selected#}</button></div>
</div>
</form>
{else}
<p class="caution">{#caution#}</p>
<p>{#backup_note#}</p>
<!--<p><em>No backup files available.</em></p>-->
{/if}
<ul class="adminmenu">
 <li><a href="index.php?mode=admin&amp;create_backup=0" class="backup complete"><span class="icon"></span><span>{#create_backup_complete#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=1" class="backup entries"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_entries#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=2" class="backup userdata"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_userdata#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=3" class="backup settings"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_settings#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=4" class="backup categories"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_categories#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=5" class="backup pages"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_pages#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=6" class="backup smilies"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_smilies#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=7" class="backup banlists"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_banlists#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=8" class="backup bookmarks"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_bookmarks#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=9" class="backup read-status"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_read_status#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=10" class="backup temp-infos"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_temp_infos#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=11" class="backup subscriptions"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_subscriptions#}</span></a></li>
 <li><a href="index.php?mode=admin&amp;create_backup=12" class="backup tags"><span class="icon"></span><span>{#only_create_backup_of#} {#backup_tags#}</span></a></li>
</ul>
{elseif $action=='delete_backup_files_confirm'}
<p class="caution">{#caution#}</p>
<p>{if $file_number==1}{#delete_backup_file_confirm#}{else}{#delete_backup_files_confirm#}{/if}</p>
<ul>
{section name=nr loop=$delete_backup_files}
<li>{$delete_backup_files[nr]}</li>
{/section}
</ul>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
{section name=nr loop=$delete_backup_files}
<input type="hidden" name="delete_backup_files[]" value="{$delete_backup_files[nr]}">
{/section}
<p><button name="delete_backup_files_confirm" value="{#delete_backup_submit#}">{#delete_backup_submit#}</button></p>
</div>
</form>
{elseif $action=='restore'}
<p class="caution">{#caution#}</p>
<p>{#restore_confirm#}</p>
<p><strong>{$backup_file}</strong> - {$backup_file_date|date_format:#time_format#}</p>
{if $safe_mode_warning}<p class="caution">{#restore_safe_mode_warning#}</p>
<p class="caution">{#restore_safe_mode_note#}</p>{/if}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=error loop=$errors}
{assign var="error" value=$errors[error]}
<li>{$smarty.config.$error|replace:"[mysql_error]":$mysql_error}</li>
{/section}
</ul>
</section>
{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="backup_file" value="{$backup_file}">
<p>{#admin_confirm_password#}<br><input type="password" name="restore_password" size="25"></p>
<p><button name="restore_submit" value="{#restore_submit#}" onclick="document.getElementById('throbber-submit').style.visibility = 'visible';">{#restore_submit#}</button> <img id="throbber-submit" style="visibility:hidden;" src="{$THEMES_DIR}/{$theme}/images/throbber.svg" alt="" width="16" height="16"></p>
</div>
</form>
{elseif $action=='update'}
<p style="margin-bottom:25px;"><span style="background:yellow; padding:5px;">{#update_current_version#|replace:"[version]":$settings.version}</span></p>

<h3>{#update_instructions_hl#}</h3>
<ul>
{foreach from=$smarty.config.update_instructions item=instruction}
<li>{$instruction}</li>
{/foreach}
</ul>

{if $errors}{include file="$theme/subtemplates/errors.inc.tpl"}{/if}
{if $message}<p class="ok">{$smarty.config.$message}</p>{/if}
{if $update_files}
<h3>{#update_available_files#}</h3>
<ul>
{foreach from=$update_files item=file}
<li><a href="index.php?mode=admin&amp;run_update={$file.filename}">{$file.filename}</a></li>
{/foreach}
</ul>
{else}
<p><em>{#update_no_files_available#}</em></p>
{/if}
{elseif $action=='run_update'}
<p class="caution">{#caution#}</p>
<p>{#update_confirm#}</p>
<p><strong>{$update_file}</strong>{if $update_from_version && $update_to_version} {#update_file_details#|replace:"[update_from_version]":$update_from_version|replace:"[update_to_version]":$update_to_version}{/if}</p>
<p style="color:red;font-weight:bold;">{#update_note#}</p>
{if $errors}{include file="$theme/subtemplates/errors.inc.tpl"}{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="update_file_submit" value="{$update_file}">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<p>{#admin_confirm_password#}<br><input type="password" name="update_password" size="25"></p>
<p><button name="update_submit" value="{#update_submit#}" onclick="document.getElementById('throbber-submit').style.visibility = 'visible';">{#update_submit#}</button> <img id="throbber-submit" style="visibility:hidden;" src="{$THEMES_DIR}/{$theme}/images/throbber.svg" alt="" width="16" height="16"></p>
</div>
</form>
{elseif $action=='update_done'}
{if $update_errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$update_errors}
{assign var="error" value=$update_errors[mysec]}
<li>{$error}</li>
{/section}
</ul>
</section>
{else}
<p class="ok">{#update_successful#}</p>
{/if}
{if $update_items}
<p>{#update_items_note#|replace:"[version]":$update_new_version}</p>
<ul class="filelist">
{foreach from=$update_items item=item}
<li><img src="{$THEMES_DIR}/{$theme}/images/{if $item.type==0}folder.svg{else}file.svg{/if}" alt="[{if $item.type==0}{#folder_alt#}{else}{#file_alt#}{/if}]" width="16" height="16">{$item.name}</li>
{/foreach}
</ul>
{/if}
{if $update_download_url}<p class="small">{#update_download#|replace:"[[":"<a href=\"$update_download_url\">"|replace:"]]":"</a>"}</p>{/if}
{if $update_message}{$update_message}{/if}
{elseif $action == 'email_list'}
<textarea onfocus="this.select()" onclick="this.select()" readonly="readonly" cols="60" rows="15">{$email_list}</textarea>
{elseif $action == 'clear_userdata'}
{if $no_users_in_selection}<p class="caution">{#no_users_in_selection#}</p>{/if}
{assign var="input_logins" value="<input type=\"text\" name=\"logins\" value=\"$logins\" size=\"4\">"}
{assign var="input_days" value="<input type=\"text\" name=\"days\" value=\"$days\" size=\"4\">"}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<p>{$smarty.config.clear_userdata_condition|replace:"[logins]":$input_logins|replace:"[days]":$input_days} <button name="clear_userdata" value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</div>
</form>
<p class="small">{#clear_userdata_note#}</p>
{elseif $action == 'edit_smiley'}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="id" value="{$id}">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<table class="settings">
 <tbody>
  <tr>
   <th><strong>{#edit_smilies_smiley#}</strong></th>
   <td>
    <select name="file" size="1">
{section name=nr loop=$smiley_files}
     <option value="{$smiley_files[nr]}"{if $file==$smiley_files[nr]} selected="selected"{/if}>{$smiley_files[nr]}</option>
{/section}
    </select>
   </td>
  </tr>
  <tr>
   <th><strong>{#edit_smilies_codes#}</strong></th>
   <td>
    <input type="text" name="code_1" size="7" value="{$code_1}">
    <input type="text" name="code_2" size="7" value="{$code_2}">
    <input type="text" name="code_3" size="7" value="{$code_3}">
    <input type="text" name="code_4" size="7" value="{$code_4}">
    <input type="text" name="code_5" size="7" value="{$code_5}">
   </td>
  </tr>
  <tr>
   <th><strong>{#edit_smilies_title#}</strong></th>
   <td><input type="text" name="title" size="25" value="{$title}"></td>
  </tr>
 </tbody>
</table>
<p><button name="edit_smiley_submit" value="{#submit_button_ok#}">{#submit_button_ok#}</button></p>
</div>
</form>
{elseif $action=='pages'}
<ul class="adminmenu">
 <li>
  <a href="index.php?mode=admin&amp;action=edit_page"><span class="icon"></span><span>{#add_page_link#}</span></a>
 </li>
</ul>
{if $pages}
<table id="sortable" class="below-adminmenu">
 <thead>
  <tr>
   <th>{#page_title#}</th>
   <th>{#page_menu_linkname#}</th>
   <th>{#page_access#}</th>
   <th>&#160;</th>
  </tr>
 </thead>
 <tbody id="items">
{section name=page loop=$pages}
  <tr id="id_{$pages[page].id}">
   <td class="cell-subject"><a href="index.php?mode=page&amp;id={$pages[page].id}" class="item">{$pages[page].title}</a></td>
   <td data-header="{#page_menu_linkname#}"><span class="small">{if $pages[page].menu_linkname!=''}{$pages[page].menu_linkname}{else}&nbsp;{/if}</span></td>
   <td data-header="{#page_access#}"><span class="small">{if $pages[page].access==1}{#page_access_reg_users#}{elseif $pages[page].access==0}{#page_access_public#}{/if}</span></td>
   <td class="item-tools">
    <ul>
     <li><a href="index.php?mode=admin&amp;edit_page={$pages[page].id}" class="editor"><span class="icon"></span><span>{#edit#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;delete_page={$pages[page].id}" class="terminator"><span class="icon"></span><span>{#delete#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;move_up_page={$pages[page].id}" class="move-item-up"><span class="icon"></span><span>{#move_up#}</span></a></li>
     <li><a href="index.php?mode=admin&amp;move_down_page={$pages[page].id}" class="move-item-down"><span class="icon"></span><span>{#move_down#}</span></a></li>
    </ul>
   </td>
  </tr>
{/section}
 </tbody>
</table>
{else}
<p class="below-adminmenu">{#no_pages#}</p>
{/if}
{elseif $action=='edit_page'}
{if $errors}
<section class="errormessage">
<h2>{#error_headline#}</h2>
<ul>
{section name=mysec loop=$errors}
{assign var="error" value=$errors[mysec]}
<li>{$smarty.config.$error}</li>
{/section}
</ul>
</section>
{/if}
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
{if $id}<input type="hidden" name="id" value="{$id}">{/if}
<table class="settings">
 <tbody>
  <tr>
   <th><strong>{#page_title#}</strong></th>
   <td><input type="text" name="title" value="{$title|default:""}" size="50"></td>
  </tr>
  <tr>
   <th><strong>{#page_content#}</strong>
    <span class="description">{#page_content_desc#}</span></th>
   <td><textarea name="content" cols="70" rows="20">{$content|default:""}</textarea></td>
  </tr>
  <tr>
   <th><strong>{#page_menu_linkname#}</strong>
    <span class="description">{#page_menu_linkname_desc#}</span></th>
   <td><input type="text" name="menu_linkname" value="{$menu_linkname|default:""}" size="50"></td>
  </tr>
  <tr>
   <th><strong>{#page_access#}</strong></th>
   <td>
    <div class="radio-select">
     <ul>
      <li><input type="radio" name="access" id="access-public" value="0"{if $access==0} checked="checked"{/if}><label for="access-public">{#page_access_public#}</label></li>
      <li><input type="radio" name="access" id="access-registered" value="1"{if $access==1} checked="checked"{/if}><label for="access-registered">{#page_access_reg_users#}</label></li>
     </ul>
    </div>
   </td>
  </tr>
 </tbody>
</table>
<p><button name="edit_page_submit" value="{#edit_page_submit#}">{#edit_page_submit#}</button></p>
</div>
</form>
{elseif $action=='delete_page'}
{if $page}
<p class="caution">{#caution#}</p>
<p>{#delete_page_confirm#}</p>
<p><strong>{$page.title}</strong></p>
<form action="index.php" method="post" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="admin">
<input type="hidden" name="csrf_token" value="{$CSRF_TOKEN}">
<input type="hidden" name="id" value="{$page.id}">
<p><button name="delete_page_submit" value="{#delete_page_submit#}">{#delete_page_submit#}</button></p>
</div>
</form>
{else}
<p>{#page_doesnt_exist#}</p>
{/if}
{else}
<div id="admin-menu-container">
 <aside id="additional-admin-info">
  <section id="current-version">
   <h3>{#actual_installed_version_header#}</h3>
   <p>{#actual_installed_version#|replace:"[current_version_string]":$installed_version_number}</p>
  </section>
 {if $install_script_exists}
  <section id="install-script-exists">
   <h3>{#warning_header#}</h3>
   <p>{#warning_install_script_exists#}</p>
  </section>
 {/if}
  <section id="releases">
   <h3>{#releases_info_header#}</h3>
 {if $latest_release_version}
  {if $latest_release_uri}
   <p><a href="{$latest_release_uri}">Download <strong>{$latest_release_version}</strong></a></p>
  {else}
   <p><a href="https://github.com/ilosuna/mylittleforum/releases/latest">Download <strong>{$latest_release_version}</strong></a></p>
  {/if}
 {else}
   <p><a href="https://github.com/ilosuna/mylittleforum/releases/latest">{#releases_list_link#}</a></p>
 {/if}
  </section>
 </aside>
 <ul class="adminmenu">
  <li><a href="index.php?mode=admin&amp;action=settings"><span class="icon"></span><span>{#forum_settings_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=user"><span class="icon"></span><span>{#user_administr_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=categories"><span class="icon"></span><span>{#category_administr_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=smilies"><span class="icon"></span><span>{#smilies_administr_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=pages"><span class="icon"></span><span>{#pages_administr_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=spam_protection"><span class="icon"></span><span>{#spam_protection_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=backup"><span class="icon"></span><span>{#backup_restore_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=update"><span class="icon"></span><span>{#update_link#}</span></a></li>
  <li><a href="index.php?mode=admin&amp;action=reset_uninstall"><span class="icon"></span><span>{#reset_uninstall_link#}</span></a></li>
 </ul>
</div>
{/if}
