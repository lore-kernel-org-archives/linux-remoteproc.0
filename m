Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF88C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Jul 2022 09:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236346AbiGAJjL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Jul 2022 05:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236207AbiGAJjK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Jul 2022 05:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6754C1E3DD
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 Jul 2022 02:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656668348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M6jjd4ijXuXIvJJrjir19vpImb6pnScxQWCTyU/0jws=;
        b=LPAmb7aixWLlNHwghQIer3DV0GXscDLx+OW5I9ldUKTwjeBtv+6DYPt67SlgWb/O3bfRYX
        3Y+8jJfBzN+7IcHSg4cVN4N7bWNaydxVkxXjkrmJ7lP7wwHPhZxj2GHL5SBpEmrfIAn+nA
        2LyVimUfefE2qHr4YZtQHUdv6o9rhAg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-6ZkHDghJPFiNz0FqY-hDxA-1; Fri, 01 Jul 2022 05:39:07 -0400
X-MC-Unique: 6ZkHDghJPFiNz0FqY-hDxA-1
Received: by mail-wm1-f72.google.com with SMTP id m20-20020a05600c4f5400b003a03aad6bdfso785838wmq.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 Jul 2022 02:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=M6jjd4ijXuXIvJJrjir19vpImb6pnScxQWCTyU/0jws=;
        b=sHI5qeCviyJWLj/uq09SYUwF/Nvx+3+RyPPshK/6rmSJuHbk77ymuy68QOYbIXvTXd
         mo5oWNpBcQ8x6Y9EUrP6dWw0zU9FlEfcdA/lgO9DWKdtWJ9jLnlWu8jegqHlDwQsM6gL
         tq/2fq+UR16IBgNA+UK/6nImMhsH8pfwFukMle285MI8AFlDrD5HYAmjibMITHKX5BUT
         2qXEJR7qhNGiD5YbGLJ6OPzAtamyhg5LDHQK7aSWekRdF/e+WKO/77AZHucrTUA8xWNt
         QkffIi7rofWOosuiFRb+xEzkwmapW9U0bbwwbhWAwnASVb8y/qMqbbXShh1TIso1Z7g5
         xT1w==
X-Gm-Message-State: AJIora+NcjeMk1trDHve/tye00eoc3Ev2bqNICwolElHqMikUV64usZE
        ciyTsNp9bof6RtEP9ZNGui3OBXJ5a5hljUgqqApVyXSP3WGF9SHd/goFPnyt6aa2pvRIWWfBgUW
        FVmQWVhxLflTfrfEouzlGxzxdiiCiSA==
X-Received: by 2002:a05:6000:a1e:b0:21b:8c8d:3cb5 with SMTP id co30-20020a0560000a1e00b0021b8c8d3cb5mr12801981wrb.372.1656668345694;
        Fri, 01 Jul 2022 02:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFcAXZoAaZyHfEts4V1bW0kmJ5lrttXMA/0eqVrtSgtW5wTjnCGywc6ih/h68PKIHmHWboSw==
X-Received: by 2002:a05:6000:a1e:b0:21b:8c8d:3cb5 with SMTP id co30-20020a0560000a1e00b0021b8c8d3cb5mr12801952wrb.372.1656668345358;
        Fri, 01 Jul 2022 02:39:05 -0700 (PDT)
Received: from redhat.com ([2.55.3.188])
        by smtp.gmail.com with ESMTPSA id bg28-20020a05600c3c9c00b003a175bc9c17sm6267998wmb.42.2022.07.01.02.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 02:39:04 -0700 (PDT)
Date:   Fri, 1 Jul 2022 05:39:01 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Anup Patel <apatel@ventanamicro.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Atish Patra <atishp@atishpatra.org>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Anup Patel <anup@brainfault.org>,
        linux-remoteproc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
Message-ID: <20220701053813-mutt-send-email-mst@kernel.org>
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s>
 <20220630151716-mutt-send-email-mst@kernel.org>
 <65d972ed-31b4-5636-86a3-dabd5f25a3be@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65d972ed-31b4-5636-86a3-dabd5f25a3be@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 01, 2022 at 11:00:28AM +0200, Arnaud POULIQUEN wrote:
