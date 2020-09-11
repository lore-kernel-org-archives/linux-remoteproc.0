Return-Path: <SRS0=FKc4=CU=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E69AC433E2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Sep 2020 22:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47B702220A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Sep 2020 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599864751;
	bh=RMksnB2USVLAYdA7Din8lvL/aiUMw6qlDuy3tj4nzbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Zu0MyK47SJKFmzlth4uyrAkHn7UUeJXfQbltrvf4INBkBIXyCDu4lP+J15Y4FSph3
	 aIOGR9Gf1fYSRfUOAtm8CDYgHWTqq7Ix5XjgEoR9ligPGOMHDVmkerwh1HuQ16q6xX
	 ulrsQiSo8i26nD/g3OIpePucVnBCDK7Xn7Xl050A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgIKWwa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Sep 2020 18:52:30 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43626 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgIKWw3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Sep 2020 18:52:29 -0400
Received: by mail-io1-f65.google.com with SMTP id z25so12726060iol.10;
        Fri, 11 Sep 2020 15:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+wIAGYALZ0xOBvUiJa/BeqCe66OMKfu36KeZBaAVaaY=;
        b=tkZ1sl0PC2Pg1PWFfQnAnZW8hK1daakuQW3GQHs/x18znIFLIu3DhSNUfXDgUJYfqE
         XOpVfuMEp955O27a0lsMK93v1KqHAKf9DutIs5KLmd7ZKfmU6msnK0wnhSVs7bHk53jO
         XTzSD/7Z6qSE3BCAHF5qdWv09Nax5XUjfDwvjs2ZAraL9W5B8Jk+X+ti+yBi5LYjyhKk
         3q/NgeouBF/yv/cGn/Jm5Z7KIRfSHtDj0Lmq3AW6LTyb0xR/5Xyt41DfBAX+XRQR/O7H
         d4fXo7a+fTyDmuHxZoJnJTcNbbHCExNu1AxKUYVXqs21GS0jWlA60NLr1MApIi5dOVJc
         XsNQ==
X-Gm-Message-State: AOAM530f691/hNkOI807o1uRClPYdk145yA4FGsyeosvMYS7OgSEjHOz
        9kUlXNukvAJv4lIWaaR22w==
X-Google-Smtp-Source: ABdhPJy/ic3pBK76pvolk4fwx+DRImPyMN1vu/qNv4Gn/9LFaDYgqKoyQw8Ed8sT0SEisCAOBMt/SA==
X-Received: by 2002:a6b:e609:: with SMTP id g9mr3638445ioh.26.1599864748340;
        Fri, 11 Sep 2020 15:52:28 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p78sm1946018iod.0.2020.09.11.15.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 15:52:27 -0700 (PDT)
Received: (nullmailer pid 2969005 invoked by uid 1000);
        Fri, 11 Sep 2020 22:52:26 -0000
Date:   Fri, 11 Sep 2020 16:52:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Bailon <abailon@baylibre.com>
Cc:     stephane.leprovost@mediatek.com,
        linux-mediatek@lists.infradead.org, ohad@wizery.com,
        gpain@baylibre.com, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt bindings: remoteproc: Add bindings for MT8183
 APU
Message-ID: <20200911225226.GA2968956@bogus>
References: <20200910130148.8734-1-abailon@baylibre.com>
 <20200910130148.8734-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910130148.8734-2-abailon@baylibre.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 10 Sep 2020 15:01:45 +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
