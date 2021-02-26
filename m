Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3157C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:22:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4564064EBA
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBZQWK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:22:10 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35628 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229566AbhBZQWJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:22:09 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGCg7f030124;
        Fri, 26 Feb 2021 17:21:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QdBP+MVLsvcxlWViKOREXOusiHNigfnDh7xlOmb+YG4=;
 b=7noLVHpnwnLcLgUnl19aBJ0Sg8Abp11zmdPAN/UPRulGY5bh9B6Cqgl11Fo8QdGRU03K
 FLOXownDteC+AyRDCtY4ytYWg0l4F9h9l69Fpp4xdteGkqv3RIfZcuz40Klb8GcNTKKG
 03RVQ5aoJgSdLKdYLI86akCQNly89gxpJLCIS05lFBeWBdW1TdiOnopGpHBw3fF1kOX/
 3CvrmmypVielxIyVcT75OAe0PBKXUJtajzRyZSWGQfu7OuooLXauyFbjRwWnLB/xtjQV
 YUEwLLwyCCiSvseFWcnAWQGtG0N7n/2k8d/Yky9fbi6siIb25FIN67NMJyD8US8who1S sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66vxr7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:21:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CA3A10002A;
        Fri, 26 Feb 2021 17:21:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C88D2BA2C0;
        Fri, 26 Feb 2021 17:21:16 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:21:15 +0100
Subject: Re: [PATCH v6 11/16] remoteproc: Properly deal with the resource
 table when attached
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-12-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ad106bb6-0223-61f4-0d35-3b7da43ece4f@foss.st.com>
Date:   Fri, 26 Feb 2021 17:21:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-12-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> If it is possible to detach the remote processor, keep an untouched
> copy of the resource table.  That way we can start from the same
> resource table without having to worry about original values or what
> elements the startup code has changed when re-attaching to the remote
> processor.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> New for V6:
> - Double free of the cached table has been fixed.
> - rproc_reset_loaded_rsc_table() has seen a complete re-write.
> - rproc_stop() now calls rproc_reset_loaded_rsc_table() rather than
>   dealing with the cached.  This allows to properly shutdown a
>   remote processor that was attached to.
> ---
> 
>  drivers/remoteproc/remoteproc_core.c | 86 +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  3 +
>  2 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index fc01b29290a6..3a4692cc5220 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1556,6 +1556,21 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
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
> +	 * Free'd in rproc_reset_loaded_rsc_table().
> +	 */
> +	if (rproc->ops->detach) {
> +		rproc->clean_table = kmemdup(table_ptr, table_sz, GFP_KERNEL);
> +		if (!rproc->clean_table)
> +			return -ENOMEM;
> +	}
> +
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = table_ptr;
>  	rproc->table_sz = table_sz;
> @@ -1563,6 +1578,65 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int rproc_reset_loaded_rsc_table(struct rproc *rproc)

I spent some time to review this function that handles both the resource table
for both the stop and detach. To make it easier to read, I would divide it into
two functions.
I added a proposal at the end of this mail.

Regards,
Arnaud

> +{
> +	struct resource_table *table_ptr;
> +
> +	/*
> +	 * The cached table is already set if the remote processor was started
> +	 * by the remoteproc core.
> +	 */
> +	if (rproc->state == RPROC_RUNNING) {
> +		rproc->table_ptr = rproc->cached_table;
> +		return 0;
> +	}
> +
> +	/* A resource table was never retrieved, nothing to do here */
> +	if (!rproc->table_ptr)
> +		return 0;
> +
> +	/*
> +	 * If we made it to this point a cached_table _must_ have been
> +	 * allocated in rproc_set_loaded_rsc_table().  If one isn't present
> +	 * something went really wrong and we must complain.
> +	 */
> +	if (WARN_ON(!rproc->clean_table))
> +		return -EINVAL;
> +
> +	/* Remember where the external entity installed the resource table */
> +	table_ptr = rproc->table_ptr;
> +
> +	/*
> +	 * Make a copy of the resource table currently used by the remote
> +	 * processor.  Free'd in rproc_detach() or rproc_shutdown().
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
> +	 * rproc_set_loaded_rsc_table().
> +	 */
> +	kfree(rproc->clean_table);
> +
> +	return 0;
> +}
> +
>  /*
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
> @@ -1688,7 +1762,11 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	rproc_stop_subdevices(rproc, crashed);
>  
>  	/* the installed resource table is no longer accessible */
> -	rproc->table_ptr = rproc->cached_table;
> +	ret = rproc_reset_loaded_rsc_table(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't reset resource table: %d\n", ret);
> +		return ret;
> +	}
>  
>  	/* power off the remote processor */
>  	ret = rproc->ops->stop(rproc);
> @@ -1721,6 +1799,9 @@ static int __rproc_detach(struct rproc *rproc)
>  	/* Stop any subdevices for the remote processor */
>  	rproc_stop_subdevices(rproc, false);
>  
> +	/* the installed resource table is no longer accessible */
> +	ret = rproc_reset_loaded_rsc_table(rproc);
> +
>  	/* Tell the remote processor the core isn't available anymore */
>  	ret = rproc->ops->detach(rproc);
>  	if (ret) {
> @@ -1997,6 +2078,9 @@ int rproc_detach(struct rproc *rproc)
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


---
 drivers/remoteproc/remoteproc_core.c | 101 ++++++++++++++++++++++++++-
 include/linux/remoteproc.h           |   3 +
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c
b/drivers/remoteproc/remoteproc_core.c
index fc01b29290a6..cc24c360eb8b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1556,6 +1556,21 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
 		return ret;
 	}

+	/*
+	 * If it is possible to detach the remote processor, keep an untouched
+	 * copy of the resource table.  That way we can start fresh again when
+	 * the remote processor is re-attached, that is:
+	 *
+	 *      DETACHED -> ATTACHED -> DETACHED -> ATTACHED
+	 *
+	 * Free'd in rproc_reset_loaded_rsc_table().
+	 */
+	if (rproc->ops->detach) {
+		rproc->clean_table = kmemdup(table_ptr, table_sz, GFP_KERNEL);
+		if (!rproc->clean_table)
+			return -ENOMEM;
+	}
+
 	rproc->cached_table = NULL;
 	rproc->table_ptr = table_ptr;
 	rproc->table_sz = table_sz;
@@ -1563,6 +1578,79 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
 	return 0;
 }

+static int rproc_set_to_cached_rsc_table(struct rproc *rproc)
+{
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * The cached table is already set if the remote processor was started
+	 * by the remoteproc core.
+	 */
+	if (!rproc->cached_table) {
+		rproc->table_ptr = rproc->cached_table;
+		return 0;
+	}
+
+	/*
+	 * Make a copy of the resource table currently used by the remote
+	 * processor.  Free'd in rproc_detach() or rproc_shutdown().
+	 */
+	rproc->cached_table = kmemdup(rproc->table_ptr,
+				      rproc->table_sz, GFP_KERNEL);
+	if (!rproc->cached_table)
+		return -ENOMEM;
+
+	/*
+	 * Use a copy of the resource table for the remainder of the
+	 * shutdown process.
+	 */
+	rproc->table_ptr = rproc->cached_table;
+
+	return 0;
+}
+
+static int rproc_reset_loaded_rsc_table(struct rproc *rproc)
+{
+	struct resource_table *table_ptr;
+	int ret;
+
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * If we made it to this point a cached_table _mst_ have been
+	 * allocated in rproc_set_loaded_rsc_table().  If one isn't present
+	 * something went really wrong and we must complain.
+	 */
+	if (WARN_ON(!rproc->clean_table))
+		return -EINVAL;
+
+	/* Remember where the external entity installed the resource table */
+	table_ptr = rproc->table_ptr;
+
+	ret = rproc_set_to_cached_rsc_table(rproc);
+	if (ret)
+		return ret;
+
+	/*
+	 * Reset the memory area where the firmware loaded the resource table
+	 * to its original value.  That way when we re-attach the remote
+	 * processor the resource table is clean and ready to be used again.
+	 */
+	memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
+
+	/*
+	 * The clean resource table is no longer needed.  Allocated in
+	 * rproc_set_loaded_rsc_table().
+	 */
+	kfree(rproc->clean_table);
+
+	return 0;
+}
+
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1688,7 +1776,11 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	rproc_stop_subdevices(rproc, crashed);

 	/* the installed resource table is no longer accessible */
-	rproc->table_ptr = rproc->cached_table;
+	ret = rproc_set_to_cached_rsc_table(rproc);
+	if (ret) {
+		dev_err(dev, "can't reset resource table: %d\n", ret);
+		return ret;
+	}

 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
@@ -1721,6 +1813,9 @@ static int __rproc_detach(struct rproc *rproc)
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, false);

+	/* The installed resource table need to be reset and no longer accessible */
+	ret = rproc_reset_loaded_rsc_table(rproc);
+
 	/* Tell the remote processor the core isn't available anymore */
 	ret = rproc->ops->detach(rproc);
 	if (ret) {
@@ -1941,6 +2036,7 @@ void rproc_shutdown(struct rproc *rproc)

 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
+	kfree(rproc->clean_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
 out:
@@ -1997,6 +2093,9 @@ int rproc_detach(struct rproc *rproc)

 	rproc_disable_iommu(rproc);

+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e1c843c19cc6..e5f52a12a650 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -514,6 +514,8 @@ struct rproc_dump_segment {
  * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
  * @table_ptr: pointer to the resource table in effect
+ * @clean_table: copy of the resource table without modifications.  Used
+ *		 when a remote processor is attached or detached from the core
  * @cached_table: copy of the resource table
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
@@ -550,6 +552,7 @@ struct rproc {
 	bool recovery_disabled;
 	int max_notifyid;
 	struct resource_table *table_ptr;
+	struct resource_table *clean_table;
 	struct resource_table *cached_table;
 	size_t table_sz;
 	bool has_iommu;
-- 
