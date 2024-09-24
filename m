Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B614168DC;
	Tue, 24 Sep 2024 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727191785; cv=none; b=WKEWW0IQMA1yKnxGXAgzgoJI6enI292rgjIAj19wdchFtjmPy5NZHKwyHz3873z5ff2JdB2JbBLy/aWgI3F60MlKumU+fnnyW3RwBtgWVM85juNnmHlj5k4D+8daVKi3H7GDHJKDCkGwzxiYynk6kormyGbDGhapEvl5HwxNYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727191785; c=relaxed/simple;
	bh=rSQWLMADkTsYkav2shQDMziOJCV2io1diO4suwOgapw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nljEiewn9Mu01mXgfzGYeG1JyykVSLnCY4068rLBGMMmD5n4QO5qMfD7DTEeVnGKoMwNNEWtRIAKxrYoOW+j0SNleg+JHA7/CUneADtb/tnZuH7LLoiXpBsC8/DupLSbKIqbeVIdo533/VtHO3sqkxwGNkTBr0VhNMIYRTnDFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WQbZP7Ai; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WQbZP7Ai"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48OFTaaR086338;
	Tue, 24 Sep 2024 10:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727191776;
	bh=ii1KpWgcniV+/pU5XbRy7vCXwDFZ1a4RJxwybt+XINk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WQbZP7AiAooCPDp3oVsFGg0MAQ2lCRBB9Oq2YcAxfhKVGcdyQTmw8nsA16JT1tiWj
	 ZbHtRMQlr1IABQlusn3xlawMdR3j1dxmhPUgsAGMjCaNnUktKxKtk4vQMhSvRnHzoA
	 HtX3KV65+wdNqH3zfrsn8NKk098MxToqsuNfaIho=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48OFTZEG070693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Sep 2024 10:29:35 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Sep 2024 10:29:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Sep 2024 10:29:35 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48OFTZDb030827;
	Tue, 24 Sep 2024 10:29:35 -0500
Message-ID: <666e3f5a-6b22-4530-b018-c194f33415b8@ti.com>
Date: Tue, 24 Sep 2024 10:29:35 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: k3: Call of_node_put(rmem_np) only once in
 three functions
To: Markus Elfring <Markus.Elfring@web.de>, <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suman Anna <s-anna@ti.com>, Wadim Egorov <w.egorov@phytec.de>
CC: LKML <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <c46b06f9-72b1-420b-9dce-a392b982140e@web.de>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <c46b06f9-72b1-420b-9dce-a392b982140e@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 9/24/24 7:43 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Sep 2024 14:28:35 +0200
> 
> An of_node_put(rmem_np) call was immediately used after a pointer check
> for a of_reserved_mem_lookup() call in three function implementations.
> Thus call such a function only once instead directly before the checks.
> 
> This issue was transformed by using the Coccinelle software.
> 

Quick check of all the users of of_reserved_mem_lookup(), they almost
all do the same thing, get the phandle, mem_lookup, then node_put.

Maybe a helper function like this:

struct reserved_mem *of_reserved_mem_region_lookup(const struct device_node *node, int index)
{
	struct device_node *np;
	struct reserved_mem *rmem;

	np = of_parse_phandle(node, "memory-region", index);
	if (!np)
		return ERR_PTR(-ENODEV);

	rmem = of_reserved_mem_lookup(np);
	of_node_put(np);
	if (!rmem)
		return ERR_PTR(-EINVAL);

	return rmem;
}

Added to of_reserved_mem.c would allow us to clean up these cases in
this patch, and then several more spots (and also help force standard
property name usage).

Andrew

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 6 ++----
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 6 ++----
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 3 +--
>   3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 8be3f631c192..d08a3a98ada1 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -576,11 +576,9 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
>   			return -EINVAL;
> 
>   		rmem = of_reserved_mem_lookup(rmem_np);
> -		if (!rmem) {
> -			of_node_put(rmem_np);
> -			return -EINVAL;
> -		}
>   		of_node_put(rmem_np);
> +		if (!rmem)
> +			return -EINVAL;
> 
>   		kproc->rmem[i].bus_addr = rmem->base;
>   		/* 64-bit address regions currently not supported */
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 09f0484a90e1..a16fb165fced 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -433,11 +433,9 @@ static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
>   			return -EINVAL;
> 
>   		rmem = of_reserved_mem_lookup(rmem_np);
> -		if (!rmem) {
> -			of_node_put(rmem_np);
> -			return -EINVAL;
> -		}
>   		of_node_put(rmem_np);
> +		if (!rmem)
> +			return -EINVAL;
> 
>   		kproc->rmem[i].bus_addr = rmem->base;
>   		/* 64-bit address regions currently not supported */
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 747ee467da88..d0ebdd5cfa70 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1001,12 +1001,11 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
>   		}
> 
>   		rmem = of_reserved_mem_lookup(rmem_np);
> +		of_node_put(rmem_np);
>   		if (!rmem) {
> -			of_node_put(rmem_np);
>   			ret = -EINVAL;
>   			goto unmap_rmem;
>   		}
> -		of_node_put(rmem_np);
> 
>   		kproc->rmem[i].bus_addr = rmem->base;
>   		/*
> --
> 2.46.1
> 
