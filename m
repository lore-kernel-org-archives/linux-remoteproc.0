Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34C4756C0;
	Mon, 31 Aug 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191820; cv=none; b=B8isrGW//yYJiuddz60/He81PQ3J5Xrwj8cSKH/urwcTealjgjVjCPpEAwg5byAjG0Ms+hOSxzeEIEXDokn7+PIrf23T4KPszHmER5gb42w7A22QiDre5Z6Y72KnqsfGKuT9X6oO+2tEtKpc/te+3zyv+f7CzE+RICtgkIKoNfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191820; c=relaxed/simple;
	bh=sj1G1nIJLcfsT78aBj74iQfB2VfZkYxF90xBf26FJiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNGS95y8lGz4bXAqbceqxY6jxRMWNHx3ukSNGQRZQeADe57gTlrKViZU+/AC4TY2b30THAfqT+pRGkNNkvGRPen58px+iD/oGFDvNfTWUjRNQGFhqTdqIN7D+L+NsQm1VNO85KD2tvp0KTR1kjXD6zwaxjMA++8RGyOedOoEeD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FI8A6iyC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FI8A6iyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5C71F000E9;
	Mon, 31 Aug 2026 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788191818;
	bh=QDf7hjp3k8zWLlDvNy9zMjjJf2oqoy2d9pbCTQR5LkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FI8A6iyC5CfrQGHrOheSq2Obcff19aB/bzlsc22wM7ShPlECQ+kCQlCXWNF25JTR6
	 3F5Knc4VY9l8VImBdfjMVTUYRovFKibP6tGceAd3gMzF2M7G+VER59O2mUvc5Klp8i
	 1TWGbEvQQH+/UE6VrN1NkraXay2W8tc7gs71ozZpX1E17nK4wM2CXA1kgBCF5/bCGv
	 F3CUIACTSP7zQyLtgMq+ZBhVvetIiAhij1Bd4OPti190cp7sng0uJpr8uPYoagdV0t
	 AN3O3B43e0A4J47VGIcpurMXN1Qk+LqCT2Fd8bn+bEUcEpPeQVxvBiY85Xky67MISw
	 6IZiVuiB0pREw==
Date: Mon, 31 Aug 2026 10:56:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <apWhseqV8vdufajf@baldur>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 11:43:11PM +0530, Mukesh Ojha wrote:
> The proxy power domain enable path currently requests INT_MAX performance
> state for every proxy PD.  While this serves as a "take highest available"
> hint, some SoCs require specific per-domain RPMH levels for correct
> operation during firmware load rather than a blanket maximum.
> 
> Introduce a proxy_pd_performance_states array in qcom_pas_data to allow
> each proxy PD to declare its required RPMH performance level explicitly.
> Platforms that do not populate this field retain the existing INT_MAX
> behaviour.
> 

Is it possible to encode this using an optional opp-table instead of
filling the driver with such details? (This is a question, not a direct
suggestion)

> Also propagate the return value of dev_pm_genpd_set_performance_state()
> and emit a warning on failure rather than silently ignoring it.

Also remember that whenever you start a paragraph in a commit message
with the word "also"; it's probably a good sign that it would be better
to have a separate commit.

> 
> Add Hawi CDSP remoteproc support using this infrastructure with the
> following proxy PD performance states:

That is quite weird, because you already stated that we added Hawi CDSP
support in
https://lore.kernel.org/r/20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com


Note that the line:

  compatible = "qcom,hawi-cdsp-pas", "qcom,sm8550-cdsp-pas";

is supposed to tell an OS that "if you have an implementation for
qcom,hawi-cdsp-pas use that, if not you can use the implementation for
qcom,sm8550-cdsp-pas".

This patch tells me that you need to also fix the binding to not say
that - because hawi-cdsp is no longer compatible with sm8550-cdsp.

I'm guessing that this issue might have been a late discovery, state
that in your commit message changing the binding.

> 
>   CX:  RPMH_REGULATOR_LEVEL_TURBO
>   MXC: RPMH_REGULATOR_LEVEL_TURBO
>   NSP: RPMH_REGULATOR_LEVEL_NOM

I'm guessing that what you describe above about INT_MAX being a problem
is only for NSP? Would be nice to not having to guess though.

Regards,
Bjorn

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 43 +++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 25942200ba03..c270c81e8bb4 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -28,6 +28,7 @@
>  #include <linux/soc/qcom/mdt_loader.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
>  
>  #include "qcom_common.h"
>  #include "qcom_pil_info.h"
> @@ -51,6 +52,7 @@ struct qcom_pas_data {
>  	bool decrypt_shutdown;
>  
>  	char **proxy_pd_names;
> +	const unsigned int *proxy_pd_performance_states;
>  
>  	const char *load_state;
>  	const char *ssr_name;
> @@ -79,6 +81,7 @@ struct qcom_pas {
>  	struct regulator *px_supply;
>  
>  	struct device *proxy_pds[3];
> +	const unsigned int *proxy_pd_performance_states;
>  
>  	int proxy_pd_count;
>  
> @@ -167,7 +170,17 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  	int i;
>  
>  	for (i = 0; i < pd_count; i++) {
> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		unsigned int state = INT_MAX;
> +
> +		if (pas->proxy_pd_performance_states)
> +			state = pas->proxy_pd_performance_states[i];
> +
> +		ret = dev_pm_genpd_set_performance_state(pds[i], state);
> +		if (ret)
> +			dev_warn(pas->dev,
> +				 "failed to set proxy PD %d state %u: %d\n",
> +				 i, state, ret);
> +
>  		ret = pm_runtime_get_sync(pds[i]);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(pds[i]);
> @@ -873,6 +886,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	pas->info_name = desc->sysmon_name;
>  	pas->smem_host_id = desc->smem_host_id;
>  	pas->decrypt_shutdown = desc->decrypt_shutdown;
> +	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
>  	pas->region_assign_idx = desc->region_assign_idx;
>  	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
>  	pas->region_assign_vmid = desc->region_assign_vmid;
> @@ -1798,6 +1812,32 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>  	.needs_tzmem = true,
>  };
>  
> +static const struct qcom_pas_data hawi_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mdt",
> +	.pas_id = 18,
> +	.dtb_pas_id = 0x25,
> +	.minidump_id = 7,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		"nsp",
> +		NULL
> +	},
> +	.proxy_pd_performance_states = (const unsigned int[]){
> +		RPMH_REGULATOR_LEVEL_TURBO,
> +		RPMH_REGULATOR_LEVEL_TURBO,
> +		RPMH_REGULATOR_LEVEL_NOM,
> +	},
> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +	.smem_host_id = 5,
> +};
> +
>  static const struct qcom_pas_data eliza_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mbn",
> @@ -1827,6 +1867,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
>  	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
> +	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
>  	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
> -- 
> 2.55.0
> 
