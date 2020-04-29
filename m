Return-Path: <SRS0=aZ5K=6N=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10052C83000
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 23:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFEE6208E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 23:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eA7p5JCB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgD2X05 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 29 Apr 2020 19:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgD2X05 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Apr 2020 19:26:57 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF18EC03C1AE
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 16:26:56 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id e22so2596774vsa.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 16:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wzW2QoswANOc4BdubXXSnIPlG+98WpqoMVNvKMZnN90=;
        b=eA7p5JCBVyNn88KfixBzJiT1YbieVZWfEMsnVvZKOME6ZOaQyKuCYAlB9zqkCbaLX6
         Z8PSkYKabeGxUhxqpr4bIZyvkRrU40wg/ObnKdb+hwBj37ZYmQc9xjlvRK0BUOPT8m4c
         Waxov2b/Z7BTAuQ6+05KRfg+QVkMcrq4i2i3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wzW2QoswANOc4BdubXXSnIPlG+98WpqoMVNvKMZnN90=;
        b=QBguwvvNLPwMAnLYZPNHXAAClkzz4W/IY8/tqZQR49xPVO/OEgln/aqaIIXD7xwY+i
         A56we+rdjZ8VbMYTDS+Y//cBgERc9E5x6iSPgJUaFN+QiegBqsfcvVES7nPb4r4Q1BpD
         qO/HPnOTB+gZfSmBWIwgH+AHIBmNv25EEZaPbrz5ax7uHIbTNSIAX0Uc+tRf9oY1tIz9
         uGRvHV1FC8GVOgGPevqSQpJ3dJUAOL6s7UpLMooGmrL6eAiYER8gerOL5cWosBd4UpI4
         /cpNoSt5zXHYeirFVvnjmyTrAe6qQgN89IE1zlDbBN2lYi0kS6GKxUqnW8hVDWIrvaAu
         H1xA==
X-Gm-Message-State: AGi0PuZil9G+6HTPYXtN4/BHBjI4qDADCI1XJ34gwjv2Ca1jYMU6G4T0
        XKztEpbNt4Jnixf8T3EQ05/1yRh3DrM=
X-Google-Smtp-Source: APiQypKHqVgEZiUOITe/XftE75eoxXmskSGMdn7x7ve9t+NqBohqnXo+O4cEbAoXEiEmmYU/IREVZQ==
X-Received: by 2002:a05:6102:2156:: with SMTP id h22mr884516vsg.28.1588202815565;
        Wed, 29 Apr 2020 16:26:55 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id v16sm240170vsq.18.2020.04.29.16.26.54
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 16:26:54 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id h30so2598992vsr.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 16:26:54 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr796832vsq.109.1588202814031;
 Wed, 29 Apr 2020 16:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191004073736.8327-1-cleger@kalray.eu>
In-Reply-To: <20191004073736.8327-1-cleger@kalray.eu>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Apr 2020 16:26:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgUNySbRE9dZys28fFo3eZwf_2=cj68jaw1ftakJDzVQ@mail.gmail.com>
Message-ID: <CAD=FV=WgUNySbRE9dZys28fFo3eZwf_2=cj68jaw1ftakJDzVQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: Fix wrong rvring index computation
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Clement Leger <cleger@kalray.eu>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On Fri,  4 Oct 2019 Clement Leger <cleger@kalray.eu> wrote:
>
> Index of rvring is computed using pointer arithmetic. However, since
> rvring->rvdev->vring is the base of the vring array, computation
> of rvring idx should be reversed. It previously lead to writing at negative
> indices in the resource table.
>
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Randomly stumbled upon this in a list of patches.  This patch landed
in mainline as:

00a0eec59ddb remoteproc: Fix wrong rvring index computation

Should it be queued up for stable?  I'm guessing:

Fixes: c0d631570ad5 ("remoteproc: set vring addresses in resource table")

-Doug
