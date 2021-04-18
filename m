Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D646C43460
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 369B96120C
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237172AbhDRCCs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 22:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236847AbhDRCCs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 22:02:48 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C955C06174A
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:21 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id u7so14105196plr.6
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=IKYgVJGdlnys8DHl050Hdn2rR9TNdmyUAeeIRt8xOq8=;
        b=VF9Z4jSEf+p1UYjim3ow8+Dcmv9lFG03tFUbryapVjJzsvMmV5CecfV0GDI2KXfunj
         jhMEG+qOVzj75h9hYPJ2aulXfLBXfG3watRAzQ7mNtvWbO6XLqH6et+eX/2t2AFy+MZ8
         BYh0O8Y5vgdC9oqv762RLzLjzrI7iwhcG06cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=IKYgVJGdlnys8DHl050Hdn2rR9TNdmyUAeeIRt8xOq8=;
        b=DJ07XUO88gr7YSbGSnuuZ0xefarMiAPYOfUFKaKFBAYTUW8Zx3WdBwjC9FjjXRzCqt
         jHEcnKzlrwKBa/vTbWG8Pv9XhuZZPZC2ai9PTWir8HOgvghOvwBz/nh4nledv2QqkCeY
         CJmPmHa6vbscLSbgeNT2hLBVb/lTsSwNQxmLtM+K1U/6EShspllFHDEjNlssD++ZJF69
         hXpQRkfjFhD699JzHQ0VLH2R3aTrguvSGpF4MG9Fq0ZOfoMxSpMTpBT7NAmnCkeWxZGp
         Ho5k9r+Qwtl3Z/TkVrXcRVPsEAersN9pFfDoXwzXN0D4Z4vtN0B/xn78IxScr7Cpcd9D
         WFTg==
X-Gm-Message-State: AOAM533M6E3yZsuw3lhN+yhmSRRZs0gHy4GpshTV/XQgfOt5OR8EnzuL
        u5Sl9IF8MjL+0Ng3thNBQsIS7g==
X-Google-Smtp-Source: ABdhPJz6CvpZyiD0cG5835NFc7okMDvkcBy2tU66Rq0gbRSYjPjEBctZOKgh8mRtkOWICw1Hof3aZg==
X-Received: by 2002:a17:90a:d191:: with SMTP id fu17mr17106897pjb.137.1618711340749;
        Sat, 17 Apr 2021 19:02:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id i11sm9110213pfa.108.2021.04.17.19.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:02:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-8-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-8-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 07/12] arm64: dts: qcom: sc7280: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:02:18 -0700
Message-ID: <161871133896.46595.3264774242647444219@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:53)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SC7280 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
