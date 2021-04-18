Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3516C433ED
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AECAC6120C
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236815AbhDRCCi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 22:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhDRCCh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 22:02:37 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2ADC06175F
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso11425041pjg.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6JZfpGN3qGmrk5Z58+AgVl4ZGK5/VcZIG69yaXXxkhY=;
        b=Rjew1y3WcsRimPk4idI1odoWNwW0hh9VFnmi34eya1uwbq3ioVSVcTgfbauU0nqKRX
         JUqIuRzSqLxpEgstqbJ1CVLQgBLIZAOWH/mKTjVrODVQKMKOE57Jx/kP5sN0R7ptul/X
         dJDn0OzCrgmmKqpejCIZfNhOZL9/C478Enju4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6JZfpGN3qGmrk5Z58+AgVl4ZGK5/VcZIG69yaXXxkhY=;
        b=VF3zqVaa0qQ0dz4QS+cINqFWPpY0VDlpDJC1KYuy1yNgyK7y5KeknanCw/vXg1Dm0k
         Lc7igo5VI0kN+ySNP12QpQoE9HbNXCb7LBQMOzgLgz+8e7/u87s7LvZ+ORYV/vj6U7cX
         DyHfbqOpuuHz3XRsZ0ohYznexexwiLk9XnDxJP7SPVLi2PAMMmG6wLGAFRIm8o7zlsUr
         zuPPg/WoO0vZbht9Wquuuye7wAB7mEolqrKZVT7Jzzok82h+6UxUn+6AkLKBtd2VUtdT
         oX25xp9qNOd3nhAA+Dp+ghXtoC2pP0FRZK6YnOdqJa5duchW/2Tc6qQpA8638wD2jCzX
         GmvQ==
X-Gm-Message-State: AOAM531Z1E3/qzICluqFmZe+HA7qyP2CszJvzA04mFhf9Qlj72olDPX/
        QMpDqHQiYqmyE/PYUYc92BtpVA==
X-Google-Smtp-Source: ABdhPJxJzNEbY3jyPg8fEjGhjoecDC/1l6a2G599k+DxTSX+Z5Ru9ld2qBte3msY7sP8exeSMDmBwg==
X-Received: by 2002:a17:902:a5c1:b029:e7:3ee0:a1e9 with SMTP id t1-20020a170902a5c1b02900e73ee0a1e9mr16751801plq.82.1618711329769;
        Sat, 17 Apr 2021 19:02:09 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id n20sm3466371pjq.45.2021.04.17.19.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:02:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-7-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-7-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 06/12] arm64: dts: qcom: sc7180: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:02:08 -0700
Message-ID: <161871132805.46595.8756191151169964527@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:52)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SC7180 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
