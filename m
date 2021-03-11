Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B022C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 09:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DA7B64DE7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 09:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhCKJKG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 04:10:06 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26258 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231866AbhCKJJu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:09:50 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12B96wgL015400;
        Thu, 11 Mar 2021 10:09:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DRvfOakz4mZWyWiJFY4gv13nTf44E9Wz9MGKPW6CvoQ=;
 b=VDPLyf5wDfZc/TZITm5n8OB4Pzc8ZyEGyR/KR7MOO4nmGVaVz54Su6xhacFo8ERNCVVw
 nNPeKzIw/T/wMkUo3y8SRFh+dIn36ZTuXxqiG0gr8JNoN9hFFkNdu1WIgC3jjEqqHURe
 LfY2B1xNkTnm3IcFUT3QNzaOIJCDKGq0Fdy++zreYqrhVjTd074yomv94opu+oHm6bvp
 JNK7Dmoi4hBpDuhqum7rTV5G+j2XOBL/ruW5t5wJvayZ9vSuNb0eGIjpQ8lOklTVvOYj
 dAk5IvnCl+Yru+Po+C2NzmQ9XSHow5ex7XaV8J2FQtWey1ydXM92CpNloTdUpSflTtB3 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 373yrexdnw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 10:09:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C899B10002A;
        Thu, 11 Mar 2021 10:09:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B584C22515F;
        Thu, 11 Mar 2021 10:09:34 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 10:09:33 +0100
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v7 11/17] remoteproc: Properly deal with the resource
 table when detaching
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>
CC:     <arnaud.pouliquen@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
 <20210310211025.1084636-12-mathieu.poirier@linaro.org>
Message-ID: <d928c7e3-41ce-d0ff-e05c-8af2681d3442@foss.st.com>
Date:   Thu, 11 Mar 2021 10:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210310211025.1084636-12-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_04:2021-03-10,2021-03-11 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Just a minor comment, with that
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>


On 3/10/21 10:10 PM, Mathieu Poirier wrote:
> If it is possible to detach the remote processor, keep an untouched
> copy of the resource table.  That way we can start from the same
> resource table without having to worry about original values or what
> elements the startup code has changed when re-attaching to the remote
> processor.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> New for V7:
>   New Patch, used to be part of 11/16 in V6.
> ---
>  drivers/remoteproc/remoteproc_core.c | 77 ++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  3 ++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 5eaa47c3ba92..e9ea2558432d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1556,6 +1556,24 @@ static int rproc_set_rsc_table(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	/*
> +	 * If it is possible to detach the remote processor, keep an untouched
> +	 * copy of the resource table.  That way we can start fresh again when
> +	 * the remote processor is re-attached, that is:
> +	 *
> +	 *      DETACHED -> ATTACHED -> DETACHED -> ATTACHED
> +	 *
> +	 * Free'd in rproc_reset_rsc_table_on_detach() and
> +	 * rproc_reset_rsc_table_on_stop().
> +	 */
> +	if (rproc->ops->detach) {
> +		rproc->clean_table = kmemdup(table_ptr, table_sz, GFP_KERNEL);
> +		if (!rproc->clean_table)
> +			return -ENOMEM;
> +	} else {
> +		rproc->clean_table = NULL;
> +	}
> +
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = table_ptr;
>  	rproc->table_sz = table_sz;
> @@ -1563,6 +1581,59 @@ static int rproc_set_rsc_table(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
> +{
> +	struct resource_table *table_ptr;
> +
> +	/* A resource table was never retrieved, nothing to do here */
> +	if (!rproc->table_ptr)
> +		return 0;
> +
> +	/*
> +	 * If we made it to this point a clean_table _must_ have been
> +	 * allocated in rproc_set_rsc_table().  If one isn't present
> +	 * something went really wrong and we must complain.
> +	 */
> +	if (WARN_ON(!rproc->clean_table))
> +		return -EINVAL;
> +
> +	/* Remember where the external entity installed the resource table */
> +	table_ptr = rproc->table_ptr;
> +
> +	/*
> +	 * If we made it here the remote processor was started by another
> +	 * entity and a cache table doesn't exist.  As such make a copy of
> +	 * the resource table currently used by the remote processor and
> +	 * use that for the rest of the shutdown process.  The memory
> +	 * allocated here is free'd in rproc_detach().
> +	 */
> +	rproc->cached_table = kmemdup(rproc->table_ptr,
> +				      rproc->table_sz, GFP_KERNEL);
> +	if (!rproc->cached_table)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Use a copy of the resource table for the remainder of the
> +	 * shutdown process.
> +	 */
> +	rproc->table_ptr = rproc->cached_table;
> +
> +	/*
> +	 * Reset the memory area where the firmware loaded the resource table
> +	 * to its original value.  That way when we re-attach the remote
> +	 * processor the resource table is clean and ready to be used again.
> +	 */
> +	memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
> +
> +	/*
> +	 * The clean resource table is no longer needed.  Allocated in
> +	 * rproc_set_rsc_table().
> +	 */
> +	kfree(rproc->clean_table);
> +
> +	return 0;
> +}
> +
>  /*
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
> @@ -1721,6 +1792,9 @@ static int __rproc_detach(struct rproc *rproc)
>  	/* Stop any subdevices for the remote processor */
>  	rproc_stop_subdevices(rproc, false);
>  
> +	/* the installed resource table is no longer accessible */
> +	ret = rproc_reset_rsc_table_on_detach(rproc);
> +

Something seems missing here to treat the error case.

Regards,

Arnaud

>  	/* Tell the remote processor the core isn't available anymore */
>  	ret = rproc->ops->detach(rproc);
>  	if (ret) {
> @@ -1997,6 +2071,9 @@ int rproc_detach(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> +	/* Free the copy of the resource table */
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
>  out:
>  	mutex_unlock(&rproc->lock);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e1c843c19cc6..e5f52a12a650 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -514,6 +514,8 @@ struct rproc_dump_segment {
>   * @recovery_disabled: flag that state if recovery was disabled
>   * @max_notifyid: largest allocated notify id.
>   * @table_ptr: pointer to the resource table in effect
> + * @clean_table: copy of the resource table without modifications.  Used
> + *		 when a remote processor is attached or detached from the core
>   * @cached_table: copy of the resource table
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
> @@ -550,6 +552,7 @@ struct rproc {
>  	bool recovery_disabled;
>  	int max_notifyid;
>  	struct resource_table *table_ptr;
> +	struct resource_table *clean_table;
>  	struct resource_table *cached_table;
>  	size_t table_sz;
>  	bool has_iommu;
> 
