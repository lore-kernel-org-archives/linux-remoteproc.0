Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08022C4741F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:14:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 920D6207BC
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="qCVdUIom"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgKIJO2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:14:28 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:8666 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727920AbgKIJO1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:14:27 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A99CZQj018194;
        Mon, 9 Nov 2020 10:14:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=su23Lt03RLiF408SO/+nUAzMn2k3/k3VFXY16S7Oz8w=;
 b=qCVdUIom9vn7OLJ38CfeWqabl0jV/O9ZB+mk50ktYzheMvY4Jctp5xnURwSZZoGtBxg0
 exEyjlQpTJ8uJ2GhG1pmW12QlDKG+fgRtomXL6NuFz4Avs+HnrjC7c6irnGZSibPLLgn
 8gghVY+CqQJs9OeDTG67nzbj/WjOMfWIm2Ma7Mgj8OXWLFUPFddMyvlu4L9Owv2uVk69
 jxCy6g8oA4ARq2/nzt73+eV4SfMdrtK8U3r4tqIIrWgcnMb2+VIBNhiTh7Nt4DAUIzy7
 dCZeu8ZWiNOqXjW/vLacjNXfxwTATQ9WW2UFaUxZQsltnPIzPlNIHE9rF3AAn/KkDK0n 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nj80h015-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:14:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C739910002A;
        Mon,  9 Nov 2020 10:14:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BAB58233851;
        Mon,  9 Nov 2020 10:14:23 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:14:22 +0100
Subject: Re: [PATCH v2 10/14] remoteproc: Add return value to function
 rproc_shutdown()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-11-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <4c9b5a0d-34d4-ef65-f6d3-d02149ba09a4@st.com>
Date:   Mon, 9 Nov 2020 10:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-11-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> Add a return value to function rproc_shutdown() in order to
> properly deal with error conditions that may occur.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 13 +++++++++----
>  include/linux/remoteproc.h           |  2 +-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index de5a5720d1e8..f58475f6dcab 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1869,7 +1869,7 @@ EXPORT_SYMBOL(rproc_boot);
>   *   returns, and users can still use it with a subsequent rproc_boot(), if
>   *   needed.
>   */
> -void rproc_shutdown(struct rproc *rproc)
> +int rproc_shutdown(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1877,15 +1877,19 @@ void rproc_shutdown(struct rproc *rproc)
>  	ret = mutex_lock_interruptible(&rproc->lock);
>  	if (ret) {
>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> -		return;
> +		return ret;
>  	}
>  
> -	if (rproc->state != RPROC_RUNNING)
> +	if (rproc->state != RPROC_RUNNING) {
> +		ret = -EPERM;
>  		goto out;
> +	}
>  
>  	/* if the remote proc is still needed, bail out */
> -	if (!atomic_dec_and_test(&rproc->power))
> +	if (!atomic_dec_and_test(&rproc->power)) {
> +		ret = -EBUSY;
>  		goto out;
> +	}
>  
>  	ret = rproc_stop(rproc, false);
>  	if (ret) {

Few lines after in source code rproc_unprepare_device could also be tested

Regards,
Arnaud

> @@ -1907,6 +1911,7 @@ void rproc_shutdown(struct rproc *rproc)
>  	rproc->table_ptr = NULL;
>  out:
>  	mutex_unlock(&rproc->lock);
> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 6713faab6959..71d4d4873164 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -655,7 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  			     u32 da, const char *name, ...);
>  
>  int rproc_boot(struct rproc *rproc);
> -void rproc_shutdown(struct rproc *rproc);
> +int rproc_shutdown(struct rproc *rproc);
>  int rproc_detach(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
> 
