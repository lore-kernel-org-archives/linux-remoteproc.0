Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE13C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Oct 2021 07:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF6C7610A3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Oct 2021 07:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhJRHMA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Oct 2021 03:12:00 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37342 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230419AbhJRHMA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Oct 2021 03:12:00 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I0Pg0C021737;
        Mon, 18 Oct 2021 09:09:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PVPUry39WCKQ8aJ+bKK0+Bp3HnBuEcws7c4ZZVZtcVQ=;
 b=HBvFAocbd0uLUS//m/GtRv98rEAeP4nXVjA8yOMY+LgzOzRKRGYsChgKRaSG1/yHPVgd
 pbDDJrH2ilpN/evknwWF5tCE2jif4bbneA5OYQFEm83vogNzuOufs859uuKiJCd4SJtu
 zZXNm9PcUkmZomdD2umNnvPrBtnVz9NaeQWhI9RnUe3isIbA4i4mmT5bPlGVNwFaYLEl
 KD35LN67uiNrBgUjaPSghSoFcixo08dVZEqVGyv8kk+YfLspLzpgbe2iE1CHL9cR1+B8
 XMBBJc3opD/SWTDFBFnwuRe6t4sh7MlK8fvXYHm6by80+Dte8IuL62rHjFOiGUKw4gL2 Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3brxbm1s51-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Oct 2021 09:09:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5EA7100034;
        Mon, 18 Oct 2021 09:09:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E016210F61;
        Mon, 18 Oct 2021 09:09:39 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 18 Oct
 2021 09:09:38 +0200
Subject: Re: [PATCH] remoteproc: core: fix potential memory leakage
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20211015124010.4075-1-arnaud.pouliquen@foss.st.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <c4fc93a5-22d5-303e-d032-d578ebfb48fe@foss.st.com>
Date:   Mon, 18 Oct 2021 09:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015124010.4075-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/15/21 2:40 PM, Arnaud Pouliquen wrote:
> If copy_dma_range_map returns an error, the rvdev structure must
> be freed.
> 
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset")
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Patch to ignore as already fixed by Christophe JAILLET

https://lore.kernel.org/all/163431847249.251657.11309404044031278395.b4-ty@linaro.org/T/


> ---
>  drivers/remoteproc/remoteproc_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..aaa281c8fc82 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -557,8 +557,10 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent = &rproc->dev;
>  	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> -	if (ret)
> +	if (ret) {
> +		kfree(rvdev);
>  		return ret;
> +	}
>  	rvdev->dev.release = rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> 
