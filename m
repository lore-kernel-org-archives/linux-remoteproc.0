Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105DCC433DB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Jan 2021 00:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE83023A34
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Jan 2021 00:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbhAPAzu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Jan 2021 19:55:50 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33264 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhAPAzu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Jan 2021 19:55:50 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10G0rVXL127232;
        Fri, 15 Jan 2021 18:53:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1610758411;
        bh=SyYryF1l2gNr4uYRFERqQnjjOjHe3QCik1F2wFcrCjQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kL3pW6lmlXo4lTCzRsYEFYaIvlivswr+3s0mJkq84/hFuoPMAnQlH6+TldjBpK0WP
         tJHOGuLgeUSUbHYUuwRVc2pv73TCtoswG5CIe/9A498+pNx1qaFzDPkbpsFUxMhMZE
         NxR26SwFdGiULKjOTppGwjNQ2H9Z+DarwH1i/vnQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10G0rVa9004891
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Jan 2021 18:53:31 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 Jan 2021 18:53:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 Jan 2021 18:53:30 -0600
Received: from [10.250.34.42] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10G0rUor073601;
        Fri, 15 Jan 2021 18:53:30 -0600
Subject: Re: [PATCH] remoteproc: pru: future-proof PRU ID matching
To:     David Lechner <david@lechnology.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <linux-kernel@vger.kernel.org>
References: <20210104211816.420602-1-david@lechnology.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ccc1ee4b-ed73-f7c8-ca1e-f15eedeeb84b@ti.com>
Date:   Fri, 15 Jan 2021 18:53:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104211816.420602-1-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 1/4/21 3:18 PM, David Lechner wrote:
> Currently, to determine the ID (0 or 1) of a PRU core, the last 19 bits
> of the physical address of the cores IRAM are compared to known values.
> However, the PRUs on TI AM18XX have IRAM at 0x01c38000 and 0x01c3c000
> respectively. The former conflicts with PRU1_IRAM_ADDR_MASK which could
> cause PRU0 to be detected as PRU1. (The latter also conflicts with
> TX_PRU1_IRAM_ADDR_MASK but it would still be correctly detected as
> PRU1.)
> 
> This fixes the problem by moving the address matching offset values to
> the device-specific data. This way the compatible string does half of
> the work of narrowing down the addresses to two possibilities instead
> of checking the address against all possible PRU types. This also lets
> us narrow down the scope of the match from 19 bits to 16 bits for all
> PRU types.
> 
> After this, the TI AM18XX PRUs will be able to be added without running
> into the problems stated above.
> 
> We can also drop the local ret variable while touching this code.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Will test this patch on Mon/Tue on various platforms.

Bjorn,
Please wait for my Ack on this before you pick this up.

regards
Suman

> ---
>  drivers/remoteproc/pru_rproc.c | 49 ++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 2667919d76b3..94ce48df2f48 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -46,15 +46,6 @@
>  #define PRU_DEBUG_GPREG(x)	(0x0000 + (x) * 4)
>  #define PRU_DEBUG_CT_REG(x)	(0x0080 + (x) * 4)
>  
> -/* PRU/RTU/Tx_PRU Core IRAM address masks */
> -#define PRU_IRAM_ADDR_MASK	0x3ffff
> -#define PRU0_IRAM_ADDR_MASK	0x34000
> -#define PRU1_IRAM_ADDR_MASK	0x38000
> -#define RTU0_IRAM_ADDR_MASK	0x4000
> -#define RTU1_IRAM_ADDR_MASK	0x6000
> -#define TX_PRU0_IRAM_ADDR_MASK	0xa000
> -#define TX_PRU1_IRAM_ADDR_MASK	0xc000
> -
>  /* PRU device addresses for various type of PRU RAMs */
>  #define PRU_IRAM_DA	0	/* Instruction RAM */
>  #define PRU_PDRAM_DA	0	/* Primary Data RAM */
> @@ -96,10 +87,14 @@ enum pru_type {
>  /**
>   * struct pru_private_data - device data for a PRU core
>   * @type: type of the PRU core (PRU, RTU, Tx_PRU)
> + * @pru0_iram_offset: used to identify PRU core 0
> + * @pru1_iram_offset: used to identify PRU core 1
>   * @is_k3: flag used to identify the need for special load handling
>   */
>  struct pru_private_data {
>  	enum pru_type type;
> +	u16 pru0_iram_offset;
> +	u16 pru1_iram_offset;
>  	unsigned int is_k3 : 1;
>  };
>  
> @@ -693,33 +688,21 @@ static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  }
>  
>  /*
> - * Compute PRU id based on the IRAM addresses. The PRU IRAMs are
> + * Compute PRU id based on the last 16 bits of IRAM addresses. The PRU IRAMs are
>   * always at a particular offset within the PRUSS address space.
>   */
>  static int pru_rproc_set_id(struct pru_rproc *pru)
>  {
> -	int ret = 0;
> -
> -	switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & PRU_IRAM_ADDR_MASK) {
> -	case TX_PRU0_IRAM_ADDR_MASK:
> -		fallthrough;
> -	case RTU0_IRAM_ADDR_MASK:
> -		fallthrough;
> -	case PRU0_IRAM_ADDR_MASK:
> +	u16 offset = pru->mem_regions[PRU_IOMEM_IRAM].pa;
> +
> +	if (offset == pru->data->pru0_iram_offset)
>  		pru->id = 0;
> -		break;
> -	case TX_PRU1_IRAM_ADDR_MASK:
> -		fallthrough;
> -	case RTU1_IRAM_ADDR_MASK:
> -		fallthrough;
> -	case PRU1_IRAM_ADDR_MASK:
> +	else if (offset == pru->data->pru1_iram_offset)
>  		pru->id = 1;
> -		break;
> -	default:
> -		ret = -EINVAL;
> -	}
> +	else
> +		return -EINVAL;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int pru_rproc_probe(struct platform_device *pdev)
> @@ -825,20 +808,28 @@ static int pru_rproc_remove(struct platform_device *pdev)
>  
>  static const struct pru_private_data pru_data = {
>  	.type = PRU_TYPE_PRU,
> +	.pru0_iram_offset = 0x4000,
> +	.pru1_iram_offset = 0x8000,
>  };
>  
>  static const struct pru_private_data k3_pru_data = {
>  	.type = PRU_TYPE_PRU,
> +	.pru0_iram_offset = 0x4000,
> +	.pru1_iram_offset = 0x8000,
>  	.is_k3 = 1,
>  };
>  
>  static const struct pru_private_data k3_rtu_data = {
>  	.type = PRU_TYPE_RTU,
> +	.pru0_iram_offset = 0x4000,
> +	.pru1_iram_offset = 0x6000,
>  	.is_k3 = 1,
>  };
>  
>  static const struct pru_private_data k3_tx_pru_data = {
>  	.type = PRU_TYPE_TX_PRU,
> +	.pru0_iram_offset = 0xa000,
> +	.pru1_iram_offset = 0xc000,
>  	.is_k3 = 1,
>  };
>  
> 

