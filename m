Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84376C4708C
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Dec 2022 09:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiLAJ6S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Dec 2022 04:58:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiLAJ5v (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:57:51 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B158B9951F
        for <linux-remoteproc@vger.kernel.org>; Thu,  1 Dec 2022 01:57:22 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id i81-20020a1c3b54000000b003d070274a61so3034174wma.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Dec 2022 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1kx0jr6iQJBdI7n19m8fhu/gw5LbN1tE/Li1THtvucI=;
        b=KEKMHsEb3yFB2gFZmV6K9MRknX/7TQp8PLqjSDztCIcOZmjK44ShfAtpydvOKHciza
         LOOZWO4k7ZESZSSOOmpyFlTekAHYODH8gkS4EB8j4Ddz3JrwUFW9Tb1KLmJNXV/j3rVL
         Sd1EC3kZG/mRFsIF7il3jAJ93BvMwipxG2nbW3xW9TU614kqsmkXhVswBHMLhl4cAq2T
         CQtcdrDx8btPeUyvtUckJvE0xhkjpZaAH96+TluFpet/yEqQbVhad39RkBOJkfX4Uv2C
         MbzoUBhTMvq97GMPYwOpRAdw8knSUbLbZv6vnvtWkYEOuYGJupSVgpSI4Vi2FkLRIIMw
         czdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kx0jr6iQJBdI7n19m8fhu/gw5LbN1tE/Li1THtvucI=;
        b=zVJSEdpjbMM9whIvWxJNrK/5zvHRafY0Jp/ncnA0BpFftiqN2ej6j8Fdaldcu2gTkh
         nI8MzOy5VwHc+onplPiKHoL7lkjS/MVnjIGuQ2VtJrGaingKvBvNUcaPUFg4SBCa3I3P
         /S8K6t3KWWyXKnSyrlCEeyx9LmyBWAfHUqu+Rbc7sbfxhCOXUBGxoAKZ6IRto/cOvwSi
         hxAmlKUgcv7nb5KE0BFPhH7lkllaagEkPAd32fAb6g3kfHdJgkC8rGnPSDVNVe7a+yrv
         /fU07tb+E90QCZfKEyQapOTIXmpzFPtnvJk6QQqlXmtKswZiW4QMtbxUValCu10iAQ1+
         Zvyw==
X-Gm-Message-State: ANoB5pkXFoZmTlhIIf9Usz+YIgHZ0OT473uNWTeTaadEjHaoz30WCGNt
        UiS8a+DzP5ozsxcoiqFt3paHbx34Tr5MB7LafJMuyg==
X-Google-Smtp-Source: AA0mqf4RQuT3o5dVODYuifcFa7oAG27rTPoh0EMVG7YVp4qUfFAgO9EocfzkH2534iz0neovTigMa97nRDMKlUjfjG4=
X-Received: by 2002:a05:600c:4f05:b0:3d0:3d33:a629 with SMTP id
 l5-20020a05600c4f0500b003d03d33a629mr24471844wmq.126.1669888641094; Thu, 01
 Dec 2022 01:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20221124074725.74325-1-haozhe.chang@mediatek.com>
In-Reply-To: <20221124074725.74325-1-haozhe.chang@mediatek.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 1 Dec 2022 10:56:45 +0100
Message-ID: <CAMZdPi9JOQpmhQepBMeG5jzncP8t5mp68O2nfSOFUUZ9e_fDsQ@mail.gmail.com>
Subject: Re: [PATCH v5] wwan: core: Support slicing in port TX flow of WWAN subsystem
To:     haozhe.chang@mediatek.com
Cc:     M Chetan Kumar <m.chetan.kumar@intel.com>,
        Intel Corporation <linuxwwan@intel.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
        Liu Haijun <haijun.liu@mediatek.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        "open list:INTEL WWAN IOSM DRIVER" <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:REMOTE PROCESSOR MESSAGING (RPMSG) WWAN CONTROL..." 
        <linux-remoteproc@vger.kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, lambert.wang@mediatek.com,
        xiayu.zhang@mediatek.com, hua.yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 24 Nov 2022 at 08:47, <haozhe.chang@mediatek.com> wrote:
>
> From: haozhe chang <haozhe.chang@mediatek.com>
>
> wwan_port_fops_write inputs the SKB parameter to the TX callback of
> the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> have an MTU less than the size of SKB, causing the TX buffer to be
> sliced and copied once more in the WWAN device driver.
>
> This patch implements the slicing in the WWAN subsystem and gives
> the WWAN devices driver the option to slice(by frag_len) or not. By
> doing so, the additional memory copy is reduced.
>
> Meanwhile, this patch gives WWAN devices driver the option to reserve
> headroom in fragments for the device-specific metadata.
>
> Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
