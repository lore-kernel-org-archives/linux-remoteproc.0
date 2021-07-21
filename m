Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7228C12002
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A8E56120E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbhGUE7e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 00:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbhGUE7U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 00:59:20 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A72C061767
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:39:57 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id u11so1760842oiv.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IFdcWR4YA7cLDxn63MzGINn1m+UKeseJHsxYZlWX3KQ=;
        b=aWfsjVPocuLolSMgFBwj57AvMqaxCQsuPSJxXaNVO1E0rVIenk3kEY0Y++tuH1YZ68
         I8DmVy1vY01jGm7UnevYHk3njt8s43rjS0eLc6XTCQ+ik/cuVyMUIzog7UNsGASO8jS/
         LmgjbnIBIg8y4z/rqTcAGVsZjgCZkP2ibz6Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IFdcWR4YA7cLDxn63MzGINn1m+UKeseJHsxYZlWX3KQ=;
        b=FM0um5fEYrUmQDvSqNlg2XOFI+EDWg21HCB1iY7tw+WMiRnezCmqeXV11fF9vopLUO
         JrvmDz/ewDgC0fqx/NdOib/GF6OrzpQF7x6xDvgJc2BtpOZwfGFgA5qd5/N53rswYBAY
         b9CpuCrVrmlR91pjF2f032B7nYWkp4SyvfffzWnVSEgOHIhkCPJGOem/P8ASSo2y/P63
         J/qlzM1Ed7zJqC6HO7ftqvi3CuH4CUk2qEh191E0g2J7ITY/HNpuS5rEO8UQslIJIAJV
         niiKpwaccqqYCmi91UyX8YsmJ5rIytsPwzD9jmk33+IXUlDWiPEm1rPP89Tv1J6FXbdr
         6mPw==
X-Gm-Message-State: AOAM533/Nn9PkWBE3ec7kj5PXCyTCh3EReivcp8GAjfEUwCNovgrNTi3
        DeiBDdDJAG6Tif/b6XC6rOBcM8n/1roWBMzhaT5D4w==
X-Google-Smtp-Source: ABdhPJwmGOK4KV4ieXmIBCwoxkcL3jMjj6zpveLGftzQ0Nvrj9oanbFoD7AI3J8dOymIsg/TTy4PRIkqTm7VpG6AmGY=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1520062oib.166.1626845996963;
 Tue, 20 Jul 2021 22:39:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:39:56 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-5-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-5-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:39:56 +0000
Message-ID: <CAE-0n52MHTrMnGFxNJYcBQ=k0qB676wok_gq6=0yL786p27DhQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:12:54)
> The SID configuration requirement for Modem on SC7280 is similar to the
> ones found on SC7180/SDM845 SoCs. So, add the SC7280 modem compatible to
> the list to defer the programming of the modem SIDs to the kernel.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
