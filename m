Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F186C636D6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Feb 2023 17:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjBVRex (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Feb 2023 12:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjBVRew (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Feb 2023 12:34:52 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8415030B30
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Feb 2023 09:34:51 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id z2so9754930plf.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Feb 2023 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7U+t+Gc+7OzDL0N0Nz2SZTtKF2LyQ8HQk4KawwAcVY=;
        b=UQympwq9khmtuoIahuhHnVYg8yWLI/Ccy089IB7ENnPwppZSVoIGpBx10AY/dUxxob
         P7kIFERKdf33vJ65d31LmJOxY7WLf6ULMQG9+VZNV+EaCaN03H0bqWXKUzBiiCe8DZWs
         5qesLpjdhlLEtMX78MXu1qJyBKQ47lPMXOxikn35br0EsFXa/S0L5RJTtr8zEpIQT+Eo
         27IhrRJ1yzQUQ8hdkf3smBH3ZcVSkjvmL8ARrVI6AkhuC2UkbOBIfH5rrdjw31HVk5DJ
         il5Jitw/eAf9c6suwKouOdCerVkjiavCiK448egsdf5hpUZi2V0OGJ84ISTrgdsTOm0+
         fZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7U+t+Gc+7OzDL0N0Nz2SZTtKF2LyQ8HQk4KawwAcVY=;
        b=FYYpLdvMPgWgYhnG6foMtrWYZYXrwCy8B/2s8cby+5ywLHf5uSkmMIs0+zfRIqYZ/h
         p16vU3UmvGQewZy69kdMRTsC3yTVT+VaaZa6OzLQdzTuRasCdEYRW2AvM/V2X8WY2/m1
         t+wawFZDryD5gJe9WN9wnu4MhLNmszYJWD79pdOKrKP0sE99F22MMX0vaWciXIHXqYzv
         uKAke7TRwNNyIqjT78/GSMy083v7VOa1EEF2p82mFvAl6GlOIeyddHfoJHIouAICjG3I
         zbovCQKQjIzAa1q9dZzeXN8ZJ5xlX2kh1S9dqN3LnAoyJpPmY+Gqt25sGY9CHkKMOS1H
         1/ow==
X-Gm-Message-State: AO0yUKVcBWKRqAE7cvhQ1MnAJ815tp/I1ijc9mz0pFq6R4RK/y8MTt5g
        /OfXSy4ElTRsMQaC57RSSNTK+A==
X-Google-Smtp-Source: AK7set9Huz4RS9qq84kMwHR4AdXiV3qcTdIp4c/IF1x/zsGT1wVtsqKLZrzoIUglIHlI5SGQw/PdGw==
X-Received: by 2002:a17:902:d481:b0:19a:b033:2bb1 with SMTP id c1-20020a170902d48100b0019ab0332bb1mr10846957plg.44.1677087290899;
        Wed, 22 Feb 2023 09:34:50 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:78a7:1e00:32c7:e2c0])
        by smtp.gmail.com with ESMTPSA id 10-20020a170902c14a00b0019aa6bf4450sm6693173plj.188.2023.02.22.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 09:34:50 -0800 (PST)
Date:   Wed, 22 Feb 2023 10:34:48 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     michal.simek@amd.com, andersson@kernel.org,
        jaswinder.singh@linaro.org, ben.levinsky@amd.com,
        shubhrajyoti.datta@amd.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] drivers: mailbox: zynqmp: handle multiple child
 nodes
Message-ID: <20230222173448.GA909075@p14s>
References: <20230213211825.3507034-1-tanmay.shah@amd.com>
 <20230213211825.3507034-2-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213211825.3507034-2-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Feb 13, 2023 at 01:18:24PM -0800, Tanmay Shah wrote:
> As of now only one child node is handled by zynqmp-ipi
> mailbox driver. Upon introducing remoteproc r5 core mailbox
> nodes, found few enhancements in Xilinx zynqmp mailbox driver
> as following:
> 
> - fix mailbox child node counts
>   If child mailbox node status is disabled it causes
>   crash in interrupt handler. Fix this by assigning
>   only available child node during driver probe.
> 
> - fix typo in IPI documentation %s/12/32/
>   Xilinx IPI message buffers allows 32-byte data transfer.
>   Fix documentation that says 12 bytes
> 
> - fix bug in zynqmp-ipi isr handling
>   Multiple IPI channels are mapped to same interrupt handler.
>   Current isr implementation handles only one channel per isr.
>   Fix this behavior by checking isr status bit of all child
>   mailbox nodes.
> 
> Fixes: 4981b82ba2ff ("mailbox: ZynqMP IPI mailbox controller")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changelog:
>   - This is first version of this change, however posting as part of the series
>     that has version v3.
> 
> v2: https://lore.kernel.org/all/20230126213154.1707300-1-tanmay.shah@amd.com/
> 
>  drivers/mailbox/zynqmp-ipi-mailbox.c       | 8 ++++----
>  include/linux/mailbox/zynqmp-ipi-message.h | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
> index 12e004ff1a14..b1498f6f06e1 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -152,7 +152,7 @@ static irqreturn_t zynqmp_ipi_interrupt(int irq, void *data)
>  	struct zynqmp_ipi_message *msg;
>  	u64 arg0, arg3;
>  	struct arm_smccc_res res;
> -	int ret, i;
> +	int ret, i, status = IRQ_NONE;
>  
>  	(void)irq;
>  	arg0 = SMC_IPI_MAILBOX_STATUS_ENQUIRY;
> @@ -170,11 +170,11 @@ static irqreturn_t zynqmp_ipi_interrupt(int irq, void *data)
>  				memcpy_fromio(msg->data, mchan->req_buf,
>  					      msg->len);
>  				mbox_chan_received_data(chan, (void *)msg);
> -				return IRQ_HANDLED;
> +				status = IRQ_HANDLED;
>  			}
>  		}
>  	}
> -	return IRQ_NONE;
> +	return status;
>  }
>  
>  /**
> @@ -634,7 +634,7 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
>  	struct zynqmp_ipi_mbox *mbox;
>  	int num_mboxes, ret = -EINVAL;
>  
> -	num_mboxes = of_get_child_count(np);
> +	num_mboxes = of_get_available_child_count(np);
>  	pdata = devm_kzalloc(dev, sizeof(*pdata) + (num_mboxes * sizeof(*mbox)),
>  			     GFP_KERNEL);
>  	if (!pdata)
> diff --git a/include/linux/mailbox/zynqmp-ipi-message.h b/include/linux/mailbox/zynqmp-ipi-message.h
> index 35ce84c8ca02..31d8046d945e 100644
> --- a/include/linux/mailbox/zynqmp-ipi-message.h
> +++ b/include/linux/mailbox/zynqmp-ipi-message.h
> @@ -9,7 +9,7 @@
>   * @data: message payload
>   *
>   * This is the structure for data used in mbox_send_message
> - * the maximum length of data buffer is fixed to 12 bytes.
> + * the maximum length of data buffer is fixed to 32 bytes.
>   * Client is supposed to be aware of this.

I agree that this should be split in 3 patches but the fixes are so small that
it is hardly required.  I'll leave it up to Michal to decide.

Split or not:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>   */
>  struct zynqmp_ipi_message {
> -- 
> 2.25.1
> 
