Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDDBC433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 13:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0352B64E26
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 13:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhBONUh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 08:20:37 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:27216 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230243AbhBONU1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 08:20:27 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11FDI6u8027118;
        Mon, 15 Feb 2021 14:19:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=V+jWO/tcnDcaOc6Qm4/CF3DPOhh2ZswEPjc7Ll+bFPA=;
 b=leVVJctfDJk1PPk1kJ362RBi6k0nGMJJwTOer1mRLsJU+tDUoNW2Vp0BEKE7IFcpTg06
 dvJ1RFgJfNT+l0BxF0aFcaMW1aIoQDPNZ4BXgSWzHSGpZg9Ks3id3y2Yev1kMnXn38vs
 +JuTsX7o20LLeYhbAMOajWlHFvt9LaG66kyOZGpALBq6wOn/jLx3F711L4wmXtQyOU0E
 kTbgXA4o3FGURPFcVQzrBI1TO8DWe8JNZ0kfZix+l5g7+J4ERBYWN6SSqI6LIsFUsp5G
 T9BzT1woezTThZoSHInGljqb7EdnCzeVzlBar27bRarRHP5yCbzBH1/pdvh82IwEbZkG yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p4sf2ykp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Feb 2021 14:19:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1862D10002A;
        Mon, 15 Feb 2021 14:19:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0293F239B39;
        Mon, 15 Feb 2021 14:19:36 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 15 Feb
 2021 14:19:35 +0100
Subject: Re: [PATCH v5 13/19] remoteproc: Properly deal with the resource
 table
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
 <20210211234627.2669674-14-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <9a73014f-d973-24d6-57c9-0134c0967057@foss.st.com>
Date:   Mon, 15 Feb 2021 14:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211234627.2669674-14-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-15_08:2021-02-12,2021-02-15 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/12/21 12:46 AM, Mathieu Poirier wrote:
> If it is possible to detach the remote processor, keep an untouched
> copy of the resource table.  That way we can start from the same
> resource table without having to worry about original values or what
> elements the startup code has changed when re-attaching to the remote
> processor.
> 
> Reported-by: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c       | 70 ++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_elf_loader.c | 24 +++++++-
>  include/linux/remoteproc.h                 |  3 +
>  3 files changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 660dcc002ff6..9a77cb6d6470 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1527,7 +1527,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  clean_up_resources:
>  	rproc_resource_cleanup(rproc);
>  	kfree(rproc->cached_table);
> +	kfree(rproc->clean_table);
>  	rproc->cached_table = NULL;
> +	rproc->clean_table = NULL;
>  	rproc->table_ptr = NULL;
>  unprepare_rproc:
>  	/* release HW resources if needed */
> @@ -1555,6 +1557,23 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	/*
> +	 * If it is possible to detach the remote processor, keep an untouched
> +	 * copy of the resource table.  That way we can start fresh again when
> +	 * the remote processor is re-attached, that is:
> +	 *
> +	 *	DETACHED -> ATTACHED -> DETACHED -> ATTACHED
> +	 *
> +	 * A clean copy of the table is also taken in rproc_elf_load_rsc_table()
> +	 * for cases where the remote processor is booted by the remoteproc
> +	 * core and later detached from.
> +	 */
> +	if (rproc->ops->detach) {
> +		rproc->clean_table = kmemdup(table_ptr, table_sz, GFP_KERNEL);
> +		if (!rproc->clean_table)
> +			return -ENOMEM;
> +	}
> +
>  	/*
>  	 * The resource table is already loaded in device memory, no need
>  	 * to work with a cached table.
> @@ -1566,6 +1585,40 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int rproc_reset_loaded_rsc_table(struct rproc *rproc)
> +{
> +	/*
> +	 * In order to detach() from a remote processor a clean resource table
> +	 * _must_ have been allocated at boot time, either from rproc_fw_boot()
> +	 * or from rproc_attach().  If one isn't present something went really
> +	 * wrong and we must complain.
> +	 */
> +	if (WARN_ON(!rproc->clean_table))
> +		return -EINVAL;
> +
> +	/*
> +	 * Install the clean resource table where the firmware, i.e
> +	 * rproc_get_loaded_rsc_table(), expects it.
> +	 */
> +	memcpy(rproc->table_ptr, rproc->clean_table, rproc->table_sz);
> +
> +	/*
> +	 * If the remote processors was started by the core then a cached_table
> +	 * is present and we must follow the same cleanup sequence as we would
> +	 * for a shutdown().  As it is in rproc_stop(), use the cached resource
> +	 * table for the rest of the detach process since ->table_ptr will
> +	 * become invalid as soon as carveouts are released in
> +	 * rproc_resource_cleanup().
> +	 *
> +	 * If the remote processor was started by an external entity the
> +	 * cached_table is NULL and the rest of the cleanup code in
> +	 * rproc_free_vring() can deal with that.
> +	 */
> +	rproc->table_ptr = rproc->cached_table;
> +
> +	return 0;
> +}
> +
>  /*
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
> @@ -1947,7 +2000,10 @@ void rproc_shutdown(struct rproc *rproc)
>  
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
> +	/* Free the clean resource table */
> +	kfree(rproc->clean_table);
>  	rproc->cached_table = NULL;
> +	rproc->clean_table = NULL;
>  	rproc->table_ptr = NULL;
>  out:
>  	mutex_unlock(&rproc->lock);
> @@ -2000,6 +2056,16 @@ int rproc_detach(struct rproc *rproc)
>  		goto out;
>  	}
>  
> +	/*
> +	 * Install a clean resource table for re-attach while
> +	 * rproc->table_ptr is still valid.
> +	 */
> +	ret = rproc_reset_loaded_rsc_table(rproc);
> +	if (ret) {
> +		atomic_inc(&rproc->power);
> +		goto out;
> +	}
> +

