Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9141C83F3E
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Sep 2023 16:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjIEQhF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242614AbjIEQK4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Sep 2023 12:10:56 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D261A4681
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Sep 2023 09:03:40 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so42262241fa.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Sep 2023 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693929744; x=1694534544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HuesmVtK7DY96AH/YK83Nl0b32AkxGZUPFL/hVVMFUg=;
        b=MPcaRfiW/vjXKWrv019qqvZKWaAS1lHV5Wo7UK8x6YZOIMBs3QF+I79dBXgHibYMNN
         9pyz7X6uKQ1pxkDMZohMGjjQ6k0iuiDYQDsN+exla0hNVSJPaXSKbcr6IWPkW5iHSZb9
         2Hubcb3juE/FZ35cve+EzReobNy5b5Fymm5ybx5oL/ho+Vz9tp5pk3slgina1bWl2Kxf
         fr832fl1kFJ3cA4fIO9SCecq3S8gRCD3DS1YPH/4h/ChkHFt5XvcZo6dAj4meDjTiTj9
         fh6ulRc80Ki4yz+fXAsXigpwKGAEmo2omy3MH1Gzz5x4pVw42ASB5PCEF/pzCQDsw2mX
         WPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693929744; x=1694534544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuesmVtK7DY96AH/YK83Nl0b32AkxGZUPFL/hVVMFUg=;
        b=NSOgMkIHJCUXRyux9v9Wi5fOkhZkOkA084WMpHQTYNC1hTc793j1lJs6C243U/IYQA
         D9SHEoPvfzn9iY5nmGwspOAKgJgGhREpfadhx+6GsLdcC+UoyhkxscBGBFSRwVYo2tts
         6VAS4aKDdu3JycKsKtBxH03xumqdyR4dktmqzSGQT5dkP2rm02nUKEm04seI04b6R3pz
         8zCMAkaEv1aXg3VdIHCqdDXkwXM0sVuP+CQRlpasOE2JTYykl3ozWOp76iWNHxBef0K+
         agSasfT41uxkSh9fiHvmqUZahETnx3Z61XxEGlEY2StOmZs4U7fjrCuZfF3ryyAtBOXw
         BliQ==
X-Gm-Message-State: AOJu0Yz2kGhP2i9wX0+kZPchWbsrz595wZLizr70ReOcr9RFsv+P8uzY
        M+TxppLg3Ew8ipxoFiQIf9dWBlynPlO+DR8uQEN003XsAVcc94NK
X-Google-Smtp-Source: AGHT+IFGidhnXcZupBGDTd+91vs6CEUHV6m7KxA7cQOuGCuslwdO0rLNWcDIK+Mp7NUitZpn1qi9MLPNQHDf7wMdRpM=
X-Received: by 2002:a2e:9b50:0:b0:2bc:d7d6:258f with SMTP id
 o16-20020a2e9b50000000b002bcd7d6258fmr148779ljj.35.1693929743936; Tue, 05 Sep
 2023 09:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230904083602.106703-1-tim@klingt.org> <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com>
 <ZPZBVS3R/oZuUmk5@p14s> <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
