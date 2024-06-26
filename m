Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B214D458
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 19:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428450; cv=none; b=tKmvfLDuFdglMpd1t63kWaPAF1FigfjzMROp3+cKEbkfmgR4xxaixkp5NSuY8HUlDwb5sKXvrjW9F+HAR2sSOEC0YAQ0sBKCCfUK5lgjihdVtGTdksfsybjDX2Z35QG0t8nniQJ9gzhznkFL+pPqgQ2iXC1u4KUQZASVLQKycp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428450; c=relaxed/simple;
	bh=v4bLV4jmhvJseRbPLHNASiuysy2YhxfJE8ihKJ5x/o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LkXdjxGdwKRLGbuH5dyKK3VStOar3+xV4GpqYetcMAjzzVjltvTXgbOW5RQ0RKnWfwpd/WMRsKoDPq8ki3rRq69sR3GFZ7A9H0jPIJ0c76b5/VAylUravleJBZcrHJg/hABttQRq/mp+yB1Xth3c1lhinLGyJkKw57nzgRr5aBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=YmG2WF0h; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="YmG2WF0h"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1719428438; x=1722020438;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v4bLV4jmhvJseRbPLHNASiuysy2YhxfJE8ihKJ5x/o8=;
	b=YmG2WF0hl1LHYc1EiUa5OcNh1ENDlgpSyqIJw8O+cs5IaCobW3RZgQmhlvZQJRIB
	yVY6FIK8V024zqvlSjbHrcrpgKC+rY4s//KnHCwB0y98pvoPSbRwnzNVd4s53ID/
	U5eTd8g9bNwSCOTEgmCy8yQaz9ePRQnJUBkoEL30A5I=;
X-AuditID: ac14000a-03251700000021bc-b3-667c655632e1
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D0.B1.08636.6556C766; Wed, 26 Jun 2024 21:00:38 +0200 (CEST)
Received: from [192.168.10.3] (172.25.0.11) by Berlix.phytec.de (172.25.0.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 26 Jun
 2024 21:00:37 +0200
Message-ID: <f426d54e-9e70-4dfa-a989-c3b21aeca85a@phytec.de>
Date: Wed, 26 Jun 2024 21:00:36 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: k3-r5: Fix log levels where appropriate
To: Garrett Giordano <ggiordano@phytec.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>
References: <20240626162203.3484272-1-ggiordano@phytec.com>
 <20240626162203.3484272-2-ggiordano@phytec.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20240626162203.3484272-2-ggiordano@phytec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWyRpKBRzcstSbNYOYMOYttHTYW67f8ZrO4
	vGsOm0XzeSWLrXsOMFl0v1N3YPPYtKqTzePOtT1sHv3dLawefy6+Y/X4vEkugDWKyyYlNSez
	LLVI3y6BK2Pqr9fsBVs5Kvp/trA2MH5i62Lk5JAQMJHYM/kpYxcjF4eQwBImiTePr7BAOHcZ
	JZrfzmLqYuTg4BWwkbi9SQqkgUVAVWLy1T4mEJtXQFDi5MwnLCC2qIC8xP1bM9hBbGEBH4kJ
	e1Ywg9giAskS0/4uA7OZBVIkXq3aCNYrJJArcfvcZiaIuLjErSfzwWw2AXWJOxu+sYLYnEBr
	Z57eDVVjIbH4zUF2CFteYvvbOcwQc+QlXlxazgLxjLzEtHOvmSHsUIkjm1YzTWAUnoXk1FlI
	1s1CMnYWkrELGFlWMQrlZiZnpxZlZusVZFSWpCbrpaRuYgTFiwgD1w7GvjkehxiZOBgPMUpw
	MCuJ8IaWVKUJ8aYkVlalFuXHF5XmpBYfYpTmYFES513dEZwqJJCeWJKanZpakFoEk2Xi4JRq
	YPRe+v+fhojZ2Y6o0LiGMG9uqQdz3Et/nz8tIiEjebKm1olfcIJgiH9o/qqyjeZZb+YVL+D2
	lxedrZK+SLREUWRhxPbP8zzX7Fh+tvyzTVTVxgezeX/OmTSfsSru6hwtvul5qj21iu/Y1zpn
	V95+HCDQ6fo1+7rlq/l7trPNuaaQo3fm5KxHv5VYijMSDbWYi4oTAYAH5oyFAgAA

Hi Garrett,

Am 26.06.24 um 18:22 schrieb Garrett Giordano:
> Driver was logging information as debug. Changed dev_dbg to dev_info
> where appropriate.
> 
> Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
> ---
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 50e486bcfa10..5821b6517063 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -558,7 +558,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   
>   	boot_addr = rproc->bootaddr;
>   	/* TODO: add boot_addr sanity checking */
> -	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
> +	dev_info(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
There is no need for this debug message to be in info level.

Regards,
Wadim
>   
>   	/* boot vector need not be programmed for Core1 in LockStep mode */
>   	core = kproc->core;