Here you rewrite the initial values in the loaded resource table but then
rproc_resource_cleanup will clean up the resource table.
That can lead to an overwrite, and perhaps to unexpected memory access, as
DA and PA addresses are reinitialized.
(e.g call of rproc_vdev_release that will overwrite the resource table)

And because the vdev release is asynchronous, probably better to reinitialize
the resource table on attach or in rproc_handle_resources.

Regards,
Arnaud

>  	/* clean up all acquired resources */
>  	rproc_resource_cleanup(rproc);
>  
> @@ -2008,10 +2074,14 @@ int rproc_detach(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> +	/* Free the copy of the resource table */
> +	kfree(rproc->cached_table);
>  	/* Follow the same sequence as in rproc_shutdown() */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> +	rproc->clean_table = NULL;
>  	rproc->table_ptr = NULL;
> +
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index df68d87752e4..aa09782c932d 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -17,10 +17,11 @@
>  
>  #define pr_fmt(fmt)    "%s: " fmt, __func__
>  
> -#include <linux/module.h>
> +#include <linux/elf.h>
>  #include <linux/firmware.h>
> +#include <linux/module.h>
>  #include <linux/remoteproc.h>
> -#include <linux/elf.h>
> +#include <linux/slab.h>
>  
>  #include "remoteproc_internal.h"
>  #include "remoteproc_elf_helpers.h"
> @@ -338,6 +339,25 @@ int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw)
>  	if (!rproc->cached_table)
>  		return -ENOMEM;
>  
> +	/*
> +	 * If it is possible to detach the remote processor, keep an untouched
> +	 * copy of the resource table.  That way we can start fresh again when
> +	 * the remote processor is re-attached, that is:
> +	 *
> +	 *	OFFLINE -> RUNNING -> DETACHED -> ATTACHED
> +	 *
> +	 * A clean copy of the table is also taken in
> +	 * rproc_set_loaded_rsc_table() for cases where the remote processor is
> +	 * booted by an external entity and later detached from.
> +	 */
> +	if (rproc->ops->detach) {
> +		rproc->clean_table = kmemdup(table, tablesz, GFP_KERNEL);
> +		if (!rproc->clean_table) {
> +			kfree(rproc->cached_table);
> +			return -ENOMEM;
> +		}
> +	}
> +
>  	rproc->table_ptr = rproc->cached_table;
>  	rproc->table_sz = tablesz;
>  
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
