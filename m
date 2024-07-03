Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0C133CD1;
	Wed,  3 Jul 2024 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720026931; cv=none; b=FhPQ6RNPg42/252ytLWcDX9l3aBzByLWrC3NXKvj7X8rtjdkafbeCfjl+v4IH3C71CHQQldh9LofVnLtxZ9rw7Xcj+qkbwdgYdlGQmJ3PmmZ5ll3zvEeDDV73moaD8lWYULib7itNoSE6KspXuOg+Wmd96J7IaiI0e/eBBm9txk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720026931; c=relaxed/simple;
	bh=Qy77CjuewMnMChJz4mCZijypfM0MV5InYD9xdxGmi4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GuiQs9+em1Td3bsvQawUyiYrVrAcdAKANkeAvyZKOUTZBKQrG9SB5rHdphIkG8po/U0dD756vzOcpdrEOc6m/sX2Tjkmi+dwct/a3amFpOxfCtZB5CeWQnNNfA6dPm48PDVObt1An4BxK1I8PLoqWgyvrOmDnJRs+yhM7UaE7tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FAsZNHrl; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FAsZNHrl"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 463HFGV5096925;
	Wed, 3 Jul 2024 12:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720026916;
	bh=ZnNlUm7qN3rNzG8ZCM/cJgxOtPhfpJg+wM6Sh8OKagI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FAsZNHrlf6kdlkG6/gsHv0IpmkrIAAadyjt3DhCxKa5nBxZX+uIu1LHnUdDn1UjEV
	 Wt77O0SuZlOXbD+XJp2qxHqNFuni9xSXRsH8xFZrd0yaGcHW0mMNjtlo7kMP3ShOYH
	 mXcdDcq5OWmex37xKp9Q6rbSUG6whDOksqcx3KOQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 463HFGdm040900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2024 12:15:16 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 Jul 2024 12:15:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 3 Jul
 2024 12:15:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 Jul 2024 12:15:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 463HFEtK021574;
	Wed, 3 Jul 2024 12:15:15 -0500
Message-ID: <4f4698d6-1594-4aca-bf2f-5b7e3229a50f@ti.com>
Date: Wed, 3 Jul 2024 12:15:14 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: k3-dsp: Fix log levels where appropriate
To: Garrett Giordano <ggiordano@phytec.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <w.egorov@phytec.de>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <upstream@lists.phytec.de>
References: <20240626191438.490524-1-ggiordano@phytec.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240626191438.490524-1-ggiordano@phytec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 6/26/24 2:14 PM, Garrett Giordano wrote:
> Driver was logging information as errors. Changed dev_err to dev_dbg
> where appropriate.
> 
> Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

> -v2
>    - Change from dev_info to dev_dbg
>    - Drop k3-r5 PATCH
> ---
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 3555b535b168..a22d41689a7d 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -327,7 +327,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>   		goto put_mbox;
>   	}
> 
> -	dev_err(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
> +	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
>   	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
>   	if (ret)
>   		goto put_mbox;
> --
> 2.25.1
> 
> 
