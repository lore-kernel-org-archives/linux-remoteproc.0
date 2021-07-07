Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E48C07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 17:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E76CE61CC8
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 17:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhGGR6X (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 13:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbhGGR6X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 13:58:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB123C06175F
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jul 2021 10:55:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f13so6097198lfh.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=myWem3gj5bW37MhHpnhzxGgmeTIT4Kkz6D1nIRabDn0=;
        b=DXGPF2TFMsvSQq0ntWuzUOHIBPJp3QRnEtFsVeaIclMv3ZA9GvuApeEj+dgcic88K5
         eWEvHC/h9/HamFDX4w3DdQUWP1agT7itBBVXbIWwVxwhOUx6q7LQGPviiBigvG4HoXPQ
         kOMSLfcfS3PvB44BReVGVxSIITsfad+UnKbmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=myWem3gj5bW37MhHpnhzxGgmeTIT4Kkz6D1nIRabDn0=;
        b=PMfb6kr/GSn6B+UCwu/ScRoY4rlQWMAAe18IgLeijVoWrTznXtlYDYxMB456+0PW8s
         siHd+EXubFUzH8+z3dgQg/jaZZ/k6UPJj/726xYL1efggrTJ7EKfE8jQnnukhcADx2qu
         +4wmLpLmWu8oVig7mzMsViojeOQp6A/eM2mGEsAlPb6MO3foX9diZ4L/pzbtLiXP/h28
         YaBn7Etqb32iQLU+sBNnUrRgYaMLb5gG2gm7ez/vuRzsbQRwpH8dkKddIAUQJ7Eo/bSv
         RVmQCgb4Juo2uxIVpLUc1O/Qxi26raueUnH8anxg+WuvdHNCtgoG9PxKz+rVGkDd4trw
         KaFw==
X-Gm-Message-State: AOAM530/J79HLA1U/5rkvQVrBKgbnWjsQEtqow4DcaRIu9gZtXIn9/j7
        9ZoIoawXatiUyMgfCs9PlMj607GVq6kc4xoa
X-Google-Smtp-Source: ABdhPJxk2Sr5w7zDso7bjgAKJ+APzBSrU2A8l6LR9CXkHUNcvOcv+f1pC9g0ZkomffzxpkgZ3ZPqRw==
X-Received: by 2002:a2e:9d55:: with SMTP id y21mr19973368ljj.79.1625680540186;
        Wed, 07 Jul 2021 10:55:40 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id t30sm1756527lfg.289.2021.07.07.10.55.38
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 10:55:39 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id c28so6065733lfp.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 10:55:38 -0700 (PDT)
X-Received: by 2002:ac2:4903:: with SMTP id n3mr19512860lfi.487.1625680538298;
 Wed, 07 Jul 2021 10:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210706210228.1229484-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210706210228.1229484-1-bjorn.andersson@linaro.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 10:55:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiXHZ=v4_HVL5TyP9DaHDd7Xxb8hiXjTQi1eDXOA_XRMw@mail.gmail.com>
Message-ID: <CAHk-=wiXHZ=v4_HVL5TyP9DaHDd7Xxb8hiXjTQi1eDXOA_XRMw@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v5.14
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Suman Anna <s-anna@ti.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 6, 2021 at 2:02 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Suman Anna (6):
>       remoteproc: Add kernel-doc comment for is_iomem
>       remoteproc: Fix various kernel-doc warnings
>       remoteproc: k3-r5: Extend support to R5F clusters on AM64x SoCs
>       dt-bindings: remoteproc: qcom: pas: Fix indentation warnings
>       dt-bindings: remoteproc: pru: Update bindings for K3 AM64x SoCs
>       remoteproc: pru: Add support for various PRU cores on K3 AM64x SoCs

Hmm. I see an additional commit

      dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs

and the diffstat I see differs by that extra DT binding too.

If you end up adding commits to the end and updating the tag, please
just let me know, so that I don't go "Hmm, this doesn't match the pull
request" and have to go dig around what the difference is.

              Linus
