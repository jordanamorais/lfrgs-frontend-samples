<#--  Where "NombreDeLaRedSocial" is in a web content structure and is a repeatible field.  -->
<div class="msl-social-network">
	<ul class="msl-social-network__list">
		<#if NombreDeLaRedSocial.getSiblings()?has_content>
			<#list NombreDeLaRedSocial.getSiblings() as cur_NombreDeLaRedSocial>

				<li class="msl-social-network__item ${cur_NombreDeLaRedSocial.getData()?lower_case}">
					<a class="msl-social-network__link" href="${cur_NombreDeLaRedSocial.LinkDeLaRedSocial.data}">
						<span class="msl-social-network__icon">&nbsp;</span>
						<div class="msl-social-network__details">
							<span class="msl-social-network__network-name">
								${cur_NombreDeLaRedSocial.getData()}
							</span>
							<span class="msl-social-network__network-user">
							    ${cur_NombreDeLaRedSocial.UsernameDeLaRedSocial.data}
							</span>
						</div>
					</a>
				</li>
			</#list>
		</#if>
	</ul>
</div>