Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD73CC433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 Oct 2022 23:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJEXa5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 Oct 2022 19:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiJEXa4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Oct 2022 19:30:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C7085A8A
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 Oct 2022 16:30:55 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id z23so886411ejw.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Oct 2022 16:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=UX0bLlLCDe1devOFgZVR6xtbWzK0eJQ5Cn0PUZq0ZRg=;
        b=qKahcJTfeRB3QWhzoqmc4NsVcYxraCzdUidmXg+0GzFuu6BQE1WMsbOMvE4rIqtIRt
         FuqqbQuZmh89qidw59yTUbR6oZ9QHVbfAntc78VOxRLRk89osodVCD4BW9Ze9MCfDmIb
         w+LaK5d4RMLgJV/RqCzhoRggdoC+Pcxb+m9G+nAukKWCm2z57Be5G3sGTvvKq0DWRdqA
         IhQDAWplNzlnOXSKw+/jklTSIKQ5uzx3M1gWOfO39Cs9+/4P566wlEUDLuyg8pK/dIzw
         arl9UEDQkOubn65V9PUntoJCG1hYLtm8RoVaFWT0RCgjWY/TA0wZ4xRG1w8JAASTe3hd
         cDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=UX0bLlLCDe1devOFgZVR6xtbWzK0eJQ5Cn0PUZq0ZRg=;
        b=XDQJVM+QBuzKFdGkxJubT4G3YS75tk2peoapGzs1FY72q9XawiDDILsf1Y+K0IK/ZG
         vlwMA+4TMzjYBqAQ7KUAHSzAMEjjtSJFEisrIhtmSHv+Afizw9HiBuR5clIYpLROyhX5
         cvVBY989oBhwxQa0qk04yS/DXQlxA22nuAZA3w1+BwjhsEr+4qZlJHGN8NJrsksGbcMA
         TDGgU10ip7DYYZryZFL+vtuvW3UUH6EcWoZou7HfjSLxXabat41+2V8xxtXDFjNdCI6f
         LAXLstHSs9dYiTofJv3+w6fcxtC01xYaFzU71R6SW0x/luH3veXrNyjXU5HWaZZ2Sl1O
         cS2g==
X-Gm-Message-State: ACrzQf2TAwU/a8d7bZJ5tfR4WMiIgP8qWCRtI8CRiQTiE1OZvqXYPiMy
        w9gGSnyifKSruziCvTQ69oJNFdnpKOX1YS56bqyAmAbGzec=
X-Google-Smtp-Source: AMsMyM7qfDJTgk70VVrF5GTOVWU2pG++CSP4VmcltJY9jFj8fvSwQ5QLzqDrQA+90ckcO3kxYGMUwXwsGQ6PUrei2aU=
X-Received: by 2002:a17:907:78d:b0:740:33e1:998 with SMTP id
 xd13-20020a170907078d00b0074033e10998mr1672894ejb.162.1665012653619; Wed, 05
 Oct 2022 16:30:53 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 5 Oct 2022 17:30:42 -0600
Message-ID: <CANLsYkxshqWUagQkXPKbiP2u=o0nJ2X-_pKp1KWFW1DQ0=AbYQ@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for October 5th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v2] remoteproc: imx_dsp_rproc: Add mutex protection for
workqueue (will queue when 6.1-rc2 gets released)
[PATCH v4] remoteproc: core: do pm relax when in RPROC_OFFLINE
[PATCH V6 0/7] remoteproc: imx_rproc: support i.MX8QM/QXP
[PATCH v5 0/3] Add support for WASP SoC on AVM router boards
[PATCH v3 00/11] Add support for MT8195 SCP 2nd core
[PATCH V3 0/3] rpmsg signaling/flowcontrol patches
