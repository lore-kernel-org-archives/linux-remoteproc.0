Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD02CC4741F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CADA206ED
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="gECOYNB6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgKIJlr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:41:47 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45182 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726999AbgKIJlq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:41:46 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A99QbYj011717;
        Mon, 9 Nov 2020 10:41:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=SeHzc96ORE++yrrUmNXkm59nN4K+XAQJNx8Dcdb7xZo=;
 b=gECOYNB6D470vmSQSdS67ttDSNPoZdDhgtTaiQsyuTROlseEkFIATVmGeIMQXA7g0OAV
 dSJ+fQ/RuGW9vS+S3tIkuVJYnfsLQEVnVMxGnYUebqmA0pwxEr9J6Vdp9EQJmbOAdNyP
 Ge+SdX7AyXxADgGOfkC9q2rgc/ikbvOQruAigDshiBcfXr9lMCXT4NXCsSMExt9KckeO
 n3Q+8hwTeMJcCZxwARq7pwI+NefLfH9X5WRD1SQIs4orrzTwr8oG0MSDZswEMH1DxOjE
 CVRmDMyUZMX1Ahht9S2Zr/uSNJCXkvwbH/J7tqyQDZ7QpQQU51ZTmd0q9vx8+nag+nbN XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nkbms7ws-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:41:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9E17100034;
        Mon,  9 Nov 2020 10:41:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEA56233C13;
        Mon,  9 Nov 2020 10:41:43 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:41:42 +0100
Subject: Re: [PATCH v2 05/14] remoteproc: Properly deal with a kernel panic
 when attached
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-6-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <408114f9-d0e1-9af1-8207-9277c5205b1b@st.com>
Date:   Mon, 9 Nov 2020 10:41:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> The panic handler operation of registered remote processors
> should also be called when remote processors have been
> attached to.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 63fba1b61840..ed1f9ca4248b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2408,7 +2408,11 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
>  
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(rproc, &rproc_list, node) {
> -		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
> +		if (!rproc->ops->panic)
> +			continue;
> +
> +		if (rproc->state != RPROC_RUNNING &&
> +		    rproc->state != RPROC_ATTACHED)
>  			continue;
>  
>  		d = rproc->ops->panic(rproc);
> 
