Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552720124F;
	Wed,  7 Aug 2024 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037849; cv=none; b=P/c9ej8tdgYzJj745Lx7Sq4017ilgeQevEYhyyK5f93Fm7wty8FShsl/aVeghHYU1/WlAH+n36tgvsVTvU+DeDCUH2PowImEOtQL8Tu+jE1KwXJNkTQguUm5ZJ+JHCqPThQnKtLnio2QB7u157Wj0I61G6pnex9lxKTcau/AO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037849; c=relaxed/simple;
	bh=hoVHH9tXVwNx1c0Mrluc8/Ih6kYDnnPcFjhU2PF0f+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AAbVWhPqwiy28KtaHuJ9bAAR0gsI0UE29mmJHhUTdbkhTKmf3S9IGJgf0If3WAeIFF92WACobKgLO95IiP0w/6oaC5B21bTJ1exFKfXh5LF/MyEtePyicWNXQ5DmLOhdNi/3iwJbuDegs7m4N7sc9PfsG0NVdZok7lllxD3Jehg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mAVE9M53; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mAVE9M53"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477DbIrv018406;
	Wed, 7 Aug 2024 08:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723037838;
	bh=wy/GKsqdSLQpkYwAbqILwGPIejQ6R6eelIMeGNVONzw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mAVE9M53Ow/UC555su+V2fodDRrs5qIMc5mN6EzlDeDFihK1LGKPMgQ/tz/Zq7Wrn
	 i8XhaS/qVW9lyKf1iOaWQLHgWE7uWkYOyypnHFDgiX55BBuYNrPorCV8YEOuUmfn5f
	 25bJrTI5zkFQAxV2rSg/hlm3MDSbebgk0bU+PmaQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477DbIBY012933
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 08:37:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 08:37:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 08:37:18 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477DbHAn029301;
	Wed, 7 Aug 2024 08:37:17 -0500
Message-ID: <0bba5293-a55d-4f13-887c-272a54d6e1ca@ti.com>
Date: Wed, 7 Aug 2024 08:37:17 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] remoteproc: k3-r5: Use devm_rproc_alloc() helper
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240807062256.1721682-1-b-padhi@ti.com>
 <20240807062256.1721682-2-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240807062256.1721682-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 8/7/24 1:22 AM, Beleswar Padhi wrote:
> Use the device lifecycle managed allocation function. This helps prevent
> mistakes like freeing out of order in cleanup functions and forgetting
> to free on error paths.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 39a47540c590..dbcd8840ae8d 100644
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
> @@ -1352,7 +1352,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   err_add:
>   	k3_r5_reserved_mem_exit(kproc);
>   err_config:
> -	rproc_free(rproc);
>   	core->rproc = NULL;

I'd remove this line too, we don't check for NULL later, we check
core->rproc->status, which will cause a nullptr dereference error
instead of correctly detecting that the core is "offline".

Same below.

Andrew

>   out:
>   	/* undo core0 upon any failures on core1 in split-mode */
> @@ -1399,7 +1398,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>   
>   		k3_r5_reserved_mem_exit(kproc);
>   
> -		rproc_free(rproc);
>   		core->rproc = NULL;
>   	}
>   }
