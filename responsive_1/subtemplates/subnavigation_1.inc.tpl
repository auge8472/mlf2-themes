{if $subnav_location}
<ul id="subnav-1">
{if $breadcrumbs}
{section name=nr loop=$breadcrumbs}
{assign var="breadcrumb_linkname" value=$breadcrumbs[nr].linkname}
 <li><a href="{$breadcrumbs[nr].link}"><span class="icon"></span>{$smarty.config.$breadcrumb_linkname}</a></li>
{/section}
{/if}
 <li><strong><span class="icon"></span>{$subnav_location}</strong></li>
</ul>
{elseif $subnav_link}
{assign var="link_name" value=$subnav_link.name}
<ul id="subnav-1">
 <li><a class="stronglink" href="index.php{if $subnav_link.id && !$subnav_link.mode}?id={$subnav_link.id}{else}?mode={$subnav_link.mode}{if $subnav_link.back}&amp;back={$subnav_link.back}{/if}{if $subnav_link.id}&amp;id={$subnav_link.id}{/if}{/if}"><span class="icon"></span>{$smarty.config.$link_name|replace:"[name]":$name_repl_subnav}</a></li>
</ul>
{/if}
