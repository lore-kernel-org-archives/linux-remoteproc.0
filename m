Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EB6C4741F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:42:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45EC1206ED
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:42:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="hiFPsmG0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKIJmE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:42:04 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41448 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726423AbgKIJmD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:42:03 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A99Sa6Y013902;
        Mon, 9 Nov 2020 10:42:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GzaxysudAoUfKbnCuEIYmTwVRBZ/AZU25VcWa72RrCI=;
 b=hiFPsmG0vW4kSSUqKPJcUj/LRXQUz8YALv7jmKOAXRQc75PUMM4mFLchsz/u989UJS+Z
 sIQbgc0M8/A51KOXgS9OImTfWGtWrY496LE99CxNV7RkohCDnzP/dPLRJEJ1hn1gRro2
 m5XEvBwM0CPhQOoTVTgVC96kdKD5PBQQAjhw5TlH5VPsAIBMjeptyiwb6CtwqIfUcAGz
 U54bzWdLZE+e48jgZ+HEQkJqLjNVLOysG44d008yPcVNjQ+s2mifeRJqE1bz8WfRClZ0
 r04h6oO+WHo+F29BSvbpkpbIsG3Br+3DPnDQcDOfBKT+0VoobYvv6zH+qeK6nyP9lA3c 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nj80h513-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:42:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D6AB10002A;
        Mon,  9 Nov 2020 10:42:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 639E8233C13;
        Mon,  9 Nov 2020 10:42:00 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:41:59 +0100
Subject: Re: [PATCH v2 09/14] remoteproc: Rename function rproc_actuate()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-10-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <f3fa085b-5c02-d065-f2f6-87ce4fa79b24@st.com>
Date:   Mon, 9 Nov 2020 10:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-10-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> Align what was done for rproc_detach() by renaming function
> rproc_actuate().  That way it is easier to figure out the
> opposite of each functions.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/remoteproc_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 6b33a83960d2..de5a5720d1e8 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1416,7 +1416,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> -static int rproc_attach(struct rproc *rproc)
> +static int __rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1541,7 +1541,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
>   */
> -static int rproc_actuate(struct rproc *rproc)
> +static int rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1581,7 +1581,7 @@ static int rproc_actuate(struct rproc *rproc)
>  		goto clean_up_resources;
>  	}
>  
> -	ret = rproc_attach(rproc);
> +	ret = __rproc_attach(rproc);
>  	if (ret)
>  		goto clean_up_resources;
>  
> @@ -1825,7 +1825,7 @@ int rproc_boot(struct rproc *rproc)
>  	if (rproc->state == RPROC_DETACHED) {
>  		dev_info(dev, "attaching to %s\n", rproc->name);
>  
> -		ret = rproc_actuate(rproc);
> +		ret = rproc_attach(rproc);
>  	} else {
>  		dev_info(dev, "powering up %s\n", rproc->name);
>  
> @@ -1916,7 +1916,7 @@ EXPORT_SYMBOL(rproc_shutdown);
>   *
>   * @rproc: the remote processor
>   *
> - * Detach a remote processor (previously attached to with rproc_actuate()).
> + * Detach a remote processor (previously attached to with rproc_attach()).
>   *
>   * In case @rproc is still being used by an additional user(s), then
>   * this function will just decrement the power refcount and exit,
> 
