Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9ECC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B710620719
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="k9Bd6pkR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgKIJlc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:41:32 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45102 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726176AbgKIJlb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:41:31 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A99QblQ011711;
        Mon, 9 Nov 2020 10:41:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=oLqT0Nj9S228R361KDS4sNieZXt1j3w3aqkTQ3dZYMQ=;
 b=k9Bd6pkRz8Kcx2xO0fIwUSAnOSQJhS5QVu8amkB8TKP7X0wOl+g7y9xJDsz4PiR5ClgP
 dcBPNLlTsn7UQ7eoARtKdd1bhG9cGJJR8krSuR+ke4STABQIYfW2wVcMCn90nb4Y6uqi
 BC2RNs/Q0XNesVv3VHXVAVRQhYMeBbM1ApOmfYjjuz/41NBGQwb4qMFX4RqfN/g6Yqog
 wHeTqiG4nvwi33VWfDxKpTmwoM/dIU2FCx7mVj1kYJ6q1AFx2kTKw6+Th9svSKKkQqtA
 t0Rr4h3vUyTjP7R7/iRc3FbuObwzmYRxF/xcWQ8pTHVZ2+Oytre9S0yOobRh9Fi/62pF yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nkbms7v1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:41:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D25C100039;
        Mon,  9 Nov 2020 10:41:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2F6C23384D;
        Mon,  9 Nov 2020 10:41:28 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:40:48 +0100
Subject: Re: [PATCH v2 02/14] remoteproc: Remove useless check in rproc_del()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-3-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <8daa64b9-f0d9-9176-5699-7c11d6212055@st.com>
Date:   Mon, 9 Nov 2020 10:40:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-3-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> Whether started at probe() time or thereafter from the command
> line, a remote processor needs to be shutdown before the final
> cleanup phases can happen.  Otherwise the system may be left in
> an unpredictable state where the remote processor is expecting
> the remoteproc core to be providing services when in fact it
> no longer exist.
> 
> Invariably calling rproc_shutdown() is fine since it will return
> immediately if the remote processor has already been switched
> off.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>


Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/remoteproc_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e55568d1e7e2..f36786b47a4f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2283,10 +2283,8 @@ int rproc_del(struct rproc *rproc)
>  	if (!rproc)
>  		return -EINVAL;
>  
> -	/* if rproc is marked always-on, rproc_add() booted it */
>  	/* TODO: make sure this works with rproc->power > 1 */
> -	if (rproc->auto_boot)
> -		rproc_shutdown(rproc);
> +	rproc_shutdown(rproc);
>  
>  	mutex_lock(&rproc->lock);
>  	rproc->state = RPROC_DELETED;
> 
