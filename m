Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302F1F5EA;
	Mon, 21 Apr 2025 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246557; cv=none; b=qR+GnRiq29/jxJNYTBC3e4U1DDrQ3mzuV+ijFRvagdSgsinotoNRnLosZw++5tQd11ldCAW9U8+BzkC/Z/EcBnnm1amQN4rYEmxxKpX0vIhocEDhHNQLbR/5Pd6hXbAL2GOX5x6VUCiVFB0ODRsJoaKql6bCPejKcEednLj0Okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246557; c=relaxed/simple;
	bh=IEKwrGYy/VW9MQNFST4Y/K444WyRqQM3wMr2sN3ad7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C9hy2vvnV2IZjR5PCl9g0XXxTzNlpLfW+WZHInlBPzGSZZhTMUtrNM1V8hElKx5PF1RmVhV9tip02pV9l+SFjQSso7TNPJLq3y711LOvVc1E4MuD6iuJpZE5ZF0FEDO83OQ8YgP1iVFDEz66nZL0Naay3DaEly5lI4+p2Ma3m8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KgLdpA27; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KgLdpA27"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEgQAX938257
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745246546;
	bh=Bd4d4NRrmQNS8O+/gOqiB+Q+N/Yiohv30BhbtPRCdM0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KgLdpA270J+detv6NlTL1hyXXvEizWxj20aEqCMN0PZ30FI4ZRP/UDg/tbSWKB2qG
	 H6vAd7ZxPLC7OEulIgqig39WUnnyTTPGSiM8tJX26WGDTt1QThHvj75s0OoQe01MHc
	 6wp8ZGNdTw8CkNTsEAF6d3IGInlcy2ySBI0r4VnQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LEgQQq001670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 09:42:26 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 09:42:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 09:42:25 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LEgPXB089963;
	Mon, 21 Apr 2025 09:42:25 -0500
Message-ID: <00ba399d-7a26-4ced-8f77-334839bb54c6@ti.com>
Date: Mon, 21 Apr 2025 09:42:25 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/33] remoteproc: k3: Refactor rproc_reset()
 implementation into common driver
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250417182001.3903905-1-b-padhi@ti.com>
 <20250417182001.3903905-16-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250417182001.3903905-16-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/17/25 1:19 PM, Beleswar Padhi wrote:
> The rproc_reset() implementations in TI K3 DSP and M4 remoteproc drivers
> assert reset in the same way. Refactor the above function into the
> ti_k3_common.c driver as k3_rproc_reset() and use it throughout DSP and
> M4 drivers for resetting the remote processor.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v10: Changelog:
> 1. Split [v9 12/26] into [v10 14/33] and [v10 15/33] patches.
> 
> Link to v9:
> https://lore.kernel.org/all/20250317120622.1746415-13-b-padhi@ti.com/
> 
>   drivers/remoteproc/ti_k3_common.c         | 25 ++++++++++++++++++++
>   drivers/remoteproc/ti_k3_common.h         |  1 +
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++---------------------
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 16 +++----------
>   4 files changed, 31 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index aace308b49b0e..19bb6c337af77 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -105,5 +105,30 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
>   }
>   EXPORT_SYMBOL_GPL(k3_rproc_kick);
>   
> +/* Put the remote processor into reset */
> +int k3_rproc_reset(struct k3_rproc *kproc)
> +{
> +	struct device *dev = kproc->dev;
> +	int ret;
> +
> +	if (kproc->data->uses_lreset) {
> +		ret = reset_control_assert(kproc->reset);
> +		if (ret)
> +			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> +						    kproc->ti_sci_id);
> +	if (ret) {
> +		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
> +		if (reset_control_deassert(kproc->reset))
> +			dev_warn(dev, "local-reset deassert back failed\n");
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(k3_rproc_reset);
> +
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("TI K3 common Remoteproc code");
> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> index 6ae7ac4ec5696..f3400fc774766 100644
> --- a/drivers/remoteproc/ti_k3_common.h
> +++ b/drivers/remoteproc/ti_k3_common.h
> @@ -90,4 +90,5 @@ struct k3_rproc {
>   
>   void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
>   void k3_rproc_kick(struct rproc *rproc, int vqid);
> +int k3_rproc_reset(struct k3_rproc *kproc);
>   #endif /* REMOTEPROC_TI_K3_COMMON_H */
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 0a8c9e61393d2..f8a5282df5b71 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -24,30 +24,6 @@
>   
>   #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
>   
> -/* Put the DSP processor into reset */
> -static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
> -{
> -	struct device *dev = kproc->dev;
> -	int ret;
> -
> -	if (kproc->data->uses_lreset) {
> -		ret = reset_control_assert(kproc->reset);
> -		if (ret)
> -			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
> -		return ret;
> -	}
> -
> -	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -						    kproc->ti_sci_id);
> -	if (ret) {
> -		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
> -		if (reset_control_deassert(kproc->reset))
> -			dev_warn(dev, "local-reset deassert back failed\n");
> -	}
> -
> -	return ret;
> -}
> -
>   /* Release the DSP processor from reset */
>   static int k3_dsp_rproc_release(struct k3_rproc *kproc)
>   {
> @@ -201,7 +177,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>   {
>   	struct k3_rproc *kproc = rproc->priv;
>   
> -	k3_dsp_rproc_reset(kproc);
> +	k3_rproc_reset(kproc);
>   
>   	return 0;
>   }
> @@ -565,7 +541,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   				return dev_err_probe(dev, ret, "failed to get reset status\n");
>   			} else if (ret == 0) {
>   				dev_warn(dev, "local reset is deasserted for device\n");
> -				k3_dsp_rproc_reset(kproc);
> +				k3_rproc_reset(kproc);
>   			}
>   		}
>   	}
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 8a6917259ce60..7d5b75be2e4f8 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -65,11 +65,9 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
>   	 * Ensure the local reset is asserted so the core doesn't
>   	 * execute bogus code when the module reset is released.
>   	 */
> -	ret = reset_control_assert(kproc->reset);
> -	if (ret) {
> -		dev_err(dev, "could not assert local reset\n");
> +	ret = k3_rproc_reset(kproc);
> +	if (ret)
>   		return ret;
> -	}
>   
>   	ret = reset_control_status(kproc->reset);
>   	if (ret <= 0) {
> @@ -374,16 +372,8 @@ static int k3_m4_rproc_start(struct rproc *rproc)
>   static int k3_m4_rproc_stop(struct rproc *rproc)
>   {
>   	struct k3_rproc *kproc = rproc->priv;
> -	struct device *dev = kproc->dev;
> -	int ret;
>   
> -	ret = reset_control_assert(kproc->reset);
> -	if (ret) {
> -		dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return k3_rproc_reset(kproc);

This doesn't feel right. The new common k3_rproc_reset() function
matches what ti_k3_dsp_remoteproc.c did for reset, you made it that
way in the previous patch [14/33]. But it doesn't match what this
M4 version does (yes I know logically they are the same as `uses_lreset`
will be always true for M4). Maybe you want to do the same as you
did for DSP to the M4 driver first, before you make this change so
it is 100% clear the code is the same (and so bisect lands on the
right patch should someday this be an issue).

Also, the common k3_rproc_reset() calls put_device() unconditionally.
Something that wasn't done at all here in the M4 prepare() and stop()
functions.

These two changes make this patch not strictly a pure "refactor"
patch, which IMHO should in no way change the calls being made nor
the logical flow, only the code structure.

Andrew

>   }
>   
>   /*
