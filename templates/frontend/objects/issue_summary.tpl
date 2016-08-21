{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
<div class="issue-summary media">

	{* Retrieve separate entries for $issueTitle and $issueSeries *}
	{assign var=issueTitle value=$issue->getLocalizedTitle()}
	{assign var=issueSeries value=$issue->getIssueSeries()}

	{* Show cover image and use cover description *}
	{if $issue->getCoverImage()}
		<div class="media-left">
			<a class="cover" href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">
				<img src="{$coverPagePath|escape}{$issue->getFileName($currentLocale)|escape}">
			</a>
		</div>
	{/if}
	{assign var="issueDescription" value=$issue->getLocalizedDescription()}

	<div class="media-body">
		<h2 class="media-heading">
			<a class="title" href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">
				{if $issueTitle}
					{$issueTitle|escape}
				{else}
					{$issueSeries|escape}
				{/if}
			</a>
		</h2>
		{if $issueTitle}
			<p class="series lead">
				{$issueSeries|escape}
			</p>
		{/if}

		<div class="description">
			{$issueDescription|strip_unsafe_html|nl2br}
		</div>
	</div>
</div><!-- .issue-summary -->
