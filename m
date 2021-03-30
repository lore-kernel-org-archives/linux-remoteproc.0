Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A90C433C1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 07:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19C1A6199A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 07:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhC3HPK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 03:15:10 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:31422 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231206AbhC3HPD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 03:15:03 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12U725Aq011137;
        Tue, 30 Mar 2021 09:14:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=28n/u8BRVi8Ip9vAnGkYD4wNv1dohMQPBqlvlty3efA=;
 b=0zmtnFwA8vcOjEfXyR8xLHnCBtLDg8XkKMWcTxliAr5oeE+jaejKBPhgYHeFJflzfiPK
 9DqGNnI03JxTmb2sCNbkmpCTDFyI/ZwOMuam5x+ZRuwBUlnw1JkT5rMdOk5aexl+/49o
 s7I73fdeNh1d8+wu0tWCYSd7G+ts7frOJrUr9xvVTl5Qo7FczW6U8P0Xcj91j+ZR6JIp
 7Fe+suIMJM84VEGwvVFprkjMcc6WmCQrHWZqZ6/yodrkSGdb+OlM23JXr1MAKNU1Nhpy
 L/LwjH/8hdb7E8unN5Wwu5KT4f4VZJIKZYOjQ7TbdH7AfUgFxb5wvqHfnQW/eYG4TeAH Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37kuf298v0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Mar 2021 09:14:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C56B100034;
        Tue, 30 Mar 2021 09:14:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8016D225FC0;
        Tue, 30 Mar 2021 09:14:54 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 09:14:53 +0200
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: stm32-rproc: add new
 mailbox channel for detach
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20210326094209.29750-1-arnaud.pouliquen@foss.st.com>
 <20210326094209.29750-2-arnaud.pouliquen@foss.st.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b6287e27-e3ea-c2a3-6583-d16f1047c197@foss.st.com>
Date:   Tue, 30 Mar 2021 09:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210326094209.29750-2-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-30_02:2021-03-26,2021-03-30 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Rob,

Seems I made a mistake in my mailing list, you are not in...
Please could you review the bindings?
if it is easier for you i can resend the series.

Thanks,
Arnaud

On 3/26/21 10:42 AM, Arnaud Pouliquen wrote:
> Add the "detach" mailbox item, that allows to define a mailbox to
> send a IPCC signal to the remote processor on remoteproc detach action.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> No Update from V2.
> 
> Update from V1:
> Fix indentation error reported by 'make dt_binding_check'.
> 
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index a1171dfba024..64afdcfb613d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -65,16 +65,23 @@ properties:
>            Unidirectional channel:
>              - from local to remote, where ACK from the remote means that it is
>                ready for shutdown
> +      - description: |
> +          A channel (d) used by the local proc to notify the remote proc that it
> +          has to stop interprocessor communnication.
> +          Unidirectional channel:
> +            - from local to remote, where ACK from the remote means that communnication
> +              as been stopped on the remote side.
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    mbox-names:
>      items:
>        - const: vq0
>        - const: vq1
>        - const: shutdown
> +      - const: detach
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    memory-region:
>      description:
> 
