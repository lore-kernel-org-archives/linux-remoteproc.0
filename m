Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C6FC54E76
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Jan 2023 22:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbjADWzp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Jan 2023 17:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234565AbjADWzj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Jan 2023 17:55:39 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F7647326
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Jan 2023 14:55:37 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id c190-20020a4a4fc7000000b004a3addd10b5so6753552oob.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Jan 2023 14:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rSa3y2kVtXyGfcBV6KdEhTjbXDEsZrA1QZe8gseBjok=;
        b=pdyU5nNwLPBCT14Il41JLXWCOGGjzhZ4+/GNaRyCvoxhZxkZmU4IXOpTTppmn/l7+m
         H6wQXscp6yQEha0x4Im1vXl/LkEmw3hm1SugtqM17JUzmrfKImfohf5zBk5FUs58OB3q
         exz/fJi8zcAHdS4uiEK9t4dx3lQsHNPSchD5KnhuGwT/o7CCDMvrU/hMcYVzbTaS35nE
         9+dQRxUAXzGlXEbQGM+omi47Y/9m9f5Y7us2U2xh00UMTdwQQVPAn41osB1UB2HeDRA1
         6+aDcvEkCLucxEV9EDI93yOaPLK6QEHwPvxkajgsNNX+W3EhSHKPA72kjjhwDQZooPhY
         j1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSa3y2kVtXyGfcBV6KdEhTjbXDEsZrA1QZe8gseBjok=;
        b=2utlVPdtzdyWq+WPV/iVxDiVzdzNILlkdq9iRD4+c9ATVFoWbH4qBZ8629sd2CoaxV
         oBNFjHhvjQVwjg1B/raLE+Sy23jvkFOPWUwSMRzefa7Ch4w1fRkiqjHGwLhtWQNFcneM
         2vQCIfAYMaFRhQIO8KLccu7dGLnyR6sfThjQ4jp1YxpCNttGEB9cbHNxcHMGxecGGTzd
         B7RVjEzZjoehGIOGPmdkRUFMwOYptP+Ccv4br+2NHFQSfJx9uAO1+/vmi9rFU5m9O497
         kHCdDPw6Az6ZUu7If/rrGanYFZkOg+cEmFbHXQlvB49jaO8Ca9Ahb1jzpN+JEVujUTLV
         U14Q==
X-Gm-Message-State: AFqh2kpemZr2cS26q6dCU8unFhMmNO0pJIWfaDffgNHo8xf5O+SrrIHu
        LQ2ft2Nqc2uGs8w3++ZMmXo1bkxyp3Um2qqO
X-Google-Smtp-Source: AMrXdXunaxUnZdko3CQ/sTo/WkLccuHLO8jxYV96IN/3Yhs/EMlXwL0hEXVd2h6ymN2kv2e8H7xYPw==
X-Received: by 2002:a05:6a21:339b:b0:b0:29db:fb73 with SMTP id yy27-20020a056a21339b00b000b029dbfb73mr68503088pzb.12.1672872453217;
        Wed, 04 Jan 2023 14:47:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1328:ca09:d4c2:fcbc])
        by smtp.gmail.com with ESMTPSA id e11-20020aa798cb000000b005825460056asm7433625pfm.70.2023.01.04.14.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:47:32 -0800 (PST)
Date:   Wed, 4 Jan 2023 15:47:30 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     andersson@kernel.org, matthias.bgg@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wenst@chromium.org
Subject: Re: [PATCH 0/2] MediaTek SCP IPI cleanups
Message-ID: <20230104224730.GC2112402@p14s>
References: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jan 04, 2023 at 12:53:39PM +0100, AngeloGioacchino Del Regno wrote:
> Cleanups bringing no functional changes.
> Tested on MT8173 Elm, MT8192 Asurada, MT8195 Tomato.
> 
> This series applies only on top of [1].
> 
> [1]: https://lore.kernel.org/lkml/20230104083110.736377-1-wenst@chromium.org/
> 
> AngeloGioacchino Del Regno (2):
>   remoteproc/mtk_scp: Use readl_poll_timeout_atomic() for polling
>   remoteproc/mtk_scp: Remove timeout variable from scp_ipi_send()
>

I have applied both patches.

Thanks,
Mathieu

>  drivers/remoteproc/mtk_scp_ipi.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> -- 
> 2.39.0
> 
