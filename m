Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE5C433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DE7F610CD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244083AbhDPR7U (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243998AbhDPR7U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 16 Apr 2021 13:59:20 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB61C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:58:55 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u15so5843304plf.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p6foCwxVCDklL/5CLAd0ULHN1p3sHTS6VkpK8Ctm3DA=;
        b=fffoeN4GJycmqznQs0nwnRxEJQ95+4/yJHVb/0GPi192N1u88XITWkwJdOWgLUgVDr
         6W8gPp+n7VRT3NekSQsDBQZqHiDLZfk7PNVmu/QuR2CKMs5/WFtEM+qKoas9aOJO0jR6
         5B1j00mBHPLQ4ebYcNzx9jP2xp4EioNDtqC2XH9nA/z3Ily6ea7lELBG+aRLbOqcSHDv
         qp1Z7I9jFDPnJzkfoRboDsmJD99aiFbPjd2QRCKixaGP0N9QpOP5PHFMZ/zbhXB0u30s
         jdE5/0LJoLLSllhgR9A2rijh3PrhNLhHs3yiDaajnRRULZbNj7R3XDQNo+NcQcrwNK26
         uUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p6foCwxVCDklL/5CLAd0ULHN1p3sHTS6VkpK8Ctm3DA=;
        b=CxhQQVoJqoVC3iddaxa5pMJRYDFNQjy0yEcTxyhETN/49ODZZO9gBwWVWv5/gQXCRO
         1LLV8KtY2AU6o1jMa+hpcIpJJ5XEzCwyEkbxtxO8ykZb/9qu9NKKSDWk7YbYSbnfqDwi
         pgjQeEJkmD1Crc3hkx79m3VxMDGzw9mv/HbOdqDT/I9bf1oHdIcph/aANGNZUxaKXHsp
         65gl89xurulPpKe+9kNQCG1Jsnul5IByAwX677oNZZVRnQw70aF3d2+nDbYCimtt+1zz
         Ex3XP6KseIoLovPZ4lXOCTPy9W0uSn4HTdXov46J7KLptXPbFa6kMPEAK5vlsD4XfuWP
         3YbA==
X-Gm-Message-State: AOAM5338YO12XmJloIz214uYTjk2KWcZkTj7vYVL3DXUa84J/8mfGMcK
        VY5/lSmK3ZFL4uykOlcR6MHDJA==
X-Google-Smtp-Source: ABdhPJxiAj8b5+5zgYtISRM9Z7KkIhSkLjEOGrG4RQsiofcjbDMLy3JIenak2OGgUCAw9n/ungf3yA==
X-Received: by 2002:a17:902:7589:b029:e8:c011:1f28 with SMTP id j9-20020a1709027589b02900e8c0111f28mr10610951pll.35.1618595935289;
        Fri, 16 Apr 2021 10:58:55 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o134sm5071499pfd.66.2021.04.16.10.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 10:58:54 -0700 (PDT)
Date:   Fri, 16 Apr 2021 11:58:52 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Message-ID: <20210416175852.GE1050209@xps15>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 15, 2021 at 09:27:33PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V4:
>  Typo fix 
>  patch 4: take state as a check condition
>  patch 5: move regmap lookup/attach to imx_rproc_detect_mode
>  patch 6: add imx_rproc_clk_enable for optional clk
>  patch 8: use switch/case in imx_rproc_detect_mode
> V3:
>  Add A-b tag for Patch 1/2
>  Fix the checkpatch warning for Patch 6,8
> 
> V2:
>  Patch 1/8, use fsl as vendor, typo fix
>  Because patchset [1] has v2 version, patch 5,6,7,8 are adapted that
>  change.
> 
> This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to
> parse fsl,auto-boot
>

Always specify what branch your work applies on and dependencies for it.  If
this was ready to go Bjorn would have a fun time figuring out it depends on your
other set[1].

I am done reviewing this pathset.

Mathieu 

[1] [PATCH V3 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
 
> 
> Peng Fan (8):
>   dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
>   dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
>   dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
>   remoteproc: imx_rproc: parse fsl,auto-boot
>   remoteproc: imx_rproc: initial support for mutilple start/stop method
>   remoteproc: imx_rproc: make clk optional
>   remoteproc: imx_rproc: support i.MX7ULP
>   remoteproc: imx_rproc: support i.MX8MN/P
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  11 +-
>  drivers/remoteproc/imx_rproc.c                     | 206 +++++++++++++++++----
>  2 files changed, 179 insertions(+), 38 deletions(-)
> 
> -- 
> 2.7.4
> 
