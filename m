Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91733C83F01
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Aug 2023 18:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243955AbjH3Sxi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244151AbjH3Mgf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Aug 2023 08:36:35 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3B6E8
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Aug 2023 05:36:32 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37UBL88E027999;
        Wed, 30 Aug 2023 14:36:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=TVjHOMfIvHnhXZgmkgu5yeOnP4NQn5eVFY7/Gu58+xs=; b=vU
        9OqRoAkJFOlaPOtrJw2a3c/NxTJazJ9Zc6IVP2NI8+7qLKjmvc8CcI60U84ytFV6
        u77xieOMFh7Kg9HjuJwdDDv0cFNECPGkizLMnwelcucjKihL8mAC9/7+hE0Cvfqs
        fO0vUEFudJlIQ414TH1eV7xL6qMQrQW3rxcjJq57muVOjMnMGorO3jWAkLJCcnWz
        NSdfE6Mf3Y6k5IyA1AtanU9XVC2L+t+rLs9QcEC8zoOjba9u1PA1H6BwvaChNJTR
        Pz7yYbx3IVl5hyAxhK4F19ad2BK7GguJvpW4VkAhvr7qQuIMGtDNXnHTHRgdf7IL
        ocACS3yVzEFV02xbHzJA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq89c12um-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 14:36:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8E01100057;
        Wed, 30 Aug 2023 14:36:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EC6924551B;
        Wed, 30 Aug 2023 14:36:03 +0200 (CEST)
Received: from [10.201.21.213] (10.201.21.213) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 30 Aug
 2023 14:36:02 +0200
Message-ID: <defc711e-8c13-6d13-abb3-121f8b341b0e@foss.st.com>
Date:   Wed, 30 Aug 2023 14:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Linux-stm32] [PATCH -next v2] remoteproc: stm32: Clean up
 redundant dev_err_probe()
Content-Language: en-US
To:     Chen Jiahao <chenjiahao16@huawei.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20230817083336.404635-1-chenjiahao16@huawei.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230817083336.404635-1-chenjiahao16@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi chen

On 8/17/23 10:33, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant. Removing outside dev_err_probe() to
> clean it up.
> 
> Besides, switch to use platform_get_irq_optional() since the irq
> is optional here.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Sorry for the late answer, my company's mail server drop the email :(

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks!
Arnaud

> ---
>  drivers/remoteproc/stm32_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 98234b44f038..1f53c672c66b 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -712,9 +712,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  	unsigned int tzen;
>  	int err, irq;
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
> -		return dev_err_probe(dev, irq, "failed to get interrupt\n");
> +		return irq;
>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
