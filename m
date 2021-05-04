Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A41DC433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 18:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F36D961164
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 18:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhEDSXk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 14:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbhEDSXk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 14:23:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0961C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 11:22:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 12so14615049lfq.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 May 2021 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=95tKEyQCRjctWNwfrxHZvLv9YtVr1nyw8aN8qwe62ek=;
        b=DfmgA0a2l67EFPmtb/aEWt6XaeBFKai/W5LbfSGCLk41/gVTTY8y1dx24hHl8MoY1c
         D7AF4rCyuVObdpCyKlGU1SIvQZgZMNnJr2054NtjuOwX9qTknRQISNVFAWl1xjEB+8sl
         d3ukkMTAydjJSDP9Y1te1EWdizvDDWyakizNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=95tKEyQCRjctWNwfrxHZvLv9YtVr1nyw8aN8qwe62ek=;
        b=iWRijmj6xzUmHjFlAJvoqmyygZjsWhz7NIeWcgujqQx+VZ0T969H6+grvaKPhGBvqr
         pDgxfoU+OincjTV13Cq/0jA8+4m2lYLHEad1q78lnanesjCb98R9bE2VyHZw+TLbl0wy
         dJONjxfZkqtHihb576twwU0rID+EzRvWSlsuvwUXll1jceNeXDSmFRrg/0zUkhWxhxI7
         fVzZSdh27oQ2Fpb506VeeaHRTICxSu3UQRgm1DSNcWTAqikv0Zx4k54UJkA41jIXdfR5
         tLqS70QUvmfKl1eJu8wTMxa5311EPvAPJLq2bVLjTIFzmS0rqOkQp7YFLGqY4jYGwTXN
         q5VQ==
X-Gm-Message-State: AOAM532yP9vrGXmJFG5iuN6m4NVb7xGFDPPBpcks+OAJc94PI1SNqjGd
        PYzyzwvN7K5lug87cvNH7DS6xhQNVsKaM0Lr
X-Google-Smtp-Source: ABdhPJxvtMy7D5pl9AxqXUDHvP53mgbAfByW8HsfrKKzpNc5wL1Sg16E2vIpzp9JlO5Tuaaf165gDg==
X-Received: by 2002:ac2:4f86:: with SMTP id z6mr18141467lfs.156.1620152563217;
        Tue, 04 May 2021 11:22:43 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id b11sm326520lfi.292.2021.05.04.11.22.42
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 11:22:42 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id w4so3687184ljw.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 May 2021 11:22:42 -0700 (PDT)
X-Received: by 2002:a2e:9251:: with SMTP id v17mr4541263ljg.507.1620152561717;
 Tue, 04 May 2021 11:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210504150351.1468612-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210504150351.1468612-1-bjorn.andersson@linaro.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 May 2021 11:22:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgea9bo-j4+LAvZF7OKPAXKqrGgiBAhXTJ3Jv5JAZgA+A@mail.gmail.com>
Message-ID: <CAHk-=wgea9bo-j4+LAvZF7OKPAXKqrGgiBAhXTJ3Jv5JAZgA+A@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v5.13
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Govind Singh <govinds@codeaurora.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Suman Anna <s-anna@ti.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jindong Yue <jindong.yue@nxp.com>,
        Junlin Yang <yangjunlin@yulong.com>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, May 4, 2021 at 8:03 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> This adds support to the remoteproc core for detaching Linux from a
> running remoteproc, e.g. to reboot Linux while leaving the remoteproc
> running, and it enable this support in the stm32 remoteproc driver.

Honestly, when explaining new functionality like this, it would be
lovely to also give an example of the _why_, not just the what.

Ie, some concrete example of "this is useful to have the remoteproc
continue scanning wireless networks" or whatever.

I'm sure there's some actual use-case for this all, but neither the
pull request nor the individual commits seem to actually explain that
"why", only the "what".

I've pulled this, but hope that these kinds of issues can be explained
better.. I think a lot of people care more about "why" than some
implementation detail "what" cases.

              Linus
