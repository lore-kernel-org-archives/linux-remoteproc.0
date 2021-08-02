Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86555C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 21:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6131060F9C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 21:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhHBV2l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:28:41 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:46924 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbhHBV2l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Aug 2021 17:28:41 -0400
Received: by mail-io1-f54.google.com with SMTP id z7so21130079iog.13;
        Mon, 02 Aug 2021 14:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rwbz+9oA10Q9QsdsMkjyZuBQ2lk9vcIPiTkjDfV8lmw=;
        b=eA23xbB3pj/CgdBGHKAOn1EVwb7diu9S5sLBLtcb5WZxge6djoKukqSlkCjMcLcaIQ
         2v7Y9d4F1Uflo1e603LQVfoYt685cwVakHKQ1JBPNKMsIodpG17bHbTarWbscn9wcNGk
         JwP5ilZW49qQRhhCjiEbnh7N3PZOGAphC+gD1Ls5BbbL0hrcYlpuft34m8hNYvtlBjWp
         0jKd0CB2QciCE+xnQedAbxhMUf3q1IhQugOeBDhOssTJYbK5mQltv2NLW8tfNQMGkwOd
         qLh2udQ1i8D7kySd0QVjPsweotICehnoJ74SHmDStn1bdW7dlKAkfqyQ4qJS4DXqCKhx
         PssA==
X-Gm-Message-State: AOAM5325K/N/OQ0OhlXhkWzMvJlqpBJx+4n/czptq7vcigEx7cJ60719
        arB75c/Nx0zIxWDvZG28Og==
X-Google-Smtp-Source: ABdhPJwE9OTwBkhkpNH5jrk9TiJwhIICdzquhDmeR+v16AGfUIj1mXQKD5hGQ/Df2Gh+mxcZ48aBJg==
X-Received: by 2002:a02:a69a:: with SMTP id j26mr16479456jam.9.1627939710985;
        Mon, 02 Aug 2021 14:28:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g9sm1038291ilj.70.2021.08.02.14.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:28:30 -0700 (PDT)
Received: (nullmailer pid 1645191 invoked by uid 1000);
        Mon, 02 Aug 2021 21:28:28 -0000
Date:   Mon, 2 Aug 2021 15:28:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        tzungbi@google.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        srv_heupstream@mediatek.com, bjorn.andersson@linaro.org,
        matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, ohad@wizery.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: mediatek: Add binding
 for mt8195 scp
Message-ID: <YQhjfMoloq6uza42@robh.at.kernel.org>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-2-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 28 Jul 2021 11:58:56 +0800, Tinghan Shen wrote:
> Add mt8195 compatible to binding document. The description of required
> properties are also modified to reflect the hardware change between
> mt8183 and mt8195. The mt8195 doesn't have to control the scp clock on
> kernel side.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
