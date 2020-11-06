Return-Path: <SRS0=mBHI=EM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969FAC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:31:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D5FE2151B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:31:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="t7EBpSP2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgKFRbf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Nov 2020 12:31:35 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44502 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726075AbgKFRbf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Nov 2020 12:31:35 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A6HSA6f031236;
        Fri, 6 Nov 2020 18:31:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PjyfaeAwOYXXYkLmAF/KxV3VNu45EFwZxxtYt1eIAyQ=;
 b=t7EBpSP2QMZiAlAF2/vjWgdxc7r3jKjMlXQGh7er58LGSzHbUOyMVZLJazjEvyPS3ZIy
 +vED1vsaYJtQXJ6aD2CsFPX7l9El2YFq9TXKRGxvGHPZTKbF9smSCHPcxERXHfAb819B
 nB5NemXLV3bSX3ENQL4jDnk9VtIhkMBm/1XLxD1qySythoXexvUCUjEt3xowJyTVzxiu
 SbVYU0NDukxefjy4YFqP3G6kgcbWvBVQD8/mQr2CF+ADwxzUAZ+eum6/mSdSvLYXwbTE
 ZNuAIjcmQw0JNG8hqFO+ZB93ZbGWNV8KJGL4HtXq0gYVThpBbv8IvflJK6bU6sOiH5XU 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34gywrfrgu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Nov 2020 18:31:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6D1B10002A;
        Fri,  6 Nov 2020 18:31:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBF4B24456E;
        Fri,  6 Nov 2020 18:31:31 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 18:31:30 +0100
Subject: Re: [PATCH v2 06/14] remoteproc: Add new detach() remoteproc
 operation
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-7-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <7cd3408d-55e1-00b8-e73d-d46c95c0d9c3@st.com>
Date:   Fri, 6 Nov 2020 18:31:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-7-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_06:2020-11-05,2020-11-06 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> Add an new detach() operation in order to support scenarios where
> the remoteproc core is going away but the remote processor is
> kept operating.  This could be the case when the system is
> rebooted or when the platform driver is removed.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/linux/remoteproc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 3fe2ae0bd1ca..3faff9bb4fb8 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -361,6 +361,7 @@ enum rsc_handling_status {
>   * @start:	power on the device and boot it
>   * @stop:	power off the device
>   * @attach:	attach to a device that his already powered up
> + * @detach:	tell the remote processor that the core is going away

This comment seems to me rather ambiguous...
"tell the remote processor" could means communication with the remote processor.
The term "remote processor" is used for this op and "device" for the other ops.
Proposal:
 detach from a device by leaving it power-up.

Regards,
Arnaud
 
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
> @@ -382,6 +383,7 @@ struct rproc_ops {
>  	int (*start)(struct rproc *rproc);
>  	int (*stop)(struct rproc *rproc);
>  	int (*attach)(struct rproc *rproc);
> +	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
> 
