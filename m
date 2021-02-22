Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C9BC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Feb 2021 22:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6B4464E20
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Feb 2021 22:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbhBVWrT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Feb 2021 17:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbhBVWrG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Feb 2021 17:47:06 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D736C06174A
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Feb 2021 14:46:26 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id i3so4910119uai.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Feb 2021 14:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y2HpjzAoLzLCmlgkDfl/tSuUlKCcUXEeVTAgdZrf5xA=;
        b=K6loj0eyjFQktbWgQSlaqcz0cJ9HJQxnJHRO8jplLVCX/ibIdtI1yYvK8qZCHrMrRX
         kRlgFRetRZq4pEyJDY2VsRofVyaoXoJz7A19lTEuN5Yq0/0KFbUdCyVbgAp+Z5mYSbGK
         +ficRGKmQKGqj/vV+pFO1qOzMLwTbHTjFV3h4NwETuXjJwg1jZTQWuGHZbTJrel8XJVG
         v7naLAOmbfnyysXbaIjA+FmFYj78IEWyoRE1zWWLmtQQ3ouHyz/pAf23+DEXSPR1vcS5
         Wp2ATsPT9VLnn6FP3SgHwFF/+kCcU76VXAqal04fAzLnz5rXZr2e0oJYAyN7xs4tSbL+
         ujuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y2HpjzAoLzLCmlgkDfl/tSuUlKCcUXEeVTAgdZrf5xA=;
        b=OctXRAi9ArJFjwVtwxpIQ91i8/SE585cKvRnfRV6pazc18CfUiNIWPVILdFuiuvOQi
         xeThtnB+g8Wy/By/yIePMzrwurJaGV90fRn9NeYgELPYFzKLZChzrS2JWZi00PqyIy1i
         2DU9ExUqnFfAvh19SJt+/sDyX5ntFVhe3dpRn1WFj2/uZVICKrAnveFBnT5fv96//4s/
         tMsfeJR9Us55V5kWk4cb8u/hiMxbBzl3MkO0s9RDlr2e/f9xQWOXm/xCI3xPgPTEJH4J
         TIY87GeAYSmVMMVc2OEg4olCtVjQ+unD3kaAqXI5kTqD1m3J/KNpLb/cEli+fbF1S5yU
         dBvg==
X-Gm-Message-State: AOAM531bHw+TYAlqhUWFccv8viiFxJWVpQkzoWyzduIXbNRuwoZSmNVT
        ZOxd3snv6WX9MA44D1C9nyg8F8ztcNpTpE12gplCjg==
X-Google-Smtp-Source: ABdhPJwSkGW+oV9LW436LGwuZxz9jgcyYsjgp3ZlJ4etIku1PAyDjKKkaa7dO7iRZYFD+Y4XSA+IPCQcUBPBsvC1yio=
X-Received: by 2002:ab0:6ecf:: with SMTP id c15mr16126581uav.52.1614033985087;
 Mon, 22 Feb 2021 14:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20210222072217.15633-1-jindong.yue@nxp.com>
In-Reply-To: <20210222072217.15633-1-jindong.yue@nxp.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 22 Feb 2021 14:46:14 -0800
Message-ID: <CABCJKudwajnmHAEC1XAH=pouCoOXq7q6NmpLST5pba8ejU6FtA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Remove casting to rproc_handle_resource_t
To:     Jindong Yue <jindong.yue@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On Sun, Feb 21, 2021 at 11:18 PM Jindong Yue <jindong.yue@nxp.com> wrote:
>
> There are four different callback functions that are used for the
> rproc_handle_resource_t callback that all have different second
> parameter types.
>
> rproc_handle_vdev -> struct fw_rsc_vdev
> rproc_handle_trace -> struct fw_rsc_trace
> rproc_handle_devmem -> struct fw_rsc_devmem
> rproc_handle_carveout -> struct fw_rsc_carveout
>
> These callbacks are cast to rproc_handle_resource_t so that there is no
> error about incompatible pointer types. Unfortunately, this is a control
> flow integrity violation, which verifies that the callback function's
> types match the prototypes exactly before jumping.

Thank you for sending the patch! It might be worth noting that Clang's
Control-Flow Integrity checking is currently used only in Android
kernels, so while the type mismatches are real and should be fixed,
they don't result in runtime errors without this feature.

> To fix this, change the second parameter of all functions to void * and
> use a local variable with the correct type so that everything works
> properly. With this, we can remove casting to rproc_handle_resource_t
> for these functions.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

This looks correct to me. Please feel free to add:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
