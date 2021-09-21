Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0859C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBC8861100
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 10:29:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhIUKai (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Sep 2021 06:30:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16326 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231615AbhIUKah (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Sep 2021 06:30:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632220149; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LqapVmBEbKGHm5asiD093kwO082i8COLKxB74YyhX8U=; b=oLMr2pJWGweHA6qzJhJrcvkNF5H1pDJLJ/ZedpBRv1d/42zwQl4z1aoiczlpgQUt+b71QuQm
 gGm+oMRYHw6yS4pf391d6/lz5YMreCjC9YbuNKYnBhzywVlp3LInBos742XuYaVHvOuBoIED
 3XZyIYAiBWfKavAUgx1myirOVXk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6149b3dcbd6681d8ed3cfef4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 10:28:44
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 05447C43460; Tue, 21 Sep 2021 10:28:44 +0000 (UTC)
Received: from [192.168.1.3] (unknown [110.226.75.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4157C4360C;
        Tue, 21 Sep 2021 10:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A4157C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH V4 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P
 IRQ
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1631991735-18920-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n52Gqossa9V-tPLHsgggQ_MHt_zD7gzrjUVrU7Rno-4f8w@mail.gmail.com>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <de5de2e2-a233-b94b-7846-5a7d149f497c@codeaurora.org>
Date:   Tue, 21 Sep 2021 15:58:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52Gqossa9V-tPLHsgggQ_MHt_zD7gzrjUVrU7Rno-4f8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 9/21/2021 12:07 AM, Stephen Boyd wrote:
> Quoting Deepak Kumar Singh (2021-09-18 12:02:15)
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index 2df4883..60ad632 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include <linux/regmap.h>
>>   #include <linux/soc/qcom/smem.h>
>>   #include <linux/soc/qcom/smem_state.h>
>> @@ -538,9 +539,26 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>>                  goto unwind_interfaces;
>>          }
>>
>> +       /*
>> +        * Treat smp2p interrupt as wakeup source, but keep it disabled
>> +        * by default. User space can decide enabling it depending on its
>> +        * use cases. For example if remoteproc crashes and device wants
>> +        * to handle it immediatedly (e.g. to not miss phone calls) it can
>> +        * enable wakeup source from user space, while other devices which
>> +        * do not have proper autosleep feature may want to handle it with
>> +        * other wakeup events (e.g. Power button) instead waking up immediately.
>> +        */
>> +       device_set_wakeup_capable(&pdev->dev, true);
>> +
>> +       ret = dev_pm_set_wake_irq(&pdev->dev, irq);
>> +       if (ret)
>> +               goto set_wake_irq_fail;
>>
>>          return 0;
>>
>> +set_wake_irq_fail:
>> +       dev_pm_clear_wake_irq(&pdev->dev);
>> +
>>   unwind_interfaces:
>>          list_for_each_entry(entry, &smp2p->inbound, node)
>>                  irq_domain_remove(entry->domain);
>> @@ -565,6 +583,9 @@ static int qcom_smp2p_remove(struct platform_device *pdev)
>>          struct qcom_smp2p *smp2p = platform_get_drvdata(pdev);
>>          struct smp2p_entry *entry;
>>
>> +       dev_pm_clear_wake_irq(&pdev->dev);
>> +       device_init_wakeup(&pdev->dev, false);
> Is this device_init_wakeup() call necessary? It looks like we can get
> away without it and then once this driver probes the device will have
> the wakeup capability set on it. Future binding/unbinding of the driver
> will keep working.

ok, cleanup is handled in device_unregister() path. So it is redundant here.

I will remove this in next patch.

