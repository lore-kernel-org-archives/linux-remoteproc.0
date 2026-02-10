Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16553431E6
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717969; cv=none; b=Jy7pFWC0N6N2Re8WOLa9uLq9PqHnWXQxoNasbOG04ajcWAVW5FiC7itRBzUaihs7nGrvKSL7pvQwuUaS5fBN4goNQh3lcJLpGw/auSLxS2a6NPgLg55zDAvdr/oZBUQVtbUuf5XtIb+XWVFqRSyjNEE6GtWQGY2Q+6WYlxWGPS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717969; c=relaxed/simple;
	bh=iSptxz8p4g6PdPf6HENwaDd6LV2JWc2F7IUKzPBclHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Y45d+q+rctjeX+yVn/jGJuarXvF1jKKexmzP0qHJQjh75zQFa+sGLLhfnuAO0yQjQ8YwXeUA2lhvkevtwQPqq97PfghOzlnJZTzroJY0y3y1LoFzBD3P8oGxAmEE8GcrYTBkCypbMUoDOigVtZAzwRccuU4iKAS7fZgbUqw1M6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hrD+eCg/; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hrD+eCg/"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260210100600euoutp0206488ff4bc033da24bb0805e95e27087~S2ppkMVn_1674516745euoutp02a
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 10:06:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260210100600euoutp0206488ff4bc033da24bb0805e95e27087~S2ppkMVn_1674516745euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770717960;
	bh=iqv5yu3rZHAdomhHqmBxnT8iNOSK+QFPJ3nRHhxnESE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hrD+eCg/x3K0GV2CXmRRwRD+jvUUYhvNtM57pZhyE9lLEtIn93hh2AJlgzXDCRapV
	 lwFjEEkBhpf0mKXEj7YZPu7crdfPQoHhbRCsnQAkK3vvYLaQGn5EDP2IgBFuI6MTXZ
	 IRA/OSUMD3hlbIXiIDuuNcF1fTiCS39qQvnk8jhI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260210100559eucas1p27d8d05bbeb0789cc784c731e60cbfd68~S2ppNelee1483214832eucas1p2V;
	Tue, 10 Feb 2026 10:05:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260210100559eusmtip29f0f19592053e074a3c00f4215774666~S2pog4J0N0437504375eusmtip2X;
	Tue, 10 Feb 2026 10:05:58 +0000 (GMT)
Message-ID: <871063b3-6293-4b62-b9a0-e637fac5dd27@samsung.com>
Date: Tue, 10 Feb 2026 11:05:57 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix reserved region mapping
 failure
To: "Rob Herring (Arm)" <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260128220243.3018526-1-robh@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260210100559eucas1p27d8d05bbeb0789cc784c731e60cbfd68
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260128220305eucas1p23e47ba043c0314765ce41478b4b8a0d6
X-EPHeader: CA
X-CMS-RootMailID: 20260128220305eucas1p23e47ba043c0314765ce41478b4b8a0d6
References: <CGME20260128220305eucas1p23e47ba043c0314765ce41478b4b8a0d6@eucas1p2.samsung.com>
	<20260128220243.3018526-1-robh@kernel.org>

On 28.01.2026 23:02, Rob Herring (Arm) wrote:
> Commit c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_*
> functions for "memory-region"") switched from devm_ioremap_wc() to
> devm_ioremap_resource_wc(). The difference is devm_ioremap_resource_wc()
> also requests the resource which fails. Testing of both fixed and
> dynamic reserved regions indicates that requesting the resource should
> work, so I'm not sure why it doesn't work in this case. Fix the issue by
> reverting back to devm_ioremap_wc().
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reported-by: André Apitzsch <git@apitzsch.eu>
> Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> I created some dummy regions matching the flags used here and did
> request_mem_region() on them successfully, so I'm not sure why it
> doesn't work for this driver. Something else is requesting the region?
>
> Perhaps there's a deferred probe and somehow request_mem_region() is not
> getting undone correctly?

I didn't manage to track what is the root cause of the 
request_mem_region() failure, but this is definitely not related to 
deferred probe. This function is called only once from the qcom_wcnss 
driver and fails, because the region is already assigned to 'reserved' 
owner.

> ---
>   drivers/remoteproc/qcom_wcnss.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index ee18bf2e8054..4add9037dbd5 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -537,7 +537,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>   
>   	wcnss->mem_phys = wcnss->mem_reloc = res.start;
>   	wcnss->mem_size = resource_size(&res);
> -	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
> +	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
>   	if (IS_ERR(wcnss->mem_region)) {
>   		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
>   		return PTR_ERR(wcnss->mem_region);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

