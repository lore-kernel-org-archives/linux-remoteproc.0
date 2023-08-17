Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6599CC2FC14
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Aug 2023 07:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348343AbjHQHDa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Aug 2023 03:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240745AbjHQHC7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Aug 2023 03:02:59 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528A21990
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Aug 2023 00:02:57 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37H2xhQf011907;
        Thu, 17 Aug 2023 09:02:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=mcOlTFofgoUpQNGHoCKfDBf2Ru3FFC1zH+ZUKjGlA6A=; b=hM
        KsVp5Krkb/6dnnHZ9iuYC2vKYzsumx5CgJGwzdfUVmqGqxLAXFfngMmazMZhgQ1w
        FL8vPTtss/2tbi2mukKci5K/YmUDZk8+QC71B5upKmpaSeOqSOqRtAS6Ixod43lW
        oFhR3caLalYVFCdbtajxcpj1BfzhqHS2y0BpejxYSWVlqYcTFwLq9iuJ2bDAVZCR
        X2upioNGz+fi8KDrG5wkkM7vmg2yaPpo6OBHUBAP6GTDQ3BmkjIy4eEVTNIHb/wE
        KFjysTXEFKItTmEbr/gJYwhGbojtmu6tx+wgBIlbSLn8trANlYxHNfLr5SibPEwT
        iBmrKf2zzXGM/Znm8+7g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3shb8p1251-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Aug 2023 09:02:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60039100053;
        Thu, 17 Aug 2023 09:02:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57C732105BB;
        Thu, 17 Aug 2023 09:02:19 +0200 (CEST)
Received: from [10.201.22.206] (10.201.22.206) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 17 Aug
 2023 09:02:18 +0200
Message-ID: <6114a65d-699c-72da-4f9a-dbb5e1c58fd4@foss.st.com>
Date:   Thu, 17 Aug 2023 09:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] remoteproc: stm32: Clean up redundant
 dev_err_probe()
Content-Language: en-US
To:     "chenjiahao (C)" <chenjiahao16@huawei.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20230802095128.995428-1-chenjiahao16@huawei.com>
 <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
 <97ed3bff-424c-3df3-47ed-e74c34412813@huawei.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <97ed3bff-424c-3df3-47ed-e74c34412813@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.22.206]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_03,2023-08-15_02,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 8/17/23 04:33, chenjiahao (C) wrote:
> 
> On 2023/8/16 20:46, Arnaud POULIQUEN wrote:
>> Hi,
>>
>> On 8/2/23 11:51, Chen Jiahao wrote:
>>> Referring to platform_get_irq()'s definition, the return value has
>>> already been checked if ret < 0, and printed via dev_err_probe().
>>> Calling dev_err_probe() one more time outside platform_get_irq()
>>> is obviously redundant.
>>>
>>> Removing dev_err_probe() outside platform_get_irq() to clean up
>>> above problem.
>>>
>>> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
>>> ---
>>>   drivers/remoteproc/stm32_rproc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>> index 98234b44f038..a09eeb83ea5c 100644
>>> --- a/drivers/remoteproc/stm32_rproc.c
>>> +++ b/drivers/remoteproc/stm32_rproc.c
>>> @@ -714,7 +714,7 @@ static int stm32_rproc_parse_dt(struct platform_device
>>> *pdev,
>>>         irq = platform_get_irq(pdev, 0);
>>>       if (irq == -EPROBE_DEFER)
>>> -        return dev_err_probe(dev, irq, "failed to get interrupt\n");
>>> +        return irq;
>> The IRQ is optional so using platform_get_irq_optional seems a better option
>> to me.
>>
>> -      irq = platform_get_irq(pdev, 0);
>> +      irq = platform_get_irq_optional(pdev, 0);
> 
> Hi,
> 
> Thanks for your reminding.
> 
> It seems that platform_get_irq is nothing more than platform_get_irq_optional,
> except wrapping a dev_err_probe for error code checking. So using the former
> one should also be OK.
> 
> Or have I missed anywhere else?

The main difference is that platform_get_irq prints an error message, while
platform_get_irq just returns without print.


The IRQ is optional, It would be better to only include traces that is necessary
and useful for debugging purposes.

Best Regards,
Arnaud


> 
> Best Regards,
> Jiahao
> 
>>>       if (irq == -EPROBE_DEFER)
>>>         return dev_err_probe(dev, irq, "failed to get interrupt\n");
>> Thanks,
>> Arnaud
>>
>>>         if (irq > 0) {
>>>           err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
