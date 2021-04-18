Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B95C43461
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4890B613C8
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236815AbhDRCC7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 22:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237171AbhDRCC7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 22:02:59 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22538C061760
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:32 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id o123so20882608pfb.4
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6EOi5sET7q+6tX+yWu9fy29pnrjG4MRp6umPPzPq8io=;
        b=kQdHmo7fIHeibHQS2AiHL5WIEamrqHqoa5ga9rM6sBSydleBeM1dLI9GzuIbNwwk7e
         N1a9fJzZeV7DcggjCVDDgQlGVDWhApORdsaooAYTLf1SKT4IJo3pwIMJDhFIcBSNck11
         TPhC1CTjYTPWF5/yyniLiCg9i1b0a5kBZ20oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6EOi5sET7q+6tX+yWu9fy29pnrjG4MRp6umPPzPq8io=;
        b=bK4VEFp6+naM/VvU4xK3FDJB+xE3U1R+M2sd1pxgB9GUkhaa/PH7z1kpS+WmLhT7su
         KXuhtNRwzH3hW0IZAsADlRl/cTLp2/Tci3Vs8r4sIvIfaJIRhkdemsXRz5v7khbQB/6+
         272lVdL81qlQmDnX+klX7aOxOcufpI2QC2A8KhEsr5+zWkjdwFhQUBuDwKAzY0SapnoG
         XbAOPRPXfcPZGvTn+WCOdiUNUwQfDAzSr9zAEhbs6xem6NPwS59AOWsNX0MceOPMvNRR
         PPYxspIwZreFEVtg+SSf06OoCTPUzvimTQpGiwA6+pvGhgaSs1GNidD6ELDKwejnLqXY
         9lkA==
X-Gm-Message-State: AOAM531rTnZacktt3o8S0sTiny+u+CG3UMmwmf3meUoEB4yRFsMLNL49
        j7k2hpEPfcxFqHOG3QLsvC1c3Q==
X-Google-Smtp-Source: ABdhPJyWyBxeFPd6VFmIMy39I/7tDy2USGMAbTQjQx4SczppNkalB7KraRsr2ZRfH7mjwvEDDynFsw==
X-Received: by 2002:a63:f451:: with SMTP id p17mr5559622pgk.150.1618711351734;
        Sat, 17 Apr 2021 19:02:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id fw24sm10077679pjb.21.2021.04.17.19.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:02:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-9-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-9-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 08/12] arm64: dts: qcom: sdm845: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:02:29 -0700
Message-ID: <161871134996.46595.11931692864291913969@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:54)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SDM845 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
