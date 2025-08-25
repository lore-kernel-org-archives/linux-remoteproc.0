Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BC525A2B5;
	Mon, 25 Aug 2025 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756146574; cv=none; b=pJY0ad1WLEda1hT+e+7B+ef8267rsrEWOacmYu5mC85sjwOVgBuLmBi5HQ4j6yq4aCP1vCN8kwQfARHkXnPjOye4tPJntuLATPUJGWZnqZMMTPdUFFhuhJ1jq2pZNSYFUOiWQktxHWYFy0vQTC3ql480Kw8tUZBpJvO2f8An6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756146574; c=relaxed/simple;
	bh=6NGYoqzOovMHUP26BRfh3j297+VgIkmMJVxyTnJHQDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r5ZYIPsWb2LBJxEEIIwqpPtTFzOZCX5rii7HfjA8ThMDoGKBymfspX+m03ESyzLEfMYVRUkS7pbaW/GNPtQHtzGFXu+up0fgpeUQEpq8+JKeN+zeg/ziePLipKvUE5yEAu3ZINUNaJqnwpTnLZLUS5BrOI15LQ/fr+2GtSi2ODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BZU82aSz; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BZU82aSz"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PITRR3872942;
	Mon, 25 Aug 2025 13:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756146567;
	bh=OCn0fgfyr7GShlQoJ1NG5nuaGmBG/jRsdUFrvMEem/E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BZU82aSzA4fM99yZGoBVavgkDy6NYt5LhjCDwsvMowsWeRaerZUUG2R7/YGF1+HkH
	 IZsiVofG9VbT15dtvkuGsKTmA/WXDkI98I88+1jyShWbYLiDZOaztZGgJlGAd2mXvp
	 NHU7KA4IK+PRwBLyUweAfQxom0nTT2jTR6kGxtrw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PITR7W1778513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 13:29:27 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 13:29:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 13:29:26 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PITQhS4050560;
	Mon, 25 Aug 2025 13:29:26 -0500
Message-ID: <d54e1cb6-388d-4e0e-a3a0-387ed87082ce@ti.com>
Date: Mon, 25 Aug 2025 13:29:26 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: da8xx: Use devm action to release
 reserved memory
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250814135532.638040-1-afd@ti.com>
 <20250814135532.638040-2-afd@ti.com> <aKyXjH-3lnCYM2rG@p14s>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <aKyXjH-3lnCYM2rG@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 8/25/25 12:04 PM, Mathieu Poirier wrote:
> On Thu, Aug 14, 2025 at 08:55:31AM -0500, Andrew Davis wrote:
>> This helps prevent mistakes like freeing out of order in cleanup functions
>> and forgetting to free on error paths.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/remoteproc/da8xx_remoteproc.c | 30 +++++++++++++--------------
>>   1 file changed, 14 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
>> index 47df21bea5254..58b4f05283d92 100644
>> --- a/drivers/remoteproc/da8xx_remoteproc.c
>> +++ b/drivers/remoteproc/da8xx_remoteproc.c
>> @@ -233,6 +233,13 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
>>   	return 0;
>>   }
>>   
>> +static void da8xx_rproc_mem_release(void *data)
>> +{
>> +	struct device *dev = data;
>> +
> 
> The check for dev->of_node from "free_mem" is missing.  I can add it if you
> agree.
> 

It should not be needed, this devm_action callback is added inside a if(dev->of_node)
block below, so this will only be called iff dev->of_node is not null.

Andrew

>> +	of_reserved_mem_device_release(dev);
>> +}
>> +
>>   static int da8xx_rproc_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -274,14 +281,13 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>>   		ret = of_reserved_mem_device_init(dev);
>>   		if (ret)
>>   			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
>> +		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
>>   	}
>>   
>>   	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
>>   				 sizeof(*drproc));
>> -	if (!rproc) {
>> -		ret = -ENOMEM;
>> -		goto free_mem;
>> -	}
>> +	if (!rproc)
>> +		return -ENOMEM;
>>   
>>   	/* error recovery is not supported at present */
>>   	rproc->recovery_disabled = true;
>> @@ -294,7 +300,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>>   
>>   	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
>>   	if (ret)
>> -		goto free_mem;
>> +		return ret;
>>   
>>   	platform_set_drvdata(pdev, rproc);
>>   
>> @@ -304,7 +310,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>>   					rproc);
>>   	if (ret) {
>>   		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
>> -		goto free_mem;
>> +		return ret;
>>   	}
>>   
>>   	/*
>> @@ -314,7 +320,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>>   	 */
>>   	ret = reset_control_assert(dsp_reset);
>>   	if (ret)
>> -		goto free_mem;
>> +		return ret;
>>   
>>   	drproc->chipsig = chipsig;
>>   	drproc->bootreg = bootreg;
>> @@ -325,22 +331,16 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>>   	ret = rproc_add(rproc);
>>   	if (ret) {
>>   		dev_err(dev, "rproc_add failed: %d\n", ret);
>> -		goto free_mem;
>> +		return ret;
>>   	}
>>   
>>   	return 0;
>> -
>> -free_mem:
>> -	if (dev->of_node)
>> -		of_reserved_mem_device_release(dev);
>> -	return ret;
>>   }
>>   
>>   static void da8xx_rproc_remove(struct platform_device *pdev)
>>   {
>>   	struct rproc *rproc = platform_get_drvdata(pdev);
>>   	struct da8xx_rproc *drproc = rproc->priv;
>> -	struct device *dev = &pdev->dev;
>>   
>>   	/*
>>   	 * The devm subsystem might end up releasing things before
>> @@ -350,8 +350,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
>>   	disable_irq(drproc->irq);
>>   
>>   	rproc_del(rproc);
>> -	if (dev->of_node)
>> -		of_reserved_mem_device_release(dev);
>>   }
>>   
>>   static const struct of_device_id davinci_rproc_of_match[] __maybe_unused = {
>> -- 
>> 2.39.2
>>

