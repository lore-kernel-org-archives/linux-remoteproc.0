Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF9DC433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 Oct 2022 19:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiJFTer (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 Oct 2022 15:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiJFTen (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 Oct 2022 15:34:43 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355BF13D0A
        for <linux-remoteproc@vger.kernel.org>; Thu,  6 Oct 2022 12:34:42 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id 13so6860901ejn.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Oct 2022 12:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45NJ1VQxfT4M8MbuTZ9qyXjLzW6kgKLyOJ6cBfR9SR8=;
        b=VxuAVHtQ2s6acKn/Y7lWAi8VmFhj8bEw1N2fwT0P/2JRAusSqx7m5vO5QytmD5/smi
         hFZY+GmpWbcgflWzq+2VLByAjMBMbiKJpvyzPMoRN8LrWgsY6+3A17pfLzI32f5tX1y4
         wYSdjoeTTx3sXfVQJaDtIa8woAEXXeE07UN0rxJKYSS772o3BdGhOYWb3QYCyVlJlPCS
         xQts2DEr3AIOlMYWq4xU1GNmYudPesGfiE2NCU68NyMhT9muhlYFSC80SkR2IR9/GYS8
         nBfBwsnV2qXoSiEAeKPF6Ebv7z3JQ7K47hwEzvVhu15nCfIf37U/NHZYr0HCGhsPekaJ
         fUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45NJ1VQxfT4M8MbuTZ9qyXjLzW6kgKLyOJ6cBfR9SR8=;
        b=mXI7uLTvvtXHDhWgCpIAZFGZE3JmFvuE3MI4GfEllKiok4+qrIm36VTR7fPZDwAZpk
         yzOTNRwwVAtiDRil50MlVdOVkRcU8FDf4VUqYuYD+eyYqX/enT6nee7vSQBI4ZgpIrWV
         zo5yfQKklpOLNLspuLkUoLRsIwk/wRrpY9CSYzMRRtFP23Y9u2GVMwnhjCIWssl5b1vK
         7GhV3LH8e4Q4EFlBlMPcRnswSwnkPcM0s/NY/6paKqngLpliJOhdi+nuw1FIiH8dnaCJ
         L04wUk0es4ZGtslaS7npJ6/woKzNgyqBp5SIeyY7HhAtCLyWEVLvKVpCnXMxloTXBgtt
         8CKA==
X-Gm-Message-State: ACrzQf3kURKqQNR3nklZULVg4yu6+wvaBXc4XFiLJ9acL+AfXoCyibEn
        4xar9IPDRTflZE7Oit7SSK3f1X3aj/S7ceSXaESLOYmtk2g=
X-Google-Smtp-Source: AMsMyM4xnrEcSqjaXmLiyjoTfhKDmZkgwj+ePEnZgLuxfRT+JtVVgkBxOAy9d147XSPvWXyYGdc5zJ1GuuvIYGuo8lw=
X-Received: by 2002:a17:907:2672:b0:780:8bb5:25a3 with SMTP id
 ci18-20020a170907267200b007808bb525a3mr1188472ejc.281.1665084880146; Thu, 06
 Oct 2022 12:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANLsYkxshqWUagQkXPKbiP2u=o0nJ2X-_pKp1KWFW1DQ0=AbYQ@mail.gmail.com>
In-Reply-To: <CANLsYkxshqWUagQkXPKbiP2u=o0nJ2X-_pKp1KWFW1DQ0=AbYQ@mail.gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 6 Oct 2022 13:34:28 -0600
Message-ID: <CANLsYkw_We0rZ1sHk-AV_Oyp0yzTmdYsHZNmxRj4b-A6NYDONw@mail.gmail.com>
Subject: Re: [INFO] Remoteproc/RPMSG patchset review order for October 5th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The formatting came out wrong on this one...

On Wed, 5 Oct 2022 at 17:30, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> [PATCH v2] remoteproc: imx_dsp_rproc: Add mutex protection for
> workqueue (will queue when 6.1-rc2 gets released)

The above two lines should have been a single line, meaning that I
have reviewed this patch and will queue it when 6.1-rc2 comes out in a
couple of weeks.

> [PATCH v4] remoteproc: core: do pm relax when in RPROC_OFFLINE
> [PATCH V6 0/7] remoteproc: imx_rproc: support i.MX8QM/QXP
> [PATCH v5 0/3] Add support for WASP SoC on AVM router boards
> [PATCH v3 00/11] Add support for MT8195 SCP 2nd core
> [PATCH V3 0/3] rpmsg signaling/flowcontrol patches

These are still on my list of patches to review.
