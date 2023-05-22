Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EB0C77B75
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 May 2023 14:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbjEVOfu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 May 2023 10:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjEVOfu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 May 2023 10:35:50 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5444699;
        Mon, 22 May 2023 07:35:48 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MCoF6N012204;
        Mon, 22 May 2023 16:35:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cEOZ7WjnkjivkHr7iyIWSN+hqpzOlsxlVfbvB3wThg0=;
 b=EJw6zAg6EocWvo6DeRfXUyGc3ZuDXjih62I7VhYyZ98jhI0vNnjhkbJEWXo55h4y7YHc
 KcZrQFiXr0Vk9KJKfEuY+s9gUnImB1mFWBMkq4xO4aKAWgrr0vOsNgBMOa3Y4mWm+Zwk
 wr1urIcm0PQSpvoNonjdC9B+so9YPg6rQ5XXVFl+0A9mu13U/wBUsJ48TywApCSRimH5
 nlHN850giap4pHnfI811c+aW8Jiso0VmbKnTcl8/PDAZaVnQ+Z4ParLNbSZDXygPTFbn
 v6jd9QUusUpamSo5Tyn4PtFMnCHVZhc0wSa+wbtp2bR5aGvvOQOwvxZlsLq8EOZaer4q BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qpn3gbx8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 16:35:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7D4710002A;
        Mon, 22 May 2023 16:35:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C06EE25E507;
        Mon, 22 May 2023 16:35:36 +0200 (CEST)
Received: from [10.252.27.80] (10.252.27.80) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 22 May
 2023 16:35:35 +0200
Message-ID: <035e7e15-6450-627b-0ea8-3339836c1b7d@foss.st.com>
Date:   Mon, 22 May 2023 16:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] remoteproc: stm32: Fix error code in
 stm32_rproc_parse_dt()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <kernel-janitors@vger.kernel.org>
References: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.27.80]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_10,2023-05-22_03,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Dan,

On 5/22/23 09:46, Dan Carpenter wrote:
> There is a cut and paste bug so this code was returning the wrong
> variable.  It should have been "ddata->hold_boot_rst" instead of
> "ddata->rst".
> 
> Fixes: de598695a2ad ("remoteproc: stm32: Allow hold boot management by the SCMI reset controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0e322697d210..a7457777aae4 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -755,7 +755,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
>  	if (IS_ERR(ddata->hold_boot_rst))
> -		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> +		return dev_err_probe(dev, PTR_ERR(ddata->hold_boot_rst),
>  				     "failed to get hold_boot reset\n");

Good catch!

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud

>  
>  	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
