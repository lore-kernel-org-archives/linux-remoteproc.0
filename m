Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49575C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 11 May 2022 21:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347999AbiEKVJI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 11 May 2022 17:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346603AbiEKVJF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 May 2022 17:09:05 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405EF985A3
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 May 2022 14:09:04 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-ed9a75c453so4325142fac.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 May 2022 14:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lqtfubk7Hrb8lJoDJxWOzLc9PztEt6fZQ5kqLQlhvTc=;
        b=Fc3o3I0BqRikt2fk7xWUgF3TEVAR9OaGDwb4PmdfhORz4xdbDFQJsm3VuypKTYAkAj
         jHOZWlDdAkP7CR3rcvofleydnY5KLXwl0gXJrc9AKXmwhOuTkExrmw7DkKkcu68REeCH
         FHiD5Wleh8agi6wB/KtEChKlavAq9O3dkSI+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lqtfubk7Hrb8lJoDJxWOzLc9PztEt6fZQ5kqLQlhvTc=;
        b=NxUeVsec6eFVg+iPM36FiKjJGMuMzVubJu6WUOKaU791OM+lPEhSeXMGTijvatf2tl
         WDBMtwZAjXmaD3FFrqNPV1+rEhtZvjbzlwOYQX0QOdyjFIsOBL86lZZNpiUedN0l58Dg
         0wQFsa0Q/l2p5Z0Goyd+vJxL898+BWyeKQ5mPdmQDor9I9f61zjguxkbRTZqOcxtwNBO
         jzWHxG2wvlBXQj/em8TNrboN5DbnxsyNPkEnXJcU1MWbQ0CULGHI9+i/VFt2OXUuNJAm
         MoGP1eT9Gdc2CCfgnDM7OmTuNVV9KC9P41BnEMNRF07O+GYfZba2ud/hz3lS3M3R6Amr
         ScAw==
X-Gm-Message-State: AOAM531eusNs78alpiHW/a3CPU1W1OYWVi3w+lHB1VZjfGC0+mO59mAL
        jJAOo2UBuHAL6sDjZ2BWV0BT4GEMPerjtpsTbjXp1g==
X-Google-Smtp-Source: ABdhPJyzY8NSTk+TBHA5a8x5foiT//cEfAWwheh/EgZpFZ1OOo9rp37wqpfDkPaRzjkj0P2RYr8cHHSXjp64G0nucaE=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr3845551oao.63.1652303343312; Wed, 11
 May 2022 14:09:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 14:09:02 -0700
MIME-Version: 1.0
In-Reply-To: <1652257162-23874-2-git-send-email-quic_sibis@quicinc.com>
References: <1652257162-23874-1-git-send-email-quic_sibis@quicinc.com> <1652257162-23874-2-git-send-email-quic_sibis@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 14:09:02 -0700
Message-ID: <CAE-0n51gQ=-LH5rAzib8jQbGmNFwdhburbXQ+i+LE7gGWHE_-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2022-05-11 01:19:21)
> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
