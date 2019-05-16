{config_load file=$language_file section="user"}
<div id="usernav">
<div id="searchbox">
<form action="index.php" method="get" accept-charset="{#charset#}">
<div>
<input type="hidden" name="mode" value="user" />
<label for="searchfield">{#search_user#}</label>
<input id="searchfield" type="search" name="search_user" value="{if $search_user}{$search_user}{/if}" size="25" />
<button>{#go#}</button>
</div>
</form>
</div>
{if $pagination}
<div id="userpagination">
<ul class="pagination">
{if $pagination.previous}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $pagination.previous>1}&amp;page={$pagination.previous}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $item>1}&amp;page={$item}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{$item}</a></li>{/if}
{/foreach}{if $pagination.next}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$pagination.next}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#next_page_link#}</a></li>{/if}
</ul>
</div>
{/if}
</div>

{if $total_users > 0}
<table>
 <thead>
  <tr>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_name#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_name&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_name" && $descasc=="DESC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_name&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_name" && $descasc=="ASC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_type#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_type&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_type" && $descasc=="ASC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_type&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_type" && $descasc=="DESC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_hp#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_hp&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_hp" && $descasc=="ASC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_hp&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_hp" && $descasc=="DESC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_email#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=email_contact&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="email_contact" && $descasc=="ASC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=email_contact&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="email_contact" && $descasc=="DESC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
{if $mod || $admin}
   <th>
    <span class="header-cell">
     <span class="tc-title">{#user_blockage#}</span>
     <span class="sorting-ui">
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_lock&amp;descasc=DESC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_lock" && $descasc=="DESC"}order-to-top-active.svg{else}order-to-top-inactive.svg{/if}" alt="[desc]" width="8" height="16" />
      </a>
      <a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;order=user_lock&amp;descasc=ASC&amp;ul={$ul}">
       <img src="{$THEMES_DIR}/{$theme}/images/{if $order=="user_lock" && $descasc=="ASC"}order-to-bottom-active.svg{else}order-to-bottom-inactive.svg{/if}" alt="[asc]" width="8" height="16" />
      </a>
     </span>
    </span>
   </th>
{/if}
  </tr>
 </thead>
 <tbody>
{foreach from=$userdata item=row}
  <tr>
   <td data-header="{#user_name#}" class="cell-subject"><a href="index.php?mode=user&amp;show_user={$row.user_id}" class="item">{$row.user_name}</a></td>
   <td data-header="{#user_type#}"><span class="value">{if $row.user_type==2}{#admin#}{elseif $row.user_type==1}{#mod#}{else}{#user#}{/if}</span></td>
   <td data-header="{#user_hp#}"><span class="value">{if $row.user_hp!=''}<a href="{$row.user_hp}"><img src="{$THEMES_DIR}/{$theme}/images/home.svg" alt="{#homepage#}" width="15" height="15" class="icon" /></a>{else}&nbsp;{/if}</span></td>
   <td data-header="{#user_email#}"><span class="value">{if $row.user_email}<a href="index.php?mode=contact&amp;user_id={$row.user_id}"><img src="{$THEMES_DIR}/{$theme}/images/contact-email.svg" alt="{#email#}" width="15" height="15" class="icon" /></a>{else}&nbsp;{/if}</span></td>
{*<td data-header="{#user_postings#}"><span class="value">{if $row.postings>0}<a href="index.php?mode=user&amp;action=show_posts&amp;id={$row.user_id}">{$row.postings}</a>{else}{$row.postings}{/if}</span></td>*}
{*{if $settings.count_users_online>0}   <td data-header="{#user_online#}" class="{$c}"><span class="value">{if $row.online}<span style="color:red;">{#online#}</span>{else}&nbsp;{/if}</span></td>{/if}*}
{if $mod || $admin}   <td data-header="{#user_blockage#}"><span class="value">{if $row.user_type>0}{if $row.user_lock==0}{#unlocked#}{else}{#locked#}{/if}{elseif $row.user_lock==0}<a href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;user_lock={$row.user_id}&amp;page={$page}&amp;order={$order}&amp;descasc={$descasc}">{#unlocked#}</a>{else}<a class="user-locked" href="index.php?mode=user{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}&amp;user_lock={$row.user_id}&amp;page={$page}&amp;order={$order}&amp;descasc={$descasc}">{#user_locked#}</a>{/if}</span></td>{/if}
  </tr>
{/foreach}
 </tbody>
</table>

{if $pagination}
<ul class="pagination pagination-index-table">
{if $pagination.previous}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $pagination.previous>1}&amp;page={$pagination.previous}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#previous_page_link#}</a></li>{/if}
{foreach from=$pagination.items item=item}
{if $item==0}<li>…</li>{elseif $item==$pagination.current}<li><a>{$item}</a></li>{else}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}{if $item>1}&amp;page={$item}{/if}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{$item}</a></li>{/if}
{/foreach}{if $pagination.next}<li><a href="index.php?mode={$mode}{if $action}&amp;action={$action}{/if}{if $search_user_encoded}&amp;search_user={$search_user_encoded}{/if}{if $method && $method!='fulltext'}&amp;method={$method}{/if}{if $id}&amp;id={$id}{/if}&amp;page={$pagination.next}{if $p_category && $p_category>0}&amp;p_category={$p_category}{/if}{if $order}&amp;order={$order}{/if}{if $descasc}&amp;descasc={$descasc}{/if}">{#next_page_link#}</a></li>{/if}
</ul>
{/if}

<aside id="usersonline">
<h2>{#currently_online#}</h2>
{if $users_online}
<ul>
{foreach name="users_online" from=$users_online item=user}<li><a href="index.php?mode=user&amp;show_user={$user.id}">{$user.name}</a></li>{/foreach}
</ul>
{/if}
{else}
<p><em>{#no_users#}</em></p>
{/if}
</aside>
