Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F1EC64E7C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 18:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB24205F4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 18:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389225AbgLBSPA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:15:00 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7126 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728928AbgLBSO7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Dec 2020 13:14:59 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B2I6tYT028933;
        Wed, 2 Dec 2020 19:14:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=+ehhIvZT3gHwM+iFz5dh1rgFUsswUN3WcEf/7+x1Dz8=;
 b=IjRgF/+o6j8F1XYDHMSWcFchK4Y7SSq88RjQRY1DY1q6fYCoS2MCdlqo9zGAgkZ85PKf
 Bd2s7DUoUoNVuCFTflR+8BTbPRLY38qEdWC+iU6RIJruLu0OpVFtnNWwZTZ38DwDn5GT
 sEB/EvxlgZldRRsZ3GjGPNBWWCXlnweS0d1htQI/YGXqsjWv3bA1jPiYF1lWg7hTk+kK
 5ZBagCg9lO1CmQeokV8pvBlLzW7zfIxH9yaQmub9KhgEd1vH7H5H1I5KXwwWgttU7ybj
 /AwQx/2+vmvHnpv3Sb3Iir4299RB8dWrrgviMIePshiAwWziJNJIm5RTMhRfccDojKoM hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 355w3cd362-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Dec 2020 19:14:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3CE610002A;
        Wed,  2 Dec 2020 19:14:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D149B23FCD6;
        Wed,  2 Dec 2020 19:14:12 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 19:14:12 +0100
Subject: Re: [PATCH v3 11/15] remoteproc: Add return value to function
 rproc_shutdown()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-12-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <7aeadffa-f024-7bdc-2bdf-a09210c7a393@st.com>
Date:   Wed, 2 Dec 2020 19:14:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126210642.897302-12-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-02_10:2020-11-30,2020-12-02 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/26/20 10:06 PM, Mathieu Poirier wrote:
> Add a return value to function rproc_shutdown() in order to
> properly deal with error conditions that may occur.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud
> ---
>  drivers/remoteproc/remoteproc_core.c | 19 ++++++++++++++-----
>  include/linux/remoteproc.h           |  2 +-
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b54f60cc3cbd..51275107eb1f 100644
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
> @@ -1897,7 +1901,11 @@ void rproc_shutdown(struct rproc *rproc)
>  	rproc_resource_cleanup(rproc);
>  
>  	/* release HW resources if needed */
> -	rproc_unprepare_device(rproc);
> +	ret = rproc_unprepare_device(rproc);
> +	if (ret) {
> +		atomic_inc(&rproc->power);
> +		goto out;
> +	}
>  
>  	rproc_disable_iommu(rproc);
>  
> @@ -1907,6 +1915,7 @@ void rproc_shutdown(struct rproc *rproc)
>  	rproc->table_ptr = NULL;
>  out:
>  	mutex_unlock(&rproc->lock);
> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 329c1c071dcf..02312096d59f 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -655,7 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  			     u32 da, const char *name, ...);
>  
>  int rproc_boot(struct rproc *rproc);
> -void rproc_shutdown(struct rproc *rproc);
> +int rproc_shutdown(struct rproc *rproc);
>  int rproc_detach(struct rproc *rproc);
>  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> 
