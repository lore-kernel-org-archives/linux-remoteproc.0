Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C14C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Nov 2021 21:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242839AbhKXVPp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Nov 2021 16:15:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46545 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242742AbhKXVPp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Nov 2021 16:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637788354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RorRY0n5C9glkMtFV4SYCaRBzAHcsHcap7m+J3g1iLk=;
        b=ePwMCi1DZDZppmBAEH5yzbBGgNfv89jMoW8HEr8zKGjILhEIJvmy8cNmDGUJmL36+5aNJ0
        O1mYtx9WScdEiaHRYMn4qmBjXX6ThkJYFgkRUdQIoHDkW4qyBof2mIjrMrZ5vcsg2MxL0S
        beohRrUI4X0f/9UUcknur5sezmCPy/U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-pQ-7pJO2Ncu1B9I6DVfiCQ-1; Wed, 24 Nov 2021 16:12:33 -0500
X-MC-Unique: pQ-7pJO2Ncu1B9I6DVfiCQ-1
Received: by mail-ed1-f70.google.com with SMTP id w4-20020aa7cb44000000b003e7c0f7cfffso3525338edt.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Nov 2021 13:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RorRY0n5C9glkMtFV4SYCaRBzAHcsHcap7m+J3g1iLk=;
        b=ciF00wEL/dPS/6RPt0Ro7X8weKny0jRb8Md8UFrdVFeBXtihpy/cOmWM5G6gUArU5+
         mPBGjcdVr/gvnXCQjnwz5anEdTw/SccY8kOP2/hIlVS1N2A+/AmbpD53cpVJJ+J+i/Ua
         v/9MIRJhoscZKWD7mHz3rE/CyuyFG9tMDvYNaIEtATNYNCDaB+CCWajx3N/zqLDM6ugN
         r2q0wPA5+iA+x8U54Q74tfPhedV3A9SOHe2DOq1w5Ex5nTXIXpMDbf/jvjkOaGXCMjf1
         lCi8bWGwIdUTI5FZqYK6TmY/q1UwEUPbPnouAXmqCwf+Bpmpq63hVNCimgzgmJ8e1d0W
         Cq4Q==
X-Gm-Message-State: AOAM530Rz2qSJKPdbmE5sML6+HLAVxRKGfhSOrnSsK3bxlYIVgJ/84BN
        XmmkIcufGAb1K9sX1v3qWZqyFcT0sLCPNVqMfPg14ZaHY0Ha/dDKYp6IbpkRX4K2BB2wmi8KTy7
        xvGDc8HSm8Ipxga52QzLFTIixU05EOA==
X-Received: by 2002:a05:6402:169a:: with SMTP id a26mr31105968edv.292.1637788352276;
        Wed, 24 Nov 2021 13:12:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqLmOWsCPmneNLjCwAsRX93gntMVvVuAlK+kAEx/6faUF7BKjEYByFENyGpUnzu7kS+ByTsg==
X-Received: by 2002:a05:6402:169a:: with SMTP id a26mr31105915edv.292.1637788352006;
        Wed, 24 Nov 2021 13:12:32 -0800 (PST)
Received: from redhat.com ([2.55.144.93])
        by smtp.gmail.com with ESMTPSA id em21sm456589ejc.103.2021.11.24.13.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:12:30 -0800 (PST)
Date:   Wed, 24 Nov 2021 16:12:26 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] rpmsg: virtio: don't let virtio core to validate used
 length
Message-ID: <20211124161055-mutt-send-email-mst@kernel.org>
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> Using OpenAMP library on remote side, when the rpmsg framework tries to
> reuse the buffer the following error message is displayed in
> the virtqueue_get_buf_ctx_split function:
> "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> 
> As described in virtio specification:
> "many drivers ignored the len value, as a result, many devices set len
> incorrectly. Thus, when using the legacy interface, it is generally
> a good idea to ignore the len value in used ring entries if possible."
> 
> To stay in compliance with the legacy libraries, this patch prevents the
> virtio core from validating used length.
> 
> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---

Arnaud, thanks a lot for the analysis.

Jason, I think this is another good point. We really should not
validate input for legacy devices at all.


> Update vs v1[1]: update commit message to clarify the context.
> 
> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> 
> [1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9c112aa65040..5f73f19c2c38 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
>  	.feature_table_size = ARRAY_SIZE(features),
>  	.driver.name	= KBUILD_MODNAME,
>  	.driver.owner	= THIS_MODULE,
> +	.suppress_used_validation = true,
>  	.id_table	= id_table,
>  	.probe		= rpmsg_probe,
>  	.remove		= rpmsg_remove,
> -- 
> 2.17.1

