Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91083C43461
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 20:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A7261353
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 20:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239416AbhDMUv6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 16:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241119AbhDMUvv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 16:51:51 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F08C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Apr 2021 13:51:27 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so17355927otb.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Apr 2021 13:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BADcf3smBQPBGql3mN7VdZeMYEdWGQAgGXkly2TDUSE=;
        b=uuxDg30ZNvq808mIE+x2+zZ9PmfAzxWCz4NaEpIgfbIUetY6YxRh4dz1U5PkEkv6rs
         zrhgGwEISnucLuHbcK1lxvIqsr4iL+b0g8nWSASoFVLKTEzq2gqgN2r0EwrUjLi7qYws
         LQIaNmOmF4BnXZ8ddWRq4PVsCWduKxXPxHLGWhFOAMin3tsWQVm0pp0S2b3zNbBn40MS
         o+rboo+H051Xqzb6GW99Tf+gUT3dcZ6TQ48KB/fCBVUdpELFvD7RrjiVmHMV8qomgt98
         bLrJS36gRoL8N/IayVzcWGtaieCS5MDET8EEvy75rpZIyIxx9XmNG7ux0gEFb+54le6q
         DR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BADcf3smBQPBGql3mN7VdZeMYEdWGQAgGXkly2TDUSE=;
        b=Nm4+Foer6OsDcr+QpMMaXRRnfz9ShtoL94eQJw/uC40ToAEVOcAi2/Z9zlQvYfyrXL
         nCqTrxvj9x4AqZEWIp+AXj9b+YLEDpBPSgwJukIAfofvOefnuwLRZDFrhoLo1p8rB1aW
         QlMMfpOqTFZOc7LfrgiKLH/WeLdDx2QgZqj0yI1Ctdl/PhpST2imKxWyTEGuHmq0JTEE
         BFMgc/s3O3oYK0hW+lmC8NqAvtBi/i4a1HDUv3Qtd6hPBY0NFyX4zlgAJ4z01tXnbnJN
         06ZUKmtpM8P8nckrHcrH2SAOCjtf/QfHyuwmWigQ/p66rPaNuMJ9nySRsfLdmBlpaNya
         UD6Q==
X-Gm-Message-State: AOAM531jgyoUo+gRbYVTGbOq+tT6JyIlHqewy7MvWRBGpxSkDY4rgC+I
        7W3S9eQsn8SFD4B3sJcD94n+wQ==
X-Google-Smtp-Source: ABdhPJwbNaUu3jAxfv+aYheVOyvNkyEbnvYzugss7653tdjcZHAMyHlw4VIFLPcaReZqg9136rHWRA==
X-Received: by 2002:a9d:928:: with SMTP id 37mr24297744otp.98.1618347086349;
        Tue, 13 Apr 2021 13:51:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w5sm2433153oos.43.2021.04.13.13.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 13:51:25 -0700 (PDT)
Date:   Tue, 13 Apr 2021 15:51:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: stm32: add capability to detach
Message-ID: <YHYESxThXVnVH3q8@builder.lan>
References: <20210318145923.31936-1-arnaud.pouliquen@foss.st.com>
 <20210318145923.31936-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318145923.31936-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 18 Mar 09:59 CDT 2021, Arnaud Pouliquen wrote:

> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> 
> A mechanism similar to the shutdown mailbox signal is implemented to
> detach a remote processor.
> 
> Upon detachment, a signal is sent to the remote firmware, allowing it
> to perform specific actions such as stopping RPMsg communication.
> 
> The Cortex-M hold boot is also disabled to allow the remote processor
> to restart in case of crash.
> 
> Notice that for this feature to be supported, the remote firmware 
> resource table must be stored at the beginning of a 1kB section 
> (default size provided to the remoteproc core).
> 
> This restriction should be lifted in the future by using a backup register
> to store the actual size of the resource table. 
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 38 ++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 3d45f51de4d0..298ef5b19e27 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -28,7 +28,7 @@
>  #define RELEASE_BOOT		1
>  
>  #define MBOX_NB_VQ		2
> -#define MBOX_NB_MBX		3
> +#define MBOX_NB_MBX		4
>  
>  #define STM32_SMC_RCC		0x82001000
>  #define STM32_SMC_REG_WRITE	0x1
> @@ -38,6 +38,7 @@
>  #define STM32_MBX_VQ1		"vq1"
>  #define STM32_MBX_VQ1_ID	1
>  #define STM32_MBX_SHUTDOWN	"shutdown"
> +#define STM32_MBX_DETACH	"detach"
>  
>  #define RSC_TBL_SIZE		1024
>  
> @@ -336,6 +337,15 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>  			.tx_done = NULL,
>  			.tx_tout = 500, /* 500 ms time out */
>  		},
> +	},
> +	{
> +		.name = STM32_MBX_DETACH,
> +		.vq_id = -1,
> +		.client = {
> +			.tx_block = true,
> +			.tx_done = NULL,
> +			.tx_tout = 200, /* 200 ms time out to detach should be fair enough */
> +		},
>  	}
>  };
>  
> @@ -461,6 +471,25 @@ static int stm32_rproc_attach(struct rproc *rproc)
>  	return stm32_rproc_set_hold_boot(rproc, true);
>  }
>  
> +static int stm32_rproc_detach(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	int err, dummy_data, idx;
> +
> +	/* Inform the remote processor of the detach */
> +	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
> +	if (idx >= 0 && ddata->mb[idx].chan) {
> +		/* A dummy data is sent to allow to block on transmit */
> +		err = mbox_send_message(ddata->mb[idx].chan,
> +					&dummy_data);

Isn't it the stm32_ipcc driver on the other side of this call? In which
case I believe "data" is ignored, and you would be able to just pass
NULL here.

As long as "data" isn't dereferenced it's probably better to send some
bugus value, than an address to this variable on the stack. If on the
other hand you pair this with one of the mailbox drivers that
dereferences "data", you should initialize it...

Apart from this, I think the patch looks good!

Regards,
Bjorn

> +		if (err < 0)
> +			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
> +	}
> +
> +	/* Allow remote processor to auto-reboot */
> +	return stm32_rproc_set_hold_boot(rproc, false);
> +}
> +
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -597,7 +626,11 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  	}
>  
>  done:
> -	/* Assuming the resource table fits in 1kB is fair */
> +	/*
> +	 * Assuming the resource table fits in 1kB is fair.
> +	 * Notice for the detach, that this 1 kB memory area has to be reserved in the coprocessor
> +	 * firmware for the resource table. A clean of this whole area is done on detach.
> +	 */
>  	*table_sz = RSC_TBL_SIZE;
>  	return (struct resource_table *)ddata->rsc_va;
>  }
> @@ -607,6 +640,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.start		= stm32_rproc_start,
>  	.stop		= stm32_rproc_stop,
>  	.attach		= stm32_rproc_attach,
> +	.detach		= stm32_rproc_detach,
>  	.kick		= stm32_rproc_kick,
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= stm32_rproc_parse_fw,
> -- 
> 2.17.1
> 
