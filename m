Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28538ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 00:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiIHA7i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Sep 2022 20:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiIHA7g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Sep 2022 20:59:36 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C429DEB4
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Sep 2022 17:59:35 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1279948d93dso20561894fac.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Sep 2022 17:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=d3A1OukwsMAFzbEwZP3TwS33o0qkyMTMJ+eWvN4uXwQ=;
        b=amE84KauKVXxzRIvRbTcToFil89xKKxwszUyA6bmeBf81kI4Y+eBbpqxDUiBKBRHxF
         2ocVDN67s2OQ5zZOGYZiaTy4FQw8anSwub8qWUQOsXEgKwoCHbZm+7I2ljCAhFbNF3dX
         qFP3rkuAVs41CZby2zCWB62OIBL+I/oI5WN6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=d3A1OukwsMAFzbEwZP3TwS33o0qkyMTMJ+eWvN4uXwQ=;
        b=skCTBtsuJRsRWTJ+5AJwgECRIDvXeU0ClI7xdY4vuWcQiNuD6fy4eNCK4LX9+lVfVv
         245IqPGPT8BqdBQ2gqpOMuNEdd7+djVfZAA7l+ZSFoZlfBPbXHraMil2oTbzYoevLMr/
         KgNOx27Ze3FpfHDRwQ8ZEMfkV8YLnLahj8RGUBuMK7eHYLvHh+Xnap/mx+k8+7EBeOVe
         r359YYMs8cjv9b3YAYQ5Pu3cTuGViJlLHFQCCcvsl+qQidbdLXal0eC/RnY+f2AcnhPR
         mFeES9sU/XcdHLpV+3xtjvEsrYLypHEq8JcDO8BCbI7hMFyLrb2RJ9FWdz2lneQ7BOAq
         TtCA==
X-Gm-Message-State: ACgBeo0VJizUWXNwGnaro1ggNI+ZOlLH1iijPQTfDXJ3kB5rxKhsbuSV
        PTweY963sdtC+Ast5TiaF3jR2hIO9PPzDPgS5S0uyA==
X-Google-Smtp-Source: AA6agR4pEOJU19zl1bObI1ARLHq+ew6X96gBfm8AzLITs/DooPh0pwuj66jE8v7sVn1CL1UmSEj45kzqSH8bwWrw0IM=
X-Received: by 2002:a05:6871:6a1:b0:127:3a21:7e00 with SMTP id
 l33-20020a05687106a100b001273a217e00mr623862oao.44.1662598774625; Wed, 07 Sep
 2022 17:59:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:59:34 -0500
MIME-Version: 1.0
In-Reply-To: <1662404120-24338-2-git-send-email-quic_deesin@quicinc.com>
References: <1662404120-24338-1-git-send-email-quic_deesin@quicinc.com> <1662404120-24338-2-git-send-email-quic_deesin@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Sep 2022 19:59:34 -0500
Message-ID: <CAE-0n51KBkt2fB_BDfFz9ON++XSn_AY0Cn+jq8WFVj8_6-jXtA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] rpmsg: glink: Add lock to rpmsg_ctrldev_remove
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        quic_clew@quicinc.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2022-09-05 11:55:20)
> Hold ctrl device lock in rpmsg_ctrldev_remove to avoid any
> new create ept call to proceed, otherwise new ept creation
> and associted char device may suceed. Any further call from

s/associted/associated/
s/suceed/succeed/

> user space for rpmsg_eptdev_open will reference already freed

rpmsg_eptdev_open()

> rpdev and will result in crash. Below crash signature was
> observed -
>
> rpmsg_create_ept+0x40/0xa0
> rpmsg_eptdev_open+0x88/0x138
> chrdev_open+0xc4/0x1c8
> do_dentry_open+0x230/0x378
> vfs_open+0x3c/0x48
> path_openat+0x93c/0xa78
> do_filp_open+0x98/0x118
> do_sys_openat2+0x90/0x220
> do_sys_open+0x64/0x8c

Again, can you show a CPU diagram for what you're fixing? I think the
problem is device is going away, but chrdev_open() is being called and
that's accessing a device that's on the way out?
