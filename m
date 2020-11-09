Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EE1C56202
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA95F207BC
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="icI2x4oH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgKIJld (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:41:33 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:24324 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727311AbgKIJlc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:41:32 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A99RkDp004984;
        Mon, 9 Nov 2020 10:41:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=W2UTtip+JISiCSyaYvcNERwY1m/oyT4ZIrtphQu4YDM=;
 b=icI2x4oHp6g+/RFc7vcXGkpwoJ4Cca1Z2+p5tuLJkRjhHr5WIfQHy2BpimT8HhHQpaAU
 OP4v2X4bOmZfwJuOUD4O7/K9t8NMaKGCak2bn76yGw/LHOtfjEAlUHcUBN3NyGrWWOof
 p4C1PtUZO5zq+Lk0n6h6PhnBHudq7wvEC1bpXQXklRekRscCiRRp+ZjJlHlFs6dKDyws
 IZPLPeqt8Sm504HeAKCkASTeIDfpJoxE5ZfHwaEXxQNYG6tZqCDNrCkRUgH7SKDGDesC
 cSCCyyrwN53HZoihvkRZGcJQZiXItcbg29FcIKcHSXF5NfwqiKrwV6EwXZV3e9fHrv9D Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nhkchpdj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:41:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AB99100042;
        Mon,  9 Nov 2020 10:41:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20F4A233C17;
        Mon,  9 Nov 2020 10:41:29 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:41:16 +0100
Subject: Re: [PATCH v2 04/14] remoteproc: Properly represent the attached
 state
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-5-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <943816d8-3a41-fc73-ea89-0ee7a53bae3c@st.com>
Date:   Mon, 9 Nov 2020 10:41:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> There is a need to know when a remote processor has been attached
> to rather than booted by the remoteproc core.  In order to avoid
> manipulating two variables, i.e rproc::autonomous and
> rproc::state, get rid of the former and simply use the newly
> introduced RPROC_ATTACHED state.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/remoteproc_core.c  | 20 +-------------------
>  drivers/remoteproc/remoteproc_sysfs.c |  5 +----
>  include/linux/remoteproc.h            |  2 --
>  3 files changed, 2 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f36786b47a4f..63fba1b61840 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1444,7 +1444,7 @@ static int rproc_attach(struct rproc *rproc)
>  		goto stop_rproc;
>  	}
>  
> -	rproc->state = RPROC_RUNNING;
> +	rproc->state = RPROC_ATTACHED;
>  
>  	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
>  
> @@ -1659,14 +1659,6 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  
>  	rproc->state = RPROC_OFFLINE;
>  
> -	/*
> -	 * The remote processor has been stopped and is now offline, which means
> -	 * that the next time it is brought back online the remoteproc core will
> -	 * be responsible to load its firmware.  As such it is no longer
> -	 * autonomous.
> -	 */
> -	rproc->autonomous = false;
> -
>  	dev_info(dev, "stopped remote processor %s\n", rproc->name);
>  
>  	return 0;
> @@ -2017,16 +2009,6 @@ int rproc_add(struct rproc *rproc)
>  	if (ret < 0)
>  		return ret;
>  
> -	/*
> -	 * Remind ourselves the remote processor has been attached to rather
> -	 * than booted by the remoteproc core.  This is important because the
> -	 * RPROC_DETACHED state will be lost as soon as the remote processor
> -	 * has been attached to.  Used in firmware_show() and reset in
> -	 * rproc_stop().
> -	 */
> -	if (rproc->state == RPROC_DETACHED)
> -		rproc->autonomous = true;
> -
>  	/* if rproc is marked always-on, request it to boot */
>  	if (rproc->auto_boot) {
>  		ret = rproc_trigger_auto_boot(rproc);
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 1167adcf8741..99ff51fd9707 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -138,11 +138,8 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
>  	 * If the remote processor has been started by an external
>  	 * entity we have no idea of what image it is running.  As such
>  	 * simply display a generic string rather then rproc->firmware.
> -	 *
> -	 * Here we rely on the autonomous flag because a remote processor
> -	 * may have been attached to and currently in a running state.
>  	 */
> -	if (rproc->autonomous)
> +	if (rproc->state == RPROC_ATTACHED)
>  		firmware = "unknown";
>  
>  	return sprintf(buf, "%s\n", firmware);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 4564c4665a2c..3fe2ae0bd1ca 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -510,7 +510,6 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> - * @autonomous: true if an external entity has booted the remote processor
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   * @char_dev: character device of the rproc
> @@ -547,7 +546,6 @@ struct rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> -	bool autonomous;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  	u8 elf_class;
> 
