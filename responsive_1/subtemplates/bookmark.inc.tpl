{config_load file=$language_file section="bookmark"}

{if $action == 'bookmark'}
 {if $total_bookmarks > 0}
 <table id="sortable" class="normaltab">
  <thead>
   <tr>
    <th>{#bookmark_title#}</th>
    <th>{#bookmark_user_name#}</th>
    <th>{#bookmark_creation_time#}</th>
    <th>{#bookmark_posting_time#}</th>
    <th>Tags</th>
    <th>&#160;</th>
   </tr>
  </thead>
  <tbody>
  {foreach from=$bookmarkdata item=row}
   <tr id="id_{$row.bid}">
    <td data-header="{#bookmark_title#}" class="cell-subject"><a href="index.php?id={$row.id}" class="item">{$row.subject}</a></td>
    <td data-header="{#bookmark_user_name#}">{if $row.user_id > 0}<a href="index.php?mode=user&amp;show_user={$row.user_id}">{/if}<strong>{$row.user_name}</strong>{if $row.user_id > 0}</a>{/if}</td>
    <td data-header="{#bookmark_creation_time#}"><span class="small">{$row.bookmark_time}</span></td>
    <td data-header="{#bookmark_posting_time#}"><span class="small">{$row.posting_time}</span></td>
    <td class="taglist">
    {if count($row.tags) > 0}
     <ul>
     {foreach name="tags" from=$row.tags item=tag}
      <li><a href="index.php?mode=bookmarks&amp;filter={$tag.escaped}">{$tag.display}</a></li>
     {/foreach}
     </ul>
    {/if}</td>
    <td class="item-tools">
     <ul>
      <li><a href="index.php?mode=bookmarks&amp;edit_bookmark={$row.bid}" class="editor"><span class="icon"></span><span>{#edit#}</span></a></li>
      <li><a href="index.php?mode=bookmarks&amp;delete_bookmark={$row.bid}"  class="terminator"><span class="icon"></span><span>{#delete#}</span></a></li>
      <li><a href="index.php?mode=bookmarks&amp;move_up_bookmark={$row.bid}" class="move-item-up"><span class="icon"></span><span>{#move_up#}</span></a></li>
      <li><a href="index.php?mode=bookmarks&amp;move_down_bookmark={$row.bid}" class="move-item-down"><span class="icon"></span><span>{#move_down#}</span></a></li>
     </ul>
    </td>
   </tr>
  {/foreach}
  </tbody>
 </table>
 {else}
 <p><em>{#no_bookmarks#}</em></p>
 {/if}

{elseif $action=='delete_bookmark'}
 {if $bookmark}
 <p class="caution">{#caution#}</p>
 <p>{#delete_bookmark_confirm#}</p>
 <p><strong>{$bookmark.subject}</strong></p>
 <form action="index.php" method="post" accept-charset="{#charset#}">
  <div>
   <input type="hidden" name="mode" value="bookmarks" />
   <input type="hidden" name="id" value="{$bookmark.id}" />
   <input type="submit" name="delete_bookmark_submit" value="{#delete_bookmark_submit#}" />
  </div>
 </form>
 {else}
 <p><em>{#no_bookmarks#}</em></p>
 {/if}

{elseif $action=='edit_bookmark'}
 {if $errors}
 <section class="errormessage">
  <h2>{#error_headline#}</h2>
  <ul class="error-list">
  {section name=mysec loop=$errors}
   <li>{assign var="error" value=$errors[mysec]}{$smarty.config.$error|replace:"[word]":$word}</li>
  {/section}
  </ul>
 </section>
 {/if}
 {if $bookmark}
 <form action="index.php" method="post" class="normalform" accept-charset="{#charset#}">
  <div>
   <input type="hidden" name="mode" value="bookmarks" />
   <input type="hidden" name="id" value="{$bookmark.id}" />
   <label for="bookmark">{#edit_bookmark#}</label><br />
   <input type="text" id="bookmark" name="bookmark" value="{$bookmark.title}" maxlength="255" size="25" /><br />
   <label for="tags">{#edit_tags#}</label><br />
   <input type="text" id="tags" name="tags" value="{$bookmark.tags}" maxlength="255" size="25" />&nbsp;<span class="xsmall">{#edit_tags_note#}</span><br />
   <button name="edit_bookmark_submit">{#submit_button_ok#}</button>
  </div>
 </form>
 {else}
 <p><em>{#no_bookmarks#}</em></p>
 {/if}
{else}
<p><em>{#no_bookmarks#}</em></p>
{/if}