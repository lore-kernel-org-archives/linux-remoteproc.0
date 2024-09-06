Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9B53376;
	Fri,  6 Sep 2024 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725660658; cv=none; b=TwGEJW6GKSEjrTOelDexbTeqvBU3UC5DL2YnK24f8o+6wcn6Jwj2tvloKGySZdXQzHIJPZrJrPCwD8xpmkHRDEakUOwbLEQtbfGRsGlgr/tGvIYHPTtIAu2/YpsSEr4Xu7AtasxlhQJxL6uJ4K/U80kgiZaEJ1N0OqzE7Wf/8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725660658; c=relaxed/simple;
	bh=O21NSs0T2Lu4ahGQbHfmUHSC224lqbT0KtsB5SUhWcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HyAg2QY+GIOKNHxeLZEQnG7YRlaFwkr2UMHA8izQ4GnL1dq9uSIxa+YPu6aIEZBUh1aCE9JzuYZXJ2BVAbh136I0gzURHCQdPHy0QFodX4kbYrOSjZoQMnzz07BCT2bigScQyQviymTtawSBbF1m9/woON9+mpIigUoVjVPNqhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G8J6GS36; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G8J6GS36"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 486MApIh003197;
	Fri, 6 Sep 2024 17:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725660651;
	bh=IzSu67Fov0UKp7xYxKaxZFkhQ5RXtT/cBu2VEGAXe0E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=G8J6GS36J+fyUQtdL1wtaAJAFgBcA5LWBAEizSfEbyT+pkOw/w0Y3aoNmOymGnfzn
	 QdmqPz3lMUVamUnPzQcNhL0W8L+hhA5fJOhXqQXQIO8YpjTs81y2WbNKWsPcRPNa5e
	 FuIhjNhvM93QMU3eWU4gtDwtpf+FVNT7EcumQol4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 486MAp5Z001056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Sep 2024 17:10:51 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 17:10:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 17:10:50 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486MAoEA031769;
	Fri, 6 Sep 2024 17:10:50 -0500
Message-ID: <e4c94731-aff5-4361-ae27-3e5271700dcd@ti.com>
Date: Fri, 6 Sep 2024 17:10:50 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: k3-dsp: Fix an error handling path in
 max77686_rtc_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Beleswar Padhi <b-padhi@ti.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
References: <9485e127a00419c76cf13dbccf4874af395ef6ba.1725653543.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <9485e127a00419c76cf13dbccf4874af395ef6ba.1725653543.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 9/6/24 3:12 PM, Christophe JAILLET wrote:
> If an error occurs after the k3_dsp_rproc_request_mbox() call,
> mbox_free_channel() must be called, as already done in the remove function.
> 
> Instead of adding an error handling path in the probe and changing all
> error handling in the function, add a new devm_add_action_or_reset() and
> simplify the .remove() function.
> 

Your patch subject is messed up, otherwise LGTM.

Reviewed-by: Andrew Davis <afd@ti.com>

> Fixes: ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during probe routine")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 8be3f631c192..f29780de37a5 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -610,6 +610,13 @@ static void k3_dsp_release_tsp(void *data)
>   	ti_sci_proc_release(tsp);
>   }
>   
> +static void k3_dsp_free_channel(void *data)
> +{
> +	struct k3_dsp_rproc *kproc = data;
> +
> +	mbox_free_channel(kproc->mbox);
> +}
> +
>   static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -649,6 +656,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = devm_add_action_or_reset(dev, k3_dsp_free_channel, rproc);
> +	if (ret)
> +		return ret;
> +
>   	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
>   	if (IS_ERR(kproc->ti_sci))
>   		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
> @@ -741,8 +752,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
>   		if (ret)
>   			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
>   	}
> -
> -	mbox_free_channel(kproc->mbox);
>   }
>   
>   static const struct k3_dsp_mem_data c66_mems[] = {
