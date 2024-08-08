Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61F18A946;
	Thu,  8 Aug 2024 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126976; cv=none; b=pZNDiloZC+Ew42RbArDsbfx9NB1rOGYwLAe0KIvEoVVMvJTQEK3RoduHcSeAQUQJy7iz53ZiHDdCBXXShVGtE7HkgLXOFL26hpJgKM6JGg959vJnh3YYSKovFP2+964yjtlLRvo3EAjRXDBkwOJFHNvZrJFDzByKuP9vqX1LwIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126976; c=relaxed/simple;
	bh=rp8GsHSO3IypfCrpJwpLlvhbMjqR2AIuzom2m2KI8fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GT4vTpD20CZEb4J0FRfiwM+b2MvZya2XQ0lhZaVT1ApmvRUEX+ioBgFsOs4TVqyq0s4uy1cjXXCWeJrC+fhW9wb4tsMVVjoe3CMHlfLOs7me1kJoeCJOJXipcje5KDaIbFcCISuTrqy4R7KTeUNlDG3BVJj9k6MxzjW8w6Xf47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J4EDy2/l; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J4EDy2/l"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478EMdvn051128;
	Thu, 8 Aug 2024 09:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723126959;
	bh=eHDHxPq50DGM3g84s3Jqk1v6dSzgUEZFw0neW81oseI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=J4EDy2/lr7OFOgA+HnRaP8XDARttD1sWneo83IXIRhBMx6gGfqa1C3gVWHA/Bqrap
	 GXZ5mszM+xd7K+cJHatJyxWCKCoTq+HWsfOcFvjAe8BgVSnCBn7aPNE2hVkoHxaN/1
	 Jk3IEfcZDaE6XGfIjd66eeFQpkm5K9KRcRVTLFNM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478EMdDO005009
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 09:22:39 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 09:22:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 09:22:38 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478EMcGA106772;
	Thu, 8 Aug 2024 09:22:38 -0500
Message-ID: <4fb4a772-e564-4d25-99fe-ef02f86c96c8@ti.com>
Date: Thu, 8 Aug 2024 09:22:38 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] remoteproc: k3-r5: Use devm_rproc_alloc() helper
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240808074127.2688131-1-b-padhi@ti.com>
 <20240808074127.2688131-2-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240808074127.2688131-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 8/8/24 2:41 AM, Beleswar Padhi wrote:
> Use the device lifecycle managed allocation function. This helps prevent
> mistakes like freeing out of order in cleanup functions and forgetting
> to free on error paths.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

LGTM

Reviewed-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 39a47540c590..57067308b3c0 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1259,8 +1259,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   			goto out;
>   		}
>   
> -		rproc = rproc_alloc(cdev, dev_name(cdev), &k3_r5_rproc_ops,
> -				    fw_name, sizeof(*kproc));
> +		rproc = devm_rproc_alloc(cdev, dev_name(cdev), &k3_r5_rproc_ops,
> +					 fw_name, sizeof(*kproc));
>   		if (!rproc) {
>   			ret = -ENOMEM;
>   			goto out;
> @@ -1280,7 +1280,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   
>   		ret = k3_r5_rproc_configure_mode(kproc);
>   		if (ret < 0)
> -			goto err_config;
> +			goto out;
>   		if (ret)
>   			goto init_rmem;
>   
> @@ -1288,7 +1288,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   		if (ret) {
>   			dev_err(dev, "initial configure failed, ret = %d\n",
>   				ret);
> -			goto err_config;
> +			goto out;
>   		}
>   
>   init_rmem:
> @@ -1298,7 +1298,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   		if (ret) {
>   			dev_err(dev, "reserved memory init failed, ret = %d\n",
>   				ret);
> -			goto err_config;
> +			goto out;
>   		}
>   
>   		ret = rproc_add(rproc);
> @@ -1351,9 +1351,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   	rproc_del(rproc);
>   err_add:
>   	k3_r5_reserved_mem_exit(kproc);
> -err_config:
> -	rproc_free(rproc);
> -	core->rproc = NULL;
>   out:
>   	/* undo core0 upon any failures on core1 in split-mode */
>   	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
> @@ -1398,9 +1395,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>   		rproc_del(rproc);
>   
>   		k3_r5_reserved_mem_exit(kproc);
> -
> -		rproc_free(rproc);
> -		core->rproc = NULL;
>   	}
>   }
>   
