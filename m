Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A85C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 May 2022 17:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241463AbiEFRQN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 May 2022 13:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240813AbiEFRQL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 May 2022 13:16:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB063D4B7
        for <linux-remoteproc@vger.kernel.org>; Fri,  6 May 2022 10:12:26 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id cq17-20020a17090af99100b001dc0386cd8fso7386867pjb.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 May 2022 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y5j094DPRHeZY99oesAJ3jD7eRhZ4vMFwjoZ+Ryi1tg=;
        b=PLWqkvfpBIz0YAKpzE8d7HqkW2be22+6wtRGeNO8rkofc+vVMVudpF9Vq5h3qfqvZe
         +Y97bEJYqTW+r+glnIE75TBr+6VysuOgDD0T/P6U4K3rHzjc/N8B52SwFBsO55KO7V28
         UH4edqC9e2bYKQ1IaI8gd0NGs7tvXen7wnh93P2uzEiIvZo265ZIApY9WdAgG920MI8+
         ix32KFwU91g1eCKIiFIbJrsASzTU90TWIDBhVE/iekvVovPqPZtuWRD+LMzKIXhNxhS5
         dQOYVBl6kk0attyw1yNZNl+j43uITlZkHCsSeAEqyHKLaqHOwvpzSeZm3BLlRgUvRDX+
         5srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y5j094DPRHeZY99oesAJ3jD7eRhZ4vMFwjoZ+Ryi1tg=;
        b=dfmXQ4E+fMec8BEAl1fKayvRQglcOKzFWPtX1I3IHoKieyIdSxSGZcUjEvpwRrM2Ha
         kwedzG5bUN0X5AiIe4ysbDAAAPLL4/zxOiKvrKBNwUWSrkK8F0rLUNR6zHXGuPbDuXF4
         YXhlgb9kPwv+56AYu7Rt+Q+zW2q7ASf5ppdvNRp48L5NoCfVjfkxMRnfW6WDTM6By3N5
         dZRBvSC8VV7XmF0wyK0hQ/l2YgMGF8yxgLIy9cB8JXORNIYzpeOeif3uPde49hnk1VXe
         lM7LAOonWJgG/xzIlXwUQTaFAwQWX7/C7eh+DEvxBmUGiVDUA/BskZN/Z6yjRHnp2GOv
         eVwQ==
X-Gm-Message-State: AOAM530qafy4aYrgzLT7cKqFw10QzxSzryGySor7DW67Xa49B2DgmP7X
        lklkQyrFr8JhGODAX69P9qY4mA==
X-Google-Smtp-Source: ABdhPJyxvbn7xQx6eD34L504pFKRwq5Xji91lr3nz7ShqfmYHAW1qdEgkx4ky5S4KKsF7POvptuBgQ==
X-Received: by 2002:a17:90b:1bc3:b0:1dc:61fd:7ea4 with SMTP id oa3-20020a17090b1bc300b001dc61fd7ea4mr13197467pjb.31.1651857145904;
        Fri, 06 May 2022 10:12:25 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709027e4700b0015e8d4eb222sm1168856pln.108.2022.05.06.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 10:12:24 -0700 (PDT)
Date:   Fri, 6 May 2022 11:12:22 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] rpmsg: virtio: set dst address on first message received
Message-ID: <20220506171222.GA2816011@p14s>
References: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 15, 2022 at 04:38:56PM +0100, Arnaud Pouliquen wrote:
> when a rpmsg channel has been locally created with a destination address

s/when/Wen

Also, please be more specific about the "locally created" part, i.e
rpmsg_ctrldev_ioctl() -> rpmsg_create_channel().  Otherwise it is really hard to
understand the context of this change.

> set to RPMSG_ADDR_ANY, a name service announcement message is sent to
> the remote side. Then the destination address is never updated, making it
> impossible to send messages to the remote.
> 
> An example of kernel trace observed:
> rpmsg_tty virtio0.rpmsg-tty.29.-1: invalid addr (src 0x1d, dst 0xffffffff)
> 
> Implement same strategy than the open-amp library:
> On the reception of the first message, if the destination address is
> RPMSG_ADDR_ANY, then set it to address of the remote endpoint that
> send the message.
>

I would have expected a "Fixes:" tag.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> Remark:
> An alternative (or a complement?) could be to add a NS bind/unbind in
> the NS announcement channel (in rpmsg_ns.c).
> This would allow the local and/or the remote processor to inform the
> remote side the the service announced in bound.
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 3ede25b1f2e4..99d2119cc164 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -708,6 +708,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  			     struct rpmsg_hdr *msg, unsigned int len)
>  {
> +	struct rpmsg_device *rpdev;
>  	struct rpmsg_endpoint *ept;
>  	struct scatterlist sg;
>  	bool little_endian = virtio_is_little_endian(vrp->vdev);
> @@ -746,6 +747,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	mutex_unlock(&vrp->endpoints_lock);
>  
>  	if (ept) {
> +		rpdev = ept->rpdev;
> +		if (rpdev->ept == ept && rpdev->dst == RPMSG_ADDR_ANY) {

Please add a comment to explain the first part of the if() clause.  It took me
quite some time to understand. 

> +			/*
> +			 * First message received from the remote side on the default endpoint,
> +			 * update channel destination address.
> +			 */
> +			rpdev->dst = msg->src;

This triggers a bot warning and should be addressed.  If it can't be addressed add
a comment that clearly explains why so that we don't end up receiving patches
for it every 4 weeks.

Thanks,
Mathieu

> +		}
> +
>  		/* make sure ept->cb doesn't go away while we use it */
>  		mutex_lock(&ept->cb_lock);
>  
> -- 
> 2.25.1
> 
