Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFF3C38145
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 00:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiIHAxC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Sep 2022 20:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiIHAxB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Sep 2022 20:53:01 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C143AA8CCB
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Sep 2022 17:53:00 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id d63-20020a4a5242000000b0044880019622so2724729oob.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Sep 2022 17:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=H72+9BX1R/U8sxER2gvuLw7JGA1tmcpEapnmbRh2XHM=;
        b=Zr5p7FEcvb9oVD1st7VVTxLk/zQNLuiBDm9ySpOE248hDMAlhiT3ZGYS0k06vXq06r
         tFux+9kgQkXoimCwmcsGfx4jYMdXFmA6MD9uoUBLETjeyXmep9X5Nu2dTeA2ZgMl5qHv
         dZv9NYRoqxUpzxgCcB/W1r4kOFbqSoa3I8UKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H72+9BX1R/U8sxER2gvuLw7JGA1tmcpEapnmbRh2XHM=;
        b=JUjoQWMdFzGfJ+U5ZwxaxSmHHLU8Zyajr31GYe2ZscBE+/BDHeBP6g4RkoMqSm1AlM
         +Di4l3IS6oXo41hbNhmpI+N+cd8SIBBdoMeERpsySNMukrmEV/xXhwQPFdvrVOlS95fn
         R2PdWgPZML+nXeEOZeAP6HF2YKkv0Sp3c1NfrPYMN11299uO1sb8boJ545/hHe884peN
         2HmfYPF+N5eBrZhKglUXqSr00FIgxwoOcfMr0OcT8BYf5aVBC7gD54jgaKl0/dNC/OV8
         PHqLE6ggZEHS+TOjuEYTwBNugYiV1fwlh6+GhzyaveIAX5O3us1B3pzZwLYAR4rl0ZZr
         GUpw==
X-Gm-Message-State: ACgBeo35zE5pBfKg0ck6wkyljpm4rfQsC/vhPWAcUjuJCq9BPcB23QS1
        zgKSxI5xCbQ2oPGfF83hirNpnRkP3D+O2eIzIVuwcQ==
X-Google-Smtp-Source: AA6agR7Zddtx+SnJNnkmPop8hRN8BknyDpzLZsH+UmDRaKv+T3ntTIrW0x9M33bDDdyvBlt6SfFYf8uyakwuUKkj8tI=
X-Received: by 2002:a4a:80cd:0:b0:44a:dce5:bbc3 with SMTP id
 a13-20020a4a80cd000000b0044adce5bbc3mr2184662oog.26.1662598380105; Wed, 07
 Sep 2022 17:53:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:52:59 -0500
MIME-Version: 1.0
In-Reply-To: <1662404120-24338-1-git-send-email-quic_deesin@quicinc.com>
References: <1662404120-24338-1-git-send-email-quic_deesin@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Sep 2022 19:52:59 -0500
Message-ID: <CAE-0n51oCcb8_1No22gNy2QS=ZL=DxQLZWT9NNGNZGev+4cy8g@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] rpmsg: glink: Add lock to avoid race when rpmsg
 device is released
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        quic_clew@quicinc.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2022-09-05 11:55:19)
> When remote host goes down glink char device channel is freed,
> At the same time user space apps can still try to open/poll rpmsg
> char device which will result in calling rpmsg_create_ept. This may
> cause reference to already freed context of glink chardev channel and
> result in below crash signatures -
>
> 1)
> rpmsg_create_ept+0x40/0xa0
> rpmsg_eptdev_open+0x88/0x138
> chrdev_open+0xc4/0x1c8
> do_dentry_open+0x230/0x378
>
> 2)
> rpmsg_poll+0x5c/0x80
> rpmsg_eptdev_poll+0x84/0xa4
> do_sys_poll+0x22c/0x5c8
>
> This patch adds proper lock and check condition to avoid such crash.

Usually it's nice to have a two CPU diagram that shows the problem
scenario with time flowing down and interleaving the calls with
indentation, instead of some callstacks. Can you add that detail here? I
guess it would look like this:

  CPU0                      CPU1
  ----                      ----
  do_sys_poll()             chrdev_open()
   rpmsg_eptdev_poll()       rpmsg_eptdev_open()
                              rpmsg_create_ept()
    rpmsg_poll()
     <access old rpdev pointer?>

but I don't immediately understand the problem. Probably showing the
free path and wherever eptdev is set to NULL will help inform better
than a parallel poll and chrdev open.

>
> Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
> ---

Any Fixes tag?