In-Reply-To: <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 5 Sep 2023 10:02:12 -0600
Message-ID: <CANLsYkyqe6GNgpjpK4C+e2Zs9LcQywaPvChHgZsAK7hpzKpO8g@mail.gmail.com>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race condition
To:     Tim Blechmann <tim@klingt.org>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        Tim Blechmann <tim.blechmann@gmail.com>,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 4 Sept 2023 at 19:33, Tim Blechmann <tim@klingt.org> wrote:
>
> >>> when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
> >>> enables tx-complete interrupt.
> >>> however if the interrupt is executed after `get_a_tx_buf` and before
> >>> `rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
> >>> for the full 15 seconds.
> >>
> >>
> >> Is there any reason why your co-processor is unable to release the TX RPMSG
> >> buffers for 15 seconds? If not, you should first determine the reason why it is
> >> stalled.
> >
> > Arnaud's concern is valid.  If the remote processor can't consume a buffer
> > within 15 seconds, something is probably wrong.
> >
> > That said, I believe your assesment of the situation is correct.  *If* the TX
> > callback is disabled and there is no buffer available, there is a window of
> > opportunity between calls to get_a_tx_buf() and rpmsg_upref_sleepers() for an
> > interrupt to arrive in function rpmsg_send_offchannel_raw().
>
> the remote processor certainly releases the tx buffer and according to
> my tracing the `vring_interrupt` fires immediately before `rpmsg_send`
> enters the `rpmsg_upref_sleepers`.
>
> after applying this patch we haven't been able to reproduce the 15s
> timeout anymore, whereas before we could easily reproduce it with
> certain workloads.
>
> > 3) This patch gets applied when rc1 comes out so that it has 6 or 7 weeks to
> > soak.  No error are locks are reported due to this patch during that time.
>
> mentioning locks: i was a bit uncertain about a good way to implement
> the retry, since both `rpmsg_upref_sleepers` and `get_a_tx_buf` both
> acquire the same mutex. i briefly considered to add `get_a_tx_buf` into
> `rpmsg_upref_sleepers` to avoid locking the same mutex multiple times,
> though it adds a bit of complexity to the implementation and harms
> readability a bit.

The current implementation looks good to me.

> are there any recommendations on this topic or are (likely
> non-contended) locks not expensive enough to justify the added complexity?
>

Since we are changing how buffers are delivered to applications in a
highly concurrent environment, it is possible for this patch to
introduce unintended side effects, something I want to avoid as much
as possible.

I am not worried about contentions for the vrp->tx_lock.

> thanks,
> tim
>
>
> >
> >>
> >> Regards,
> >> Arnaud
> >>
> >>>
> >>> in this case, so we re-try once before we really start to sleep
> >>>
> >>> Signed-off-by: Tim Blechmann <tim@klingt.org>
> >>> ---
> >>>   drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
> >>>   1 file changed, 15 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> index 905ac7910c98..2a9d42225e60 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >>>
> >>>     /* no free buffer ? wait for one (but bail after 15 seconds) */
> >>>     while (!msg) {
> >>>             /* enable "tx-complete" interrupts, if not already enabled */
> >>>             rpmsg_upref_sleepers(vrp);
> >>>
> >>> -           /*
> >>> -            * sleep until a free buffer is available or 15 secs elapse.
> >>> -            * the timeout period is not configurable because there's
> >>> -            * little point in asking drivers to specify that.
> >>> -            * if later this happens to be required, it'd be easy to add.
> >>> -            */
> >>> -           err = wait_event_interruptible_timeout(vrp->sendq,
> >>> -                                   (msg = get_a_tx_buf(vrp)),
> >>> -                                   msecs_to_jiffies(15000));
> >>> +           /* make sure to retry to grab tx buffer before we start waiting */
> >>> +           msg = get_a_tx_buf(vrp);
> >>> +           if (msg) {
> >>> +                   err = 0;
> >>> +           } else {
> >>> +                   /*
> >>> +                    * sleep until a free buffer is available or 15 secs elapse.
> >>> +                    * the timeout period is not configurable because there's
> >>> +                    * little point in asking drivers to specify that.
> >>> +                    * if later this happens to be required, it'd be easy to add.
> >>> +                    */
> >>> +                   err = wait_event_interruptible_timeout(vrp->sendq,
> >>> +                                           (msg = get_a_tx_buf(vrp)),
> >>> +                                           msecs_to_jiffies(15000));
> >>> +           }
> >>>
> >>>             /* disable "tx-complete" interrupts if we're the last sleeper */
> >>>             rpmsg_downref_sleepers(vrp);
> >>>
> >>>             /* timeout ? */
> >>>             if (!err) {
> >
>
