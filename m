Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256AEC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Apr 2022 16:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346075AbiDZRAV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 26 Apr 2022 13:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344321AbiDZRAU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 26 Apr 2022 13:00:20 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791526D18B
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Apr 2022 09:57:12 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c12so30772092plr.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Apr 2022 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DTPMRMeWBAzanCmBx6cBcukiqX2leSLOdPLeBw+/mc4=;
        b=kOgwKw2JD0gfI0he7V3lrFfb/ewU0fph/RfUDZAE5UZgmOw59W9UZVTDHcF5OtPDnU
         3Ek/n41/pC7tY/P2oF0XPaNdkxfsDElNuiCvLaQRNzjDEVFhTWKTjGAFvj0NktS0cWYW
         8QbryrEBzZytP6eS/ePMzqSsm7l3TmwsbGlvHkavrnG8xyeUn2HNGKDkQlTIc8vberJD
         LNm5aWrZUL2Ji8sV8vswlGKowjXOoLGcL0OSsUguwBkO8xD0DTUA9htAL4nKaIPwOeHY
         UjV5GuaN+j1REKUhm0cEY0lYzyYkpNc0QNiYEQny5d6LJZwkWJXu6LH5AAjiuRWwwk3C
         Bsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DTPMRMeWBAzanCmBx6cBcukiqX2leSLOdPLeBw+/mc4=;
        b=b5JDp9pyZEAuosND6nEKJn+59wAAJmPtKfjUBm9gJ3FUpRM849OJbQoilYsBrmj/YA
         7mSZ4VnARaM0dBKxpLrb/LnqnP83sqWCbDyWFCwwT76fX6/9jIqx+iyLU0I4eIjjzyMU
         DtGIPdk42eTV6QPraEyHC4Cna6Mc0FpH2X6XXWW9+j5Ncobvwa11HPBXXhl5nfdfDC1+
         9aqilfU31JegdrfiF7oQon0x4Zr8zheCF4xGNhNZAHlbxfKnGv6h1WPsgp5PEu0Rh8vf
         w+2aIF4NYyhYCMbya0m/+Cf9dDR97S2vEKduXQC+ZY7KuiUTLuR4RTZJHLLy13Ei9Bye
         0vFA==
X-Gm-Message-State: AOAM531ate6Qro8HoKdbxHv6HQJtqHnebE47G5vToSia17peuASyesKn
        jt7TmaAZjdF5utg0Lpyg41aU7Q==
X-Google-Smtp-Source: ABdhPJwak3kS8aqfMggQA5aK6zxJOCtJWtrUoPhsxApZzL252nhjxcJxzOc/Ln00Y20h5uCULPrk4Q==
X-Received: by 2002:a17:90b:1b03:b0:1d2:a577:d52 with SMTP id nu3-20020a17090b1b0300b001d2a5770d52mr27494002pjb.58.1650992231904;
        Tue, 26 Apr 2022 09:57:11 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id i127-20020a62c185000000b0050d4869918csm6461120pfg.216.2022.04.26.09.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 09:57:10 -0700 (PDT)
Date:   Tue, 26 Apr 2022 10:57:08 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] remoteproc: mediatek: allow different SCP
 firmware names
Message-ID: <20220426165708.GB2007637@p14s>
References: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 19, 2022 at 08:33:29PM +0800, Allen-KH Cheng wrote:
> The SCP needs firmware which differs between platforms and SoCs. Add a new
> property "firmware-name" to allow the DT to specify the platform/board specific
> path to this firmware file.
> 
> The firmware-name property is optional and the code falls back to the
> old filename if the property isn't present.
> 
> Base on remoteproc/linux.git, rproc-next (58b7c856519f)
> 
> changes since v2:$
> - use rproc_of_parse_firmware instead of of_property_read_string
> changes since v1:
> - fix a misspelled word in commit title
> 
> Allen-KH Cheng (2):
>   dt-bindings: remoteproc: mediatek: add firmware-name property
>   remoteproc: mediatek: allow reading firmware-name from DT
> 
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 7 +++++++
>  drivers/remoteproc/mtk_scp.c                              | 6 +++++-

I have applied this set.

Thanks,
Mathieu

>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> -- 
> 2.18.0
> 
