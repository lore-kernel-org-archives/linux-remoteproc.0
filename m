Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDF6C001B0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Aug 2023 12:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243985AbjHPMrZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Aug 2023 08:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244745AbjHPMrK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Aug 2023 08:47:10 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DE326B7
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Aug 2023 05:47:07 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37G8qjtr002221;
        Wed, 16 Aug 2023 14:46:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=6IIIYqjWahj7HUzOMPEBtJ+VyAunz06AUZOLbTWwnEU=; b=TP
        EX7qATYUhi4HYq1GpcVtDfJu3ZTtdv/S42UgzOw2VwLhKWxzEq/WxVRIcfi3sWXS
        2c+dK4XixYxi5Qn/aRmPPgRnRco+YOLfubYKg0Q6yB/zQp3+CmwOBmynWF/HZr1U
        cIyV9rh61OEA3XU0DLAi0Rc5VM4V4DAQ1xKIiqlY8++x8QxpQe6AxPfCx5s52hDT
        qj48yKhWz/d+37psnkB9OcvU2MAIulWcdV5ktSKpTcc43iFXK5FOsVhXZ6gPkpsd
        MUcbMWbgy9wzb+UuIPKYpESmOlPFAZI/GHY3NdEOcDaT9VBdEL7alxmTHBvvm0RP
        dIeUonqwYPAzGoHOBZSA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgth61r3b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Aug 2023 14:46:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBAED100061;
        Wed, 16 Aug 2023 14:46:34 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3B51237D9B;
        Wed, 16 Aug 2023 14:46:34 +0200 (CEST)
Received: from [10.201.22.206] (10.201.22.206) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 14:46:34 +0200
Message-ID: <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
Date:   Wed, 16 Aug 2023 14:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] remoteproc: stm32: Clean up redundant
 dev_err_probe()
Content-Language: en-US
To:     Chen Jiahao <chenjiahao16@huawei.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20230802095128.995428-1-chenjiahao16@huawei.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230802095128.995428-1-chenjiahao16@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.22.206]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On 8/2/23 11:51, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
> 
> Removing dev_err_probe() outside platform_get_irq() to clean up
> above problem.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 98234b44f038..a09eeb83ea5c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -714,7 +714,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
> -		return dev_err_probe(dev, irq, "failed to get interrupt\n");
> +		return irq;

The IRQ is optional so using platform_get_irq_optional seems a better option to me.

-  	irq = platform_get_irq(pdev, 0);
+  	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
>		return dev_err_probe(dev, irq, "failed to get interrupt\n");

Thanks,
Arnaud

>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
