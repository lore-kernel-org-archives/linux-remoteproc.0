Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB84FC7EE23
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 May 2023 17:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjEIRM2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 May 2023 13:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbjEIRMM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 May 2023 13:12:12 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3603930D5
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 May 2023 10:11:42 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349CIsXA020568;
        Tue, 9 May 2023 19:11:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mn5jOxLh1H2LGQF8BkirJjrvG/rHRFFa5N/haTu7SCk=;
 b=w1GEJOugTU6MG/OSxcxzMhyVxUpsKNitOvKtS0QqiQsycyC9Ssr3FD1HyAidp6nGnBjN
 wVLKmYLS7oTOYIbXqsMwwAfeT/OK2hOdQ4BWSG/cWxaaMQFi1RKT3fMY/DljnhqgZsDW
 UowzfJ7pVeTbHDwgnwOdplKXWHIV+fKqg4+xvlmzf7+cRFE6XI3F6Zs7tunHrtbLGhRq
 JGSntJi2FDLMhoTwFdo0kq5Q2lJkUQzIci70Qw8a87XjMrWjSqJiYrO8eZEBZtiIcK5d
 gSB0QkWgHLUtk4NoWnnOfnUsvLAr8EntsH/VNB68fkSZFw23FU3RFVScOGiUJxU/FT7d 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf79heekw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 19:11:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CA4010002A;
        Tue,  9 May 2023 19:11:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04BC7231506;
        Tue,  9 May 2023 19:11:19 +0200 (CEST)
Received: from [10.252.28.195] (10.252.28.195) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 19:11:17 +0200
Message-ID: <e14f7bc4-6705-6be6-3393-69ea962ab6ac@foss.st.com>
Date:   Tue, 9 May 2023 19:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/18] remoteproc: stm32: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-18-u.kleine-koenig@pengutronix.de>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230504194453.1150368-18-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.28.195]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_10,2023-05-05_01,2023-02-09_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Uwe,

On 5/4/23 21:44, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud

> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/remoteproc/stm32_rproc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 8746cbb1f168..19716ec82aae 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -867,7 +867,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int stm32_rproc_remove(struct platform_device *pdev)
> +static void stm32_rproc_remove(struct platform_device *pdev)
>  {
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -885,8 +885,6 @@ static int stm32_rproc_remove(struct platform_device *pdev)
>  		device_init_wakeup(dev, false);
>  	}
>  	rproc_free(rproc);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused stm32_rproc_suspend(struct device *dev)
> @@ -916,7 +914,7 @@ static SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
>  
>  static struct platform_driver stm32_rproc_driver = {
>  	.probe = stm32_rproc_probe,
> -	.remove = stm32_rproc_remove,
> +	.remove_new = stm32_rproc_remove,
>  	.driver = {
>  		.name = "stm32-rproc",
>  		.pm = &stm32_rproc_pm_ops,
