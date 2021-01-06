Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD11C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 21:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 734692333B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 21:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbhAFVxS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 16:53:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbhAFVxS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 16:53:18 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D79C061786
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jan 2021 13:52:38 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m5so2328733pjv.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jan 2021 13:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HukvAs5xxTkseuhceHeX/B2BEJaqcqWMBwuX9s+LI9M=;
        b=Wvr00hYTEdWIPua37y5P419mwAgY2sjz2en3bOtw/Z1bU7ZaNsz0tgC6ULfZXg3zRg
         xVL4ce48B/3iT2FGOR4hTKPN/xql6b++xIuUWE4l+iGfWXRJV2OMxrnT/imnAyZY4n24
         I4rMswWAJJ8FOZ/0lQUGEhp2ZgCU5eVkkf4Enkx+YfiQvfW3zNtboVCfGfgMyqyMFytW
         iQIvHfP0btcxr7CzFHSij2Ykb8A/G2PMlliUOEh3tFxIRk/J7feSMHAb8/kGcYgqmoBr
         Ai2mvJayclIkQ1GKmIpu1RN58v0HJAy4xJKNW873CnnDSsf7CVrHby0lP6dbqBTqpTZm
         gSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HukvAs5xxTkseuhceHeX/B2BEJaqcqWMBwuX9s+LI9M=;
        b=hTweCZTQVVfnhFY2QCMpT8f5uGRQs8yjd1zqHS7p7+VgcTxZIjqOY57crLG2CmaqQ8
         LItSjUSH2oCqDSSDSk9KgsLyAMEC4HbJ3esy94w+rZTTaq/maGpiUppEpz2DCqwbyu21
         Dr3zNEj5gueOSkRKD8KSkRCsExv+PojwH4gsoecPPzHwZgMe8E8A7PW1Hxx+baSr5ECj
         oV2L9wTvGOos61nn+zklF3nryym+YE8VFjWBx75ReSgK0W579JEyb/dXrxNT4B9G1XKo
         T39IC28/1xnKcpUO8AOA8aDEHG4127SKZnpPx9OpTFXdPfZusG+C3rBpXiZUDFlFGNyg
         7N9g==
X-Gm-Message-State: AOAM533rmI1C8ZCLWLYgl/jM7jkNXOjEqxqWODEzWjksNXkA9VJ3D7i+
        cntMCfxIHxUm6Zpr/AeN3cGAJ/FMNqYjYg==
X-Google-Smtp-Source: ABdhPJw3UwzxDGQ/wLD0G46TUGwVhsCVBULh4e9UkSGcf7xUZS0T0Aq1n5n2ls5F+sQ7hQyz9+ohAw==
X-Received: by 2002:a17:90b:100e:: with SMTP id gm14mr6139267pjb.179.1609969957794;
        Wed, 06 Jan 2021 13:52:37 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k15sm3403025pfp.115.2021.01.06.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 13:52:36 -0800 (PST)
Date:   Wed, 6 Jan 2021 14:52:34 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-remoteproc@vger.kernel.org
Subject: Re: Doc to write firmware?
Message-ID: <20210106215234.GB9149@xps15>
References: <93HSLQ.5D3DAYSGVCVP@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93HSLQ.5D3DAYSGVCVP@crapouillou.net>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Paul,

On Wed, Dec 23, 2020 at 10:57:09AM +0000, Paul Cercueil wrote:
> Hi,
> 
> Having written the ingenic-remoteproc driver I am trying now to write
> something a bit more advanced than a hello-world. Something like a
> case-invert program for starters. However I'm having a hard time trying to
> figure out how things work.
> 
> My resource table is as follows:
> 
> ----------------------------
> struct resource_table_hdr {
> struct resource_table header;
> 
> uint32_t offset[3];
> 
> struct {
>  struct fw_rsc_hdr header;
>  struct fw_rsc_carveout carveout;
> } carveout;
> 
> struct {
>  struct fw_rsc_hdr header;
>  struct fw_rsc_trace trace;
> } trace;
> 
> struct {
>  struct fw_rsc_hdr header;
>  struct fw_rsc_vdev vdev;
>  struct fw_rsc_vdev_vring vrings[2];
>  uint8_t config[0xc];
> } vdev;
> };
> 
> const struct resource_table_hdr resource_table
> __attribute__((used, section (".resource_table"))) = {
> .header = {
>  .ver = 1,
>  .num = ARRAY_SIZE(resource_table.offset), /* Number of resources */
> },
> 
> .offset[0] = offsetof(struct resource_table_hdr, carveout),
> .offset[1] = offsetof(struct resource_table_hdr, trace),
> .offset[2] = offsetof(struct resource_table_hdr, vdev),
> 
> .carveout = {
>  .header = {
>   .type = RSC_CARVEOUT,
>  },
>  .carveout = {
>   .da = 0xf4000000,
>   .len = 0x2000,
>   .name = "firmware",
>  },
> },
> 
> /* Trace resource to printf() into */
> .trace = {
>  .header = {
>   .type = RSC_TRACE,
>  },
>  .trace = {
>   .da = (uint32_t)trace_buf,
>   .len = TRACE_BUFFER_SIZE,
>   .name = "trace",
>  },
> },
> 
> /* VirtIO device */
> .vdev = {
>  .header = {
>   .type = RSC_VDEV,
>  },
>  .vdev = {
>   .id = VIRTIO_ID_RPROC_SERIAL,
>   .notifyid = 0,
>   .dfeatures = 0,
>   .config_len = 0xc,
>   .num_of_vrings = 2,
>  },
>  .vrings = {
>   [0] = {
>    .align = 0x10,
>    .num = 0x4,
>    .notifyid = 0,
>   },
>   [1] = {
>    .align = 0x10,
>    .num = 0x4,
>    .notifyid = 0,
>   },
>  },
> },
> };
> ----------------------------
> 

The lack of proper tabulation above makes it really hard to read.

> The firmware is properly loaded and I get debug prints in my trace buffer.
> However, my vrings' .da fields don't seem to be initialized to anything
> meaningful at all. Then I use the virtio/vring code from (https://github.com/MIPS/mips-rproc-example/blob/master/firmware/common/include/vring.h),
> and calling vring_print() shows that my vring_desc's addresses are garbage
> as well.
> 
> Is there an example on how to write a basic I/O remoteproc program?
> 

The easiest is probably to implement a VIRTIO_ID_RPMSG and try to test things
out with the RPMSG client sample application [1].  It isn't an I/O example but it
will allow you to quickly find the problem with the vring addresses.

You may also want to checkout ST's development kit [2] if you want a working
example.  I use it as one of my reference board, the price is right and the
support is completely upstream.  

Mathieu 

[1]. https://elixir.bootlin.com/linux/latest/source/samples/rpmsg/rpmsg_client_sample.c
[2]. https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html

> Cheers,
> -Paul
> 
> 
