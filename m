Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD11C6FD1F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Mar 2023 19:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjCNT3y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Mar 2023 15:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjCNT3i (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Mar 2023 15:29:38 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BC1D52E
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Mar 2023 12:29:37 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id i5so17739732pla.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Mar 2023 12:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678822177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CK2IjTOa6kx+2O+0qvyuETJVX+4bsfxYY0mt9ZuOep0=;
        b=dBP4RZImEELetPN5c5k+zQ7icfRKOmspW/8AMl/hUIayMAeJQRaezhgkj2BgANvDjO
         LzcIvQkg1v3BxobFxUbT+/BQdGP6T6gQxSLHqAFcr09VyHEjk5jm9fFV14CnPne8yttd
         mv7L4DwN8jwrrPhQ4H/wxnnUGYz+XXfGvxFFlDKkC2ZxWyU88c2NejGoWRwGIb2fj8AE
         vXC0ZH4Vg+0etQG6mqNKjD9YjwBx3JcH/jaBTuJZHvx1TAvd02ZRvdqY2GzQzr0ZqAYE
         Ji8m3k9iP/spW0n+lkE1Yx0EVxjcTjTiGRFGpz8EBNv48MjI5/ZcgozB30JR/OGLwkWp
         lJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678822177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK2IjTOa6kx+2O+0qvyuETJVX+4bsfxYY0mt9ZuOep0=;
        b=T06ciyrHfSQtvj91kuiUI/2kXlxUd1r0Cy8/kz4YTkSfOLrB5C+CgcoegkF0CoysaP
         lwGXHdXlPM7XoqIACkrp13dMt22AVjVKhypbrhl/6mJmvuM7CqZvhbMUoWMOSebH5XFR
         t5xeOu+Kg/FVv1N/VnctuxKoPpVYNCov0usUP7jENKsOIHCjOSXPIZEPTsHpxyZVK2Vc
         PlIJvQS1uhtqhvrtC+2YVAJvekveJUIHxysJXu/4v/x6rkIdn1tzJaRDR7QLeG0EkrmI
         7mhb6WwIJ5CCykV79pXzoILBWJP8nv4b3Goo1KGSIfARbM5EHu5Oy+krcnC013+pdLjc
         OGRA==
X-Gm-Message-State: AO0yUKUnZhpKoMya97nuE6pUNtOWATQU98BDh80x93Lho8Lma3U7V5Hq
        Y7DeLl6KYm5NnNu0zulBAd8vXg==
X-Google-Smtp-Source: AK7set/4Bn4GEOpvubE4b0UX68bVJOHmI59ol43NY+q+FykSxOopzcCjZK0rwWst/b+iVpyETbQJLQ==
X-Received: by 2002:a17:90b:1802:b0:237:c52f:a54d with SMTP id lw2-20020a17090b180200b00237c52fa54dmr14940407pjb.21.1678822176865;
        Tue, 14 Mar 2023 12:29:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f0b5:e541:9fc5:d395])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090ad50900b002311c4596f6sm2018603pju.54.2023.03.14.12.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 12:29:36 -0700 (PDT)
Date:   Tue, 14 Mar 2023 13:29:34 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     michal.simek@amd.com, andersson@kernel.org,
        jaswinder.singh@linaro.org, ben.levinsky@amd.com,
        shubhrajyoti.datta@amd.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 0/5] drivers: remoteproc: xilinx: add mailbox support
Message-ID: <20230314192934.GA2221478@p14s>
References: <20230311012407.1292118-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311012407.1292118-1-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 10, 2023 at 05:24:03PM -0800, Tanmay Shah wrote:
> This series adds mailbox support required for rpmsg communication
> in Xilinx remoteproc driver. It also fixes few bugs in Xilinx
> zynqmp-ipi driver that handles corner cases.
> 
> ---
> 
> Changes in v5:
>   - mailbox node count should not be 0 for driver to probe
>   - Remove spurious change
>   - Include kick op regardless status of mailbox nodes in dts
> 
> Changes in v4:
>   - split mailbox driver patch into 3 different patches
>   - use of_phandle_iterator_next to get memory-region nodes
>   - move zynqmp_r5_setup_mbox from zynqmp_r5_add_rproc_core to
>     zynqmp_r5_cluster_init
> 
> Changes in v3:
>   - split single patch into multiple patches
>   - add appropriate fixes tag for patches fixing previous bug in the driver
>   - make enhancements in zynqmp-ipi driver that handles corener cases
>   - fix memory-region carveout names
>   - fix multi-line comment format
>   - do not mixup mailbox information with memory-regions
>   - fix redundant dev_warn for split mode
>   - Setting up mailboxes should return an error code
>   - Move mailbox setup during driver probe
>   - Add .kick function only if mailbox setup is success
> 
> v2: https://lore.kernel.org/all/20230126213154.1707300-1-tanmay.shah@amd.com/
> 
> 
> Tanmay Shah (5):
>   mailbox: zynqmp: fix counts of child nodes
>   mailbox: zynqmp: fix IPI isr handling
>   mailbox: zynqmp: fix typo in IPI documentation
>   drivers: remoteproc: xilinx: fix carveout names
>   remoteproc: xilinx: add mailbox channels for rpmsg
> 
>  drivers/mailbox/zynqmp-ipi-mailbox.c       |  13 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c    | 308 ++++++++++++++++-----
>  include/linux/mailbox/zynqmp-ipi-message.h |   2 +-
>  3 files changed, 247 insertions(+), 76 deletions(-)
>

I have applied this set.

Thanks,
Mathieu

> 
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> -- 
> 2.25.1
> 
