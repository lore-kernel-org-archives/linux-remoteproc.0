Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9248C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 09:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81D1A60F35
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 09:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhHIJ5z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Aug 2021 05:57:55 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24962 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbhHIJ5y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Aug 2021 05:57:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628503054; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Z2qKMHaBBf4V2dXurrhUXPgNh/wH4eq/5Nkqig/rsv0=; b=GHycJDzudl9CzmWJ/czh05cUNNsYj1ikSwGL4kbn1BpFhXCZQCqXw6g8V9SJRmztMR2zu0sk
 3b5QmIvnFyX/4VroUffwIaeF1x72ktupM8gwL4ziipjvpSgg2hR8anc11Vc0z9xrHLgJwDQQ
 lF7X2e2soYE07dJGnhRB7/P78rE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6110fc0dad1af6394935be47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Aug 2021 09:57:33
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC4A4C433F1; Mon,  9 Aug 2021 09:57:32 +0000 (UTC)
Received: from [192.168.1.3] (unknown [106.202.252.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CB63C433D3;
        Mon,  9 Aug 2021 09:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CB63C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
Subject: Re: [PATCH V5 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org>
 <1628161974-7182-2-git-send-email-deesin@codeaurora.org>
 <CAE-0n50fN42fhAcoCJBz-PEW5sEdqSKT5YuaxWE_29J=P1=vQw@mail.gmail.com>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <4b3b6b0f-8c21-53ce-4341-1e8686d3b73c@codeaurora.org>
Date:   Mon, 9 Aug 2021 15:27:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n50fN42fhAcoCJBz-PEW5sEdqSKT5YuaxWE_29J=P1=vQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 8/6/2021 12:04 AM, Stephen Boyd wrote:
> Quoting Deepak Kumar Singh (2021-08-05 04:12:53)
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index 934fcc4..b84cb31 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -515,6 +521,43 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
>>                  thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>>   }
>>
>> +/**
>> + * qmp_get() - get a qmp handle from a device
>> + * @dev: client device pointer
>> + *
>> + * Return: handle to qmp device on success, ERR_PTR() on failure
>> + */
>> +struct qmp *qmp_get(struct device *dev)
>> +{
>> +       struct platform_device *pdev;
>> +       struct device_node *np;
>> +       struct qmp *qmp;
>> +
>> +       if (!dev || !dev->of_node)
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
>> +       if (!np)
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       pdev = of_find_device_by_node(np);
>> +       of_node_put(np);
>> +       if (!pdev)
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       qmp = platform_get_drvdata(pdev);
>> +
>> +       return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
>> +}
>> +EXPORT_SYMBOL(qmp_get);
>> +
>> +void qmp_put(struct qmp *qmp)
>> +{
>> +       if (!IS_ERR_OR_NULL(qmp))
>> +               put_device(qmp->dev);
> Where is the corresponding get_device() call?
of_find_device_by_node() internally calls get_device(), so no need to 
call get_device() explicitly.
>
>> +}
>> +EXPORT_SYMBOL(qmp_put);
>> +
>>   static int qmp_probe(struct platform_device *pdev)
>>   {
>>          struct resource *res;
