Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C137C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 21:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D8E060F9C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 21:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhHBV25 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:28:57 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:46061 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbhHBV24 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Aug 2021 17:28:56 -0400
Received: by mail-io1-f42.google.com with SMTP id a1so7292322ioa.12;
        Mon, 02 Aug 2021 14:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tp4KXngrXO5YFcCu25Pr4mtZcirjXylO0I9E5ahmR5o=;
        b=OH9FKBW+UoSyBWQj6Js9+SLlKJKb6bukujpcuuHivnM2+or9dcBqg6wjSRNSN2OrOS
         VrLjS5VFampXATAlrZOiWyXWJzfNu0ejCFF+h+hJLdohcUbd3iEVneg05wqAWNnKhE8y
         hqRaSNPkKBIliyJtj31x4rWi859uJGdot9irnFQzrT2AaK3dRmI9YGVlN2X0e/7F/qtr
         DrTxdkHst4U5FVMvFkVBIhTfjhPhxZE+l7X2ZEuW3hkY3KQGC8H9/ffH/vxb3rh4neE1
         O3yekZkMGFdrv+LiKUBiWo1n/wWd6AjYwrLpv52RP780VSmfs68YCQtW+XZsoYmC4z2F
         k17Q==
X-Gm-Message-State: AOAM5302jND7mZoj7HzRSvKfGaEbpS/x1pUiIUHIlKYB33X0oyeU/QXh
        IIi0SFlu5C03ihortg4Xlw==
X-Google-Smtp-Source: ABdhPJyldCJgnalyfRFG+7ACY6zzoUaTex+igLoi0aih7vtZQps+sgRlFsWojK8EOIfhMzzjqCr3YA==
X-Received: by 2002:a5e:9602:: with SMTP id a2mr2332783ioq.146.1627939726284;
        Mon, 02 Aug 2021 14:28:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b15sm6203762ilq.85.2021.08.02.14.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:28:45 -0700 (PDT)
Received: (nullmailer pid 1645679 invoked by uid 1000);
        Mon, 02 Aug 2021 21:28:44 -0000
Date:   Mon, 2 Aug 2021 15:28:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
        mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, bjorn.andersson@linaro.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        tzungbi@google.com, linux-remoteproc@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, ohad@wizery.com
Subject: Re: [PATCH v4 2/4] dt-bindings: remoteproc: mediatek: Add binding
 for mt8192 scp
Message-ID: <YQhjjFybXYEbGki0@robh.at.kernel.org>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-3-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 28 Jul 2021 11:58:57 +0800, Tinghan Shen wrote:
> Add mt8192 compatible to binding document.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
