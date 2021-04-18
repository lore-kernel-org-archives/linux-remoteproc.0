Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3128C433ED
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 872FD61350
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237212AbhDRCDZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 22:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237205AbhDRCDY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 22:03:24 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2316AC06175F
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:56 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id m11so20880081pfc.11
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CbhdQHbWRym0+Jb4C6kLr5Ql2zPCvZUevjtnp0UACY0=;
        b=K8tyZdc0a05Lfkk4bMA1pVWGGcY8hrPmjgFi8BriITExVKwDv9S+Q4KAKVKtnvzrw3
         ku1Uwwz2RnhCRR5L0yxU1ZFVpon7X4ucFhHBuitM0kxQnpZxo8daw0abixBZljfmf4f/
         dxT0Fmeo3zv1oQniqLAyOCyR7bxd9/DgnvLu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CbhdQHbWRym0+Jb4C6kLr5Ql2zPCvZUevjtnp0UACY0=;
        b=LdhO9vuqXDSFSVir8S8qW5q7K5AmQo8MI+M638zibIjrgHmIhtkAaXmtquQ6p6G6ii
         tBglTnOB4uU2a8LGKvzXVkzUs9gg/a82tIPKlXFQjxEMJvM92Rhk2FXG958K9IiqjNqc
         AQlFGUI+mmcduTRTjXlwBooKKoxcK6k+BzlkQa58wNv/c5S/ZsucizSnMc8+RXSjwgdK
         yKIiGseh9qUTVX3TaWujxPerkvfshOFzynuulP3PSXd1ch6ld/j/6xhMd5moapA2fVdr
         OyJC81NO1qdKSi+rVTAqrMk08mdvfbULTOvvslEyYYZ4xPiUqRGIyLa5RebpjNGbawcO
         jeVg==
X-Gm-Message-State: AOAM532ro+oMfMfX2Tr3ZUeYRT7OUsv9AXCPBMeUP2rnj3V+wWRvEVPR
        QkV446CEBydmYvIxxnNS91V6FQ==
X-Google-Smtp-Source: ABdhPJz1rOGvxjAHNs27KEyLsrpD/xu/asHSTcZrwNm6yPIK3+68UOFDLh0+fCwrE0Q5gCQ++eVgKQ==
X-Received: by 2002:a63:130b:: with SMTP id i11mr5617657pgl.302.1618711375680;
        Sat, 17 Apr 2021 19:02:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id d17sm9195487pfo.117.2021.04.17.19.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:02:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-10-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-10-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 09/12] arm64: dts: qcom: sm8150: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:02:53 -0700
Message-ID: <161871137386.46595.1715637994185225115@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:55)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SM8150 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