> Hello,
> 
> On 6/30/22 21:19, Michael S. Tsirkin wrote:
> > On Wed, Jun 29, 2022 at 11:43:18AM -0600, Mathieu Poirier wrote:
> >> Hi Anup,
> >>
> >> On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> >>> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> >>> fails due to both virtqueues (Rx and Tx) marked as broken by the
> >>> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> >>> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> >>>
> >>> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> >>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>> ---
> >>>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> index 905ac7910c98..71a64d2c7644 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>  	/* and half is dedicated for TX */
> >>>  	vrp->sbufs = bufs_va + total_buf_space / 2;
> >>>  
> >>> +	/* From this point on, we can notify and get callbacks. */
> >>> +	virtio_device_ready(vdev);
> >>> +
> >>
> >> Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> >> potentially be called (by way of rpmsg_recv_done()), which will race with
> >> virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> >> rpmsg_recv_done() will fail, potentially breaking remote processors' state
> >> machines that don't expect their initial name service to fail when the "device"
> >> has been marked as ready.
> > 
> > When you say available I am guessing you really need used.
> > 
> > With a non broken device you won't get a callback
> > until some buffers have been used.
> > 
> > Or, if no used buffers are present then you will get another
> > callback down the road.
> 
> In current implementation the Linux rpmsg_virtio driver allocates the
> virtio buffers for the coprocessor rpmsg virtio device transmission and
> then updates the virtio device status in shared memory to inform the
> coprocessor that it is ready for inter-processor communication.
> 
> So from coprocessor perspective, when the virtio device is ready
> (set to VIRTIO_CONFIG_S_DRIVER_OK), it can
> start to get available buffers and send virtio buffers to the Linux.
> 
> With the patch proposed, the virtio is set to VIRTIO_CONFIG_S_DRIVER_OK
> while no buffer are available for the coprocessor transmission.
> 
> I'm agree that, if the Linux rpmsg_virtio driver has not allocated the
> buffer, the coprocessor will fail to get available virtio buffer for
> communication and so has "just" to wait that some buffers are available
> in the virtqueue.
> 
> But this change the behavior and can lead to an unexpected error case
> for some legacy coprocessor firmware...
> Should we take the risk that this legacy is no longer compatible?
> 
> 
> That said regarding the virtio spec 1.1 chapter 3.1.1 [1], I also wonder
> if the introduction of the virqueue broken flag is compliant with the
> spec? 
> But i guess this is probably a matter of interpretation...
> 
> " 
> The driver MUST follow this sequence to initialize a device:
> [...]
> 7. Perform device-specific setup, including discovery of virtqueues for
> the device, optional per-bus setup, reading and possibly writing the
> device’s virtio configuration space, and population of virtqueues.
> 8. Set the DRIVER_OK status bit. At this point the device is “live”.
> "
> 
> My question is what means in point 7. "and population of virtqueues"?
> 
> In my interpretation the call of "virtqueue_add_inbuf()" populates the
> RX virtqueue.
> That would mean that calling virtqueue_add_inbuf before calling 
> virtio_device_ready() should be possible.
> 
> Thanks,
> Arnaud 
> 
> [1]https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html#x1-920001

I think I agree. For example, the networking device uses "population" in this
sense:

	It is generally a good idea to keep the receive virtqueue as
	fully populated as possible: if it runs out, network performance
	will suffer.



> 
> > 
> > 
> >>
> >> What does make me curious though is that nobody on the remoteproc mailing list
> >> has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> >> i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> >> their rig?
> >>
> >> Thanks,
> >> Mathieu
> >>
> >>>  	/* set up the receive buffers */
> >>>  	for (i = 0; i < vrp->num_bufs / 2; i++) {
> >>>  		struct scatterlist sg;
> >>> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>  	 */
> >>>  	notify = virtqueue_kick_prepare(vrp->rvq);
> >>>  
> >>> -	/* From this point on, we can notify and get callbacks. */
> >>> -	virtio_device_ready(vdev);
> >>> -
> >>>  	/* tell the remote processor it can start sending messages */
> >>>  	/*
> >>>  	 * this might be concurrent with callbacks, but we are only
> >>> -- 
> >>> 2.34.1
> >>>
> >>
> > 

