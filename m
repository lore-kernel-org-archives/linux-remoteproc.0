Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F761553BC;
	Thu,  8 Aug 2024 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723116873; cv=none; b=fBzIgvbQjh6M/534kc0InjGlMWMXzQJ1dfFFG/WeeBj6N/B+i7Eu5l+kiTY2zJVki2/ZE8mBGEa8kGk0NQs93V+ugB3LQliYYkK0iAC0m8XkLgbvB9NoC3Z+bftBFet9q+skYIRdvxfgb5zomneVpEzPALWz3lqWkuWL+FLjPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723116873; c=relaxed/simple;
	bh=rJ632/2HXgYfqvdqCczWULDp/kBirhizvMC/iVQ1Wwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hocGcz3P3nr71TdL0NgKxfcG0S1NVTJbrBTjsu87zlXfElWoNySon4dzqXBGtF54fQjwuw23aVnSOIkX7e3HFQ4mbRbMPKcB7v+ENzyaARuBzfa0rBJLk30XDaIjbMGyoC29WqJsh8GqiBpkFdFewZspm1mHitVBx3WJLKTmVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bfCeUeOV; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bfCeUeOV"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478BYRRM007149;
	Thu, 8 Aug 2024 06:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723116867;
	bh=x8gzlQYA21OyL1ksa7dZBBbA5uKVX57OH7MdZE3Zm94=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bfCeUeOVDymcCPDO0W9dY24pZcUZahwaeygNzNxltmY/Ij7IW3zuOXackuCxNbCnJ
	 0qQPz8wyY0UClPw+AuWEbjCeAqLFrYzaSqjhJfpkLs8VdeN0WAP8xpU0fDg9CF29Fw
	 gsJMjdJo8iBvaGrVnrDRdrHHY+Ogj7O4KmSrhG/Q=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478BYR6A093872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 06:34:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 06:34:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 06:34:27 -0500
Received: from [10.250.38.65] ([10.250.38.65])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478BYQhU106912;
	Thu, 8 Aug 2024 06:34:26 -0500
Message-ID: <a48af4c3-1500-ebdf-eaea-732bf06c9df1@ti.com>
Date: Thu, 8 Aug 2024 06:34:26 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/7] remoteproc: keystone: Use devm_kasprintf() to build
 name string
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240802182300.244055-1-afd@ti.com>
Content-Language: en-US
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <20240802182300.244055-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 8/2/24 13:22, Andrew Davis wrote:
> This is simpler and removes the need to assume the id length to be 1
> digit, which then removes a W=1 compile warning about the same.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
Acked/Tested-by: Hari Nagalla <hnagalla@ti.com>
> ---
>   drivers/remoteproc/keystone_remoteproc.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 7e57b90bcaf85..81b179e269a1e 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -366,8 +366,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>   	struct rproc *rproc;
>   	int dsp_id;
>   	char *fw_name = NULL;
> -	char *template = "keystone-dsp%d-fw";
> -	int name_len = 0;
>   	int ret = 0;
>   
>   	if (!np) {
> @@ -382,11 +380,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>   	}
>   
>   	/* construct a custom default fw name - subject to change in future */
> -	name_len = strlen(template); /* assuming a single digit alias */
> -	fw_name = devm_kzalloc(dev, name_len, GFP_KERNEL);
> +	fw_name = devm_kasprintf(dev, GFP_KERNEL, "keystone-dsp%d-fw", dsp_id);
>   	if (!fw_name)
>   		return -ENOMEM;
> -	snprintf(fw_name, name_len, template, dsp_id);
>   
>   	rproc = rproc_alloc(dev, dev_name(dev), &keystone_rproc_ops, fw_name,
>   			    sizeof(*ksproc));

