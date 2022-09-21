Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B51C6FA82
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Sep 2022 17:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbiIURrv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Sep 2022 13:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbiIURru (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 13:47:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2445A1D56
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 10:47:47 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b35so9925383edf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=IhzlEO0THrG1SE6HbOTHTvIlgWVkA8nZcQ4nhBMF9VM=;
        b=kUH0uLbdOTStyhAwWY6i2T2x3BCi2/R5wadBGaYOlUa1W5FuP8fKQEL9g8WxIGpr0m
         pVxl0fSM2Iw67xD1q/pUY50anNiwIdjLvrQi3o44tPJy8jsEeCvOD6xHICxIyj6mTuAU
         egDMlC+4lszSlKM4NYmAsEp7VVkwKL+c/nTwgyIJJJN9zmbLi6d8OMAW+/30DL3kziyy
         jIrsRfxcoYNWpoEn2Hv6XbUEiyKqquK70kJtua+a/NSm5r6iWAPRzZ1McjR4/g95FgMs
         IpYrHeSYbHmKPscpaLOKEAu9CcfvcrGKlch9HmaW+ZKmB1Hj7E22PU16WlUAVdH3Gapd
         GZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=IhzlEO0THrG1SE6HbOTHTvIlgWVkA8nZcQ4nhBMF9VM=;
        b=aaayiuslet1OgT1cmqkUZdum0oPEEZ+/ubUwrVjjMO6ADv53NNn5zhXxKLXjKf7InA
         SLby8MOr3x9fIYsvplpNBPqZwEVcN0EAmwzjbL/bMZhYCnN7+kV7EGUWDUnZFgJrTy8R
         /TZg9uKWVob/QOQ/9zIhWbDGrgbsGk4kcJlY9cC5T1PbTvyoKU53WH7rKp8MmBV6v0mp
         3rov+7tAyr4e2Jzs+5bBcAJ2OTRThggVe/oMg5wNQdfRLzaLBD1YBh5oZfgJHYPEQs7x
         MfOz8tD93GDdOU/JkFD1oCKzx09Jihtf0izXhS+8lv1oQOCVz4hJF3k61NjiNf6+Biey
         hhRQ==
X-Gm-Message-State: ACrzQf3un4LXgw57tL/Sv5ZEIHyeOLE2iY10dc+hIqULEdcBdtTqcyaN
        fkdA9A0oNIkBVWMEyD0nw6WzwlZ+n0d+mPQiPTOX3+Mkqsw15g==
X-Google-Smtp-Source: AMsMyM4GyfGfKZsHWzRujzVPr+kl3YPOyqjZ0borgYX8bBzWH4G0L6CWkVzyGhJ6q59WEjvxfLwywpqMVaiTmG561i8=
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id
 k19-20020a056402049300b00445b5f07a0fmr26079089edv.120.1663782465624; Wed, 21
 Sep 2022 10:47:45 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 21 Sep 2022 11:47:34 -0600
Message-ID: <CANLsYkzPfdHRHLSMzz=+b8Vdafr7oYdPqJozSNC2YfdyU1=V8g@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for September 21st 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc:     Peng Fan <peng.fan@nxp.com>,
        Kestrel seventyfour <kestrelseventyfour@gmail.com>,
        Maria Yu <quic_aiquny@quicinc.com>,
        Deepak Kumar Singh <quic_deesin@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH V7 0/2] remoteproc: support self recovery
[PATCH v4] remoteproc: core: do pm relax when in RPROC_OFFLINE
[PATCH V5 0/6] remoteproc: imx_rproc: support i.MX8QM/QXP
[PATCH 0/2] remoteproc: imx: add start up delay
[PATCH v5 0/3] Add support for WASP SoC on AVM router boards
[PATCH V3 0/3] rpmsg signaling/flowcontrol patches (on hold)
