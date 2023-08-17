Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73460EB64DD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Aug 2023 08:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348865AbjHQIU5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Aug 2023 04:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348856AbjHQIUg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Aug 2023 04:20:36 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E272D77
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Aug 2023 01:20:33 -0700 (PDT)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRHsd2ryWztSb0;
        Thu, 17 Aug 2023 16:16:53 +0800 (CST)
Received: from [10.67.108.26] (10.67.108.26) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 16:20:30 +0800
Message-ID: <db4a6afa-62d1-b652-9e4a-b8f8bccde8e2@huawei.com>
Date:   Thu, 17 Aug 2023 16:20:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next] remoteproc: stm32: Clean up redundant
 dev_err_probe()
Content-Language: en-US
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20230802095128.995428-1-chenjiahao16@huawei.com>
 <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
 <97ed3bff-424c-3df3-47ed-e74c34412813@huawei.com>
 <6114a65d-699c-72da-4f9a-dbb5e1c58fd4@foss.st.com>
From:   "chenjiahao (C)" <chenjiahao16@huawei.com>
In-Reply-To: <6114a65d-699c-72da-4f9a-dbb5e1c58fd4@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.26]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 2023/8/17 15:02, Arnaud POULIQUEN wrote:
>
> On 8/17/23 04:33, chenjiahao (C) wrote:
>> On 2023/8/16 20:46, Arnaud POULIQUEN wrote:
>>> Hi,
>>>
>>> On 8/2/23 11:51, Chen Jiahao wrote:
>>>> Referring to platform_get_irq()'s definition, the return value has
>>>> already been checked if ret < 0, and printed via dev_err_probe().
>>>> Calling dev_err_probe() one more time outside platform_get_irq()
>>>> is obviously redundant.
>>>>
>>>> Removing dev_err_probe() outside platform_get_irq() to clean up
>>>> above problem.
>>>>
>>>> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
>>>> ---
>>>>    drivers/remoteproc/stm32_rproc.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>>> index 98234b44f038..a09eeb83ea5c 100644
>>>> --- a/drivers/remoteproc/stm32_rproc.c
>>>> +++ b/drivers/remoteproc/stm32_rproc.c
>>>> @@ -714,7 +714,7 @@ static int stm32_rproc_parse_dt(struct platform_device
>>>> *pdev,
>>>>          irq = platform_get_irq(pdev, 0);
>>>>        if (irq == -EPROBE_DEFER)
>>>> -        return dev_err_probe(dev, irq, "failed to get interrupt\n");
>>>> +        return irq;
>>> The IRQ is optional so using platform_get_irq_optional seems a better option
>>> to me.
>>>
>>> -      irq = platform_get_irq(pdev, 0);
>>> +      irq = platform_get_irq_optional(pdev, 0);
>> Hi,
>>
>> Thanks for your reminding.
>>
>> It seems that platform_get_irq is nothing more than platform_get_irq_optional,
>> except wrapping a dev_err_probe for error code checking. So using the former
>> one should also be OK.
>>
>> Or have I missed anywhere else?
> The main difference is that platform_get_irq prints an error message, while
> platform_get_irq just returns without print.
>
>
> The IRQ is optional, It would be better to only include traces that is necessary
> and useful for debugging purposes.

Make sense. I will update a v2 patch soon.

Thanks

>
> Best Regards,
> Arnaud
>
>
>> Best Regards,
>> Jiahao
>>
>>>>        if (irq == -EPROBE_DEFER)
>>>>          return dev_err_probe(dev, irq, "failed to get interrupt\n");
>>> Thanks,
>>> Arnaud
>>>
>>>>          if (irq > 0) {
>>>>            err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
