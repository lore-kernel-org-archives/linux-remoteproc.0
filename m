Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C787C76188
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 Apr 2023 17:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbjDCRRz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 Apr 2023 13:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjDCRRy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Apr 2023 13:17:54 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DFB212D
        for <linux-remoteproc@vger.kernel.org>; Mon,  3 Apr 2023 10:17:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id w4so28711506plg.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Apr 2023 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680542273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4xSdqbs61SVAWVBHT8IiytZ71ydcaIwPCOE+rXcdBg=;
        b=Ge00iGkm2mOdcOxDxjzEbcjRPoGh/M6JYTxSdzfYWfqGdTMbjALJ1hWFzELWUGyflw
         VaKbSDCqdQCPdWg+PZYiUBE1XyA5Pq6tL3PAL+jAdWDbDhhTInlHPdhxj71FrIUAQ3n7
         Xl2n23PNO3MbdSZtvfskOpnUWcAlCXYob3mLEUMiBahnrwxLm6IV+DgNi8cWKoPeJFWY
         mXzcslcePNVr6iDI2/o8nsQ4ttXJMTpEYDp0S8SI1/vqFyivjOxxqdOnu7WHXUUqV7J3
         Lf/dnMS44WZM2yNj4YO/Hd7vV2vogEkf8AWmE6VXrgqmEVQnDVm6SNuecLH16TuH5tra
         a7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680542273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4xSdqbs61SVAWVBHT8IiytZ71ydcaIwPCOE+rXcdBg=;
        b=4sz9xs368pRIotjHawzTLtGLqRGOqhA50rTW1Rcm/WovOEJpCC+3rpFwDS/wDPw4DR
         bL86xJa7pThTtBkCSMkUR+ERtcYovOMNwRqY7nMdHH56vCyfCXbsW+YETY6gEAKo5A2c
         GEHO0y3ibmD6YsYjeAqn39gmiTnlXRx7q+yuEpzPdErVeQ0iXpj/TtTXlqyzizK2rxkc
         kWylOeUqxEjTh0/Xx3yFpHGzZsUXF5L4G+26uCD61TI7xUdnlQWVZuTKikDBkGuaKEf4
         BLG5YAG52tAyBUUfQA2zkj8eNhTxYemyTPJDOWNM2T0K+nZYMX90t1uxoAl/TY1Kvsh7
         azyQ==
X-Gm-Message-State: AAQBX9fcamFdlKh+jj06a75Vv+PFwKU0LvR0gh5ZE/jl07WzbNs0wSzn
        96AxuPrNrcJXGuIapxJmJvhz4vDEdR8q+VcxCwE=
X-Google-Smtp-Source: AKy350a++mWXDMz14NMLvc/HllozsRuvnaaqfIh9L4iRNH8H8kfXjRUDFCTwkrcTZrciL2hOq1lzKw==
X-Received: by 2002:a17:902:e5d1:b0:19e:4bc3:b1ef with SMTP id u17-20020a170902e5d100b0019e4bc3b1efmr46447759plf.64.1680542273012;
        Mon, 03 Apr 2023 10:17:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2a9e:349f:4c3:53c7])
        by smtp.gmail.com with ESMTPSA id jb5-20020a170903258500b001898ee9f723sm6928955plb.2.2023.04.03.10.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:17:52 -0700 (PDT)
Date:   Mon, 3 Apr 2023 11:17:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] remoteproc: stm32_rproc: Add mutex protection for
 workqueue
Message-ID: <20230403171750.GA3679607@p14s>
References: <20230331160634.3113031-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331160634.3113031-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 31, 2023 at 06:06:34PM +0200, Arnaud Pouliquen wrote:
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
> 
> Call trace:
> virtqueue_add_inbuf
> virtqueue_add_inbuf
> rpmsg_recv_single
> rpmsg_recv_done
> vring_interrupt
> stm32_rproc_mb_vq_work
> process_one_work
> worker_thread
> kthread
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>

I had forgotten about this issue - applied.

> ---
> This patch is similar to the issue fixed in
> commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex protection for workqueue")
> ---
>  drivers/remoteproc/stm32_rproc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7d782ed9e589..f618405cf420 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -287,8 +287,16 @@ static void stm32_rproc_mb_vq_work(struct work_struct *work)
>  	struct stm32_mbox *mb = container_of(work, struct stm32_mbox, vq_work);
>  	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
>  
> +	mutex_lock(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING)
> +		goto unlock_mutex;
> +
>  	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
>  		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
> +
> +unlock_mutex:
> +	mutex_unlock(&rproc->lock);
>  }
>  
>  static void stm32_rproc_mb_callback(struct mbox_client *cl, void *data)
> -- 
> 2.25.1
> 
