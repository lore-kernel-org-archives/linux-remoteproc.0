Return-Path: <SRS0=8QH8=5X=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCA6C2BA16
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 05:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8077F20692
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 05:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uX2fXn5O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgDGFai (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Apr 2020 01:30:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43293 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgDGFai (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Apr 2020 01:30:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id s4so1167994pgk.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2020 22:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2yp65LXRHS8b4CoqvfhDXfYJaRJFniHa6sPW5Upo/IY=;
        b=uX2fXn5ODDErvR4rjd6maBLifARI491HJVvdbalmW7LUSWOMzTDIInpxZUs7WRGWIy
         lAWTmRHDbL9Fj4l9ZOStyk0ATa6OU/dnhWEyl1zAUmKBBtSOHyES/NnJMbbYjGP03m27
         MKEQKTxpdjmhoiepXNUPazApp9S18M8admZ6ftmuBuah3yjJZd8GbGsZXhAKgPTQFcGY
         BMucU1IM0AxDDmdgRetoGqyvEHfXOKbBQ79IHxdqRgZgfFY8DpFhYHxSrhBXDNcpgpHW
         O3ZmtklIsyDfOrw9gDio79Ldkk4BrpE87rCeTYwT0oyHwgTfi2KRffiQgCDiLbVGdQD1
         A32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2yp65LXRHS8b4CoqvfhDXfYJaRJFniHa6sPW5Upo/IY=;
        b=BnOBTk9fpbijtHHCjo4q1hu90Yb/1dL50YHbDMcRMOpK9VfLxfnPA2iMk/ZkTAVEMw
         awU9B4yEst1kMs+0F+/q+0eCMNhCYM378X9qzPsTLNKAVGRAxOHgSHhQ8rq7YoNp6zDv
         F01T+QqKAlbhZBNFk7jK4wtcjUHELhnqBA74NnjFtkAgiPrXeVcyS7PmzlXF9nZzs9bZ
         Y89y+kRUzDAnQHrDimWsJw4COahLPu/2zm9IEJ4sYYn4MJfcnYrn/p5+yG+vb1sg9kOa
         JIHkmju6BJJapLU9NC4scIQ7btdnTMuSkKCAv3iluyYjYr4ok0aetc2t2axx8v+UXAw8
         3+tg==
X-Gm-Message-State: AGi0PuZhtaabWvt4ZPjk+zokkT7HPk6OINgBbBHb5128UeLtqlJ1c2U1
        2tyfIQiBTzoSg1Le95Z1UBnXSw==
X-Google-Smtp-Source: APiQypLpy6z8Mw1alhL1ApCSa+GJdJhQWitDiE4nlil3Q7eMBzZ1zD9e90r0SwiRKTTBUrcZfPGTHQ==
X-Received: by 2002:a63:5c01:: with SMTP id q1mr351344pgb.177.1586237436887;
        Mon, 06 Apr 2020 22:30:36 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d23sm13042395pfq.210.2020.04.06.22.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 22:30:36 -0700 (PDT)
Date:   Mon, 6 Apr 2020 22:30:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v8 15/19] remoteproc: switch to virtio_legacy_init/size
Message-ID: <20200407053041.GH20625@builder.lan>
References: <20200407011612.478226-1-mst@redhat.com>
 <20200407011612.478226-16-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407011612.478226-16-mst@redhat.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200407053041.1kdRlVkExH2TtM6lssgZuHvWSm67pIFUtkZuIkUPqRY@z>

On Mon 06 Apr 18:16 PDT 2020, Michael S. Tsirkin wrote:

> These are used for legacy ring format, switch to APIs that make this
> explicit.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c   | 2 +-
>  drivers/remoteproc/remoteproc_virtio.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..c350a01e6c4e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -322,7 +322,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	struct rproc_mem_entry *mem;
>  
>  	/* actual size of vring (in bytes) */
> -	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
> +	size = PAGE_ALIGN(vring_legacy_size(rvring->len, rvring->align));
>  
>  	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
>  
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 8c07cb2ca8ba..35b02468197a 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -95,7 +95,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>  	len = rvring->len;
>  
>  	/* zero vring */
> -	size = vring_size(len, rvring->align);
> +	size = vring_legacy_size(len, rvring->align);
>  	memset(addr, 0, size);
>  
>  	dev_dbg(dev, "vring%d: va %pK qsz %d notifyid %d\n",
> -- 
> MST
> 
