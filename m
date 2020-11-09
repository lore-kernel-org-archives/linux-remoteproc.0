Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3479C55ABD
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F4BA206ED
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="WXqewAxG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKIJlc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:41:32 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25978 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726482AbgKIJlc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:41:32 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A99RkDn004984;
        Mon, 9 Nov 2020 10:41:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=2ELNFcSAtwhOiwTCTnX2grRXIzXXbV4zPo8IvBuHyoE=;
 b=WXqewAxG0qi3LkbB+p6Kx6iFMedqFk7TwBlOVDArcC1+aG7bLOnG1J4caBOSMqG1CCnM
 JZCDgJtVwfAM4ggJ8dURNlhhdCEDF0kGBY9BAYtJ34ItEfQHm6AD0bXi8PC+u1m2NVwF
 K7iC23hJDpYtFFPl7Ds+4b2fSv0J/cxLqRpMKQXoyxjucMt++8c5WRBXVTlZAquCgHuj
 hxMwYyR5KLFXAe9nJT+oMzfOuu9s9iqJocVhmzSiD9TD7LxEh56lfDZ1bHuQ66CXU2BP
 XSyKHTPZSDm4fNkhUXSk/Sb2oxwr7qdTABte/I2SJIUv4vzWv3HG8lKlAUFpPkxLCE/q 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nhkchpdd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:41:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F129810002A;
        Mon,  9 Nov 2020 10:41:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E48612314F0;
        Mon,  9 Nov 2020 10:41:28 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:40:31 +0100
Subject: Re: [PATCH v2 01/14] remoteproc: Re-check state in rproc_shutdown()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-2-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <836ecec3-3da0-fca6-efbe-e59ba9f47f62@st.com>
Date:   Mon, 9 Nov 2020 10:40:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-2-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> The state of the remote processor may have changed between the
> time a call to rproc_shutdown() was made and the time it is
> executed.  To avoid moving forward with an operation that may
> have been cancelled, recheck while holding the mutex.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/remoteproc_core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dab2c0f5caf0..e55568d1e7e2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1857,6 +1857,9 @@ void rproc_shutdown(struct rproc *rproc)
>  		return;
>  	}
>  
> +	if (rproc->state != RPROC_RUNNING)
> +		goto out;
> +
>  	/* if the remote proc is still needed, bail out */
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
> 
