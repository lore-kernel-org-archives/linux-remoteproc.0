Return-Path: <SRS0=l7X0=7R=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49E2C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Jun 2020 20:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4A2A2075B
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Jun 2020 20:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jI6tdSj8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbgFDUCB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Jun 2020 16:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbgFDUCB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Jun 2020 16:02:01 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF68C08C5C1
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 Jun 2020 13:01:59 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fs4so1596330pjb.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2020 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vAYGNTb54rsQSan6QyvRDltAW1eTpXoQKfLGpGvXROY=;
        b=jI6tdSj8qHyfAq2jcopD2ZPb5rOPfxhbL47DfBnMOhg+TFPQmSppMn47Ir7Ki9W8N7
         sDhvUPXDsASXCdFlhlIsE9iygAkNQjhCiS7YsLQZtTuqdGcKHsxh03no/aXi7DHrtChI
         T79hsgsU/IkGieXLHURh3c8OR0aqDxwHdYvEZ9HRBLtYTgaTlRmKNCiiNdwUKr7UEby2
         s1jdHNNbbZGcpI7vBpvs9yIy6tvx0ajc69a3QjnESQr9gD8d5u1r+B7lntY/ukO0mQFW
         kdg6FSz21imjGF5xDfgt07+5gXM3RA9uvlsbtF9bNRIDWmNaHXxQKdsBhjDSSTEqEJJN
         IWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vAYGNTb54rsQSan6QyvRDltAW1eTpXoQKfLGpGvXROY=;
        b=T1JxLCKyP3nyEJgRCnVReXpeOYN+yRtoxDiaEW0qz9cm7GREsGPYoNWMKmt9E7Say/
         8ufUQU4IeYq3chvB7JBobw7bQhzfj33aygdOtXYtt7+ujnJ4oompALUxUmkMz695HBw4
         JtzZoBX6NPbJZuQc4/TPDE3n+86Rfbxcf5kJB/bzQmMmiRhX0+/Sm4slt/GQVxiqtVli
         Qc7bxNCjQ4VJuy+0/TMkVZiHiWov0KBHBV8kimcKmZb3J8hQvBCfwYDiBuhWy+22TF4L
         42hJNq5HBVTNrgQR07x+WBJrkAMnBkysBrhp4a7AMFTubUEItp1ssqHlkDGt2iU7auI3
         emQQ==
X-Gm-Message-State: AOAM532UjjFJmOf4ZZYgO5P29lNVBQrjtsrvCoMFuucRR6+tl456SOw7
        kOdvwZS2E/8YP4l/+M4O1UDMdQ==
X-Google-Smtp-Source: ABdhPJx18CWRe3LuIZZ9koaejNlwS+u01nv+CLYSJ8AbAMCUlvCSh27jxh8EasimXBKniTSXi1vkeA==
X-Received: by 2002:a17:90a:3749:: with SMTP id u67mr7452340pjb.129.1591300919377;
        Thu, 04 Jun 2020 13:01:59 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x12sm5285603pfo.72.2020.06.04.13.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 13:01:58 -0700 (PDT)
Date:   Thu, 4 Jun 2020 14:01:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 12/12] rpmsg: add a device ID to also bind to the ADSP
 device
Message-ID: <20200604200156.GB26734@xps15>
References: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
 <20200529073722.8184-13-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529073722.8184-13-guennadi.liakhovetski@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, May 29, 2020 at 09:37:22AM +0200, Guennadi Liakhovetski wrote:
> The ADSP device uses the RPMsg API to connect vhost and VirtIO SOF
> Audio DSP drivers on KVM host and guest.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index f3bd050..ebe3f19 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -949,6 +949,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
>  
>  static struct virtio_device_id id_table[] = {
>  	{ VIRTIO_ID_RPMSG, VIRTIO_DEV_ANY_ID },
> +	{ VIRTIO_ID_ADSP, VIRTIO_DEV_ANY_ID },

I am fine with this patch but won't add an RB because of the (many) checkpatch
errors.  Based on the comment I made on the previous set seeing those was
unexpected.

Thanks,
Mathieu

>  	{ 0 },
>  };
>  
> -- 
> 1.9.3
> 
