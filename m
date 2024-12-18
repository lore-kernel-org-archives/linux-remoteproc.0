Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712C1684A0;
	Wed, 18 Dec 2024 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734510138; cv=none; b=SaN3JGLBR58M/kn0gc6mrb7J8KhStWk5jc3TTNnq3MCDRoMSWsEM2dwLjntfrm2Hf2CY60zwxTpp2/IQ93V9L7v2YNI7k+1uqst+Yz7GV01jWdwua8pgThSJ2XzpdywSwl7UiM7a0mj5kQEKwG5y74NcX2TSKNxlhC6Za3bHu5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734510138; c=relaxed/simple;
	bh=hMOLPjzkFmjf53KhdpF7HTD2JUXwH8PwLdbJCz8uvqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P2D+Ok0uIudZtEHpbES0jKIRdqgZcuDb6AAO0d2zfttw2XJAuaCA/4CovGtvO267u2ci3IwxuoCaDGZwbRzZ0C2+0e4pT+UXqfkTc1lr3iVT986qLcYL0U7HLqdeDp/7/LqU98UpnoUDtHTk349NU3pJ6Kr5Hfydfk2uyN9CjSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s0xU5Wdd; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s0xU5Wdd"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BI8M7qI122699;
	Wed, 18 Dec 2024 02:22:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734510127;
	bh=GMCvp2rQMRfmb708Od1+CPmM7/o7Cj0/dp2/zO/UWo0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=s0xU5WddLm0esZyKT1gJgapOwW6bNOxFcKqPZ6FNvNZ7geeZR6uAe44twuns7864X
	 TvbsAjOdoy+7mAtfHaqMNvkz9Kzx4qgF7JnBvEcQszoDNPLoJqydeXDX1NSXnrPOL9
	 lZ9+vY2SWXFgUIhkONQMfpZo5L0t/omO9iKRDHag=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BI8M7ha021697;
	Wed, 18 Dec 2024 02:22:07 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 02:22:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 02:22:07 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BI8M4nB108754;
	Wed, 18 Dec 2024 02:22:04 -0600
Message-ID: <220b906c-3f16-44d9-b5c3-ad002057e20b@ti.com>
Date: Wed, 18 Dec 2024 13:52:03 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] remoteproc: k3-r5: Add devm action to release tsp
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241204111130.2218497-1-b-padhi@ti.com>
 <20241204111130.2218497-4-b-padhi@ti.com>
 <85dc5e05-5d54-4d0f-a7e2-24134a5392f5@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <85dc5e05-5d54-4d0f-a7e2-24134a5392f5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 17/12/24 21:30, Andrew Davis wrote:
> On 12/4/24 5:11 AM, Beleswar Padhi wrote:
>> Use a device lifecycle managed action to release tsp ti_sci_proc handle.
>> This helps prevent mistakes like releasing out of order in cleanup
>> functions and forgetting to release on error paths.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 0753a5c35c7e..2966cb210403 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -1513,6 +1513,13 @@ static int 
>> k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
>>       return 0;
>>   }
>>   +static void k3_r5_release_tsp(void *data)
>> +{
>> +    struct ti_sci_proc *tsp = data;
>> +
>> +    ti_sci_proc_release(tsp);
>> +}
>> +
>>   static int k3_r5_core_of_init(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -1606,6 +1613,10 @@ static int k3_r5_core_of_init(struct 
>> platform_device *pdev)
>>           goto err;
>>       }
>>   +    ret = devm_add_action_or_reset(dev, k3_r5_release_tsp, 
>> core->tsp);
>> +    if (ret)
>> +        goto err;
>> +
>>       platform_set_drvdata(pdev, core);
>>       devres_close_group(dev, k3_r5_core_of_init);
>>   @@ -1622,13 +1633,7 @@ static int k3_r5_core_of_init(struct 
>> platform_device *pdev)
>>    */
>>   static void k3_r5_core_of_exit(struct platform_device *pdev)
>>   {
>> -    struct k3_r5_core *core = platform_get_drvdata(pdev);
>>       struct device *dev = &pdev->dev;
>> -    int ret;
>> -
>> -    ret = ti_sci_proc_release(core->tsp);
>> -    if (ret)
>> -        dev_err(dev, "failed to release proc, ret = %d\n", ret);
>
> One thing to remember is devm unrolling happens after remove(). So
> here you are changing the order things happen. ti_sci_proc_release()
> now will get called after the below functions. This most likely
> isn't wrong, but to make review easier it helps to start from the
> last called function in remove() and work backwards so nothing
> is reordered.


That's a great insight! Will send out v2 following this order.

Thanks,
Beleswar

>
> Andrew
>
>>       platform_set_drvdata(pdev, NULL);
>>       devres_release_group(dev, k3_r5_core_of_init);
