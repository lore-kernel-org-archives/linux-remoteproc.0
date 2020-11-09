Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C064BC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 13:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76F312068D
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 13:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="nmFLUmWR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgKINty (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 08:49:54 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:19624 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727311AbgKINtx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 08:49:53 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A9DmXtA011159;
        Mon, 9 Nov 2020 14:49:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=NgqeYI8Mqo7Hj0UMpQ6oKRlySdqERpCjvWX5IJtJ6Vg=;
 b=nmFLUmWREoV8aJRLMpnXafwnmVG6rsDzLdK+wMRn97GiAt6G0RQTeaNCwHF7YekJkSEe
 LAdeiKmZ/88MBS7Xhl9WiI1zi2nEcFP7TatKeFFLtpXTsR3EQnlEVu1m37Vv3ZzC5mm6
 MnmJ5wd78je4B1gvgm3sZcClBR8moQY9AAID8RgiblAQLJxvu276B31o/h2n0ALJ+VOm
 lCWit7UwYdnEr+Ja0ZVcFXzfi4eNNsFiwsGEOLPhTmk9mxI/01yCNxOPvUN7OuEvnxd0
 jkp3PEgXExtvZW3fe8eina4lrPl6S37Wd154/xb/+5gyQ6B6U2k8U12dK55YwrJj0DxV vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nj80j9ph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 14:49:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AF5C100034;
        Mon,  9 Nov 2020 14:49:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F6722BA2DF;
        Mon,  9 Nov 2020 14:49:41 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 14:49:21 +0100
Subject: Re: [Linux-stm32] [PATCH 2/2] remoteproc: stm32: Constify
 st_rproc_ops
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
 <20201107233630.9728-3-rikard.falkeborn@gmail.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <aff96f00-192b-e251-9a87-53dab368946c@st.com>
Date:   Mon, 9 Nov 2020 14:49:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201107233630.9728-3-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rikard,

On 11/8/20 12:36 AM, Rikard Falkeborn wrote:
> The only usage of st_rproc_ops is to pass its address to rproc_alloc()
> which accepts a const pointer. Make it const to allow the compiler to
> put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index d2414cc1d90d..a180aeae9675 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -541,7 +541,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>  	}
>  }
>  
> -static struct rproc_ops st_rproc_ops = {
> +static const struct rproc_ops st_rproc_ops = {
>  	.start		= stm32_rproc_start,
>  	.stop		= stm32_rproc_stop,
>  	.attach		= stm32_rproc_attach,
> 

acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud
