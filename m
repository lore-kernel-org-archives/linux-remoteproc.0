Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B186026982C;
	Fri, 11 Sep 2026 04:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102483; cv=none; b=S5WYP4ZxlAWi1cwYmRo8jyADcmOMiBxCeR6jnddECdieEgKyGbFORcslqTm5DsiMscwTw7RpkcYaJnlVrzF8eOJnuq+Fc/fi+IHUQCNB/T8CiiR3Rp733ew4OiXexhkMFT+goJKKVqagO41g+Bmdr7YhebuDhgHHc0oaJxKZNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102483; c=relaxed/simple;
	bh=DFFPQXQg/a68RNokho3+n0iB4hxfQnbCsoxoCERf/ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIP1TfU3taO3c+De0bd2LMlRlUQ/Pc2DxKCscH7yP3UJ2O/tshnb9mOv5Ykkx+gYIOGfE5GBg1gUiCcFofHnnLmVjw8IVu+ah9l+rm27DD9R1cctJxjF0igvFuUjEARU1gqNHi0r25jz6IY5OhbhlH3s/l+rVCwh2QpJP9ufukQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sxx5jSsK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sxx5jSsK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA701F000FF;
	Fri, 11 Sep 2026 04:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102482;
	bh=2ueqj9XUr/1wFT/ZN8IJsH3FZLpI0sndp9XuB5il2R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sxx5jSsKaIDWB9r1LfwlJ9EZ6RI3ym86X82J75mcEQuuUoaowTepynJdgeHsv3sCR
	 +WLRUOWBeHbHolYE8chT9Qkj4iMNp+l8UG2ilz/dmf4UwlTHfKzBvXFEOv9kfc5Y/m
	 2NhntwuJESmyZGugVFpymR0ivRkWjevyOCIeA2pcVIJ/y5kNGpFNvq9i6vl2Pi9FKv
	 5NPgA91C8/VqbdmET57fGlNygGSuJHqo05o8wlFiHSBrGPm6RHlXAFaYh+TcA9n7dZ
	 507YagnklPrnnaDTYlISJve0lUjp0R2EYjcIDCv8/NGryWBaaInZZtYTcYTwKbli+O
	 GZbydzfsQ73Yw==
Date: Fri, 11 Sep 2026 06:54:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <7ki5lpyd7uswvb7q7pc6rv2irmiej5e5ibgko34xkyvw2kpoc6@pejyfg7vky46>
References: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
 <20260910150638.3270162-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910150638.3270162-3-mukesh.ojha@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 08:36:38PM +0530, Mukesh Ojha wrote:
> The proxy power domain enable path requests INT_MAX performance
> state for every proxy PD. On Hawi, the NSP proxy power domain's
> RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
> INT_MAX, mapping to their maximum supported level.
> 
> Introduce a proxy_pd_performance_states array in qcom_pas_data
> to allow per-PD RPMH levels to be declared explicitly. Platforms
> that omit this field retain the existing INT_MAX behaviour.
> 
> Add Hawi CDSP remoteproc support with the following proxy PD
> performance states:
> 
>   CX:  RPMH_REGULATOR_LEVEL_TURBO
>   MXC: RPMH_REGULATOR_LEVEL_TURBO
>   NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..96a2436b777d 100644
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
> @@ -51,6 +52,8 @@ struct qcom_pas_data {
>  	bool decrypt_shutdown;
>  
>  	char **proxy_pd_names;
> +	const unsigned int *proxy_pd_performance_states;
> +	unsigned int num_proxy_pd_performance_states;
>  
>  	const char *load_state;
>  	const char *ssr_name;
> @@ -79,6 +82,7 @@ struct qcom_pas {
>  	struct regulator *px_supply;
>  
>  	struct device *proxy_pds[3];
> +	const unsigned int *proxy_pd_performance_states;
>  
>  	int proxy_pd_count;
>  
> @@ -167,7 +171,12 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  	int i;
>  
>  	for (i = 0; i < pd_count; i++) {
> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		unsigned int state = INT_MAX;
> +
> +		if (pas->proxy_pd_performance_states)
> +			state = pas->proxy_pd_performance_states[i];
> +
> +		dev_pm_genpd_set_performance_state(pds[i], state);
>  		ret = pm_runtime_get_sync(pds[i]);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(pds[i]);
> @@ -873,6 +882,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	pas->info_name = desc->sysmon_name;
>  	pas->smem_host_id = desc->smem_host_id;
>  	pas->decrypt_shutdown = desc->decrypt_shutdown;
> +	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
>  	pas->region_assign_idx = desc->region_assign_idx;
>  	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
>  	pas->region_assign_vmid = desc->region_assign_vmid;
> @@ -908,6 +918,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  		goto unassign_mem;
>  	pas->proxy_pd_count = ret;
>  
> +	if (WARN(desc->proxy_pd_performance_states &&

Do you really need WARN() here, and not dev_warn()? WARN() may cause panic on
systems that use 'panic_on_warn' cmdline param. In mobile/IoT world, use of this
cmdline params is not common, but I strongly suggest we scrutinize the use of
WARN*() macros in new code.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
