Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9924FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236443AbiGRW7o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236401AbiGRW7j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:39 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3CE33362
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so27841568fac.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eAfbIHpTFOAoRjGkD90y7LO/4GgqXtETFx3Gy0RgRVA=;
        b=TaHYYcha7c1jmbc9+2dwQ0HCbWms1XRyIUpNXSDwRY+hLDP0Bhd/Tyo0BNcKvPaa4b
         XsGCFnSlzPhiz8fnku5L61LhLhj8RYzkH0jnOlW3RszoOvn8MOhYOmHpggZjAVOPnxVx
         Dklbw+rD+gVW03hoeT8lSCujbPUbo2yaABE2U/ICOyDCJujh9tBi5K4elCBxYg3Xs+lp
         l2DpmaBhAYle4UlTFImCla9muF4HzT/OwE0fxr6lw3iGIGXjPleGK9EvxkqRtmKYLMAW
         1LMmDyvTP5F8ZsxJU8Z1JYLhnnbRJ1FJOYwfcH50ZPHBiYg2nJK6aJ3MxfAoxnCxvpTc
         PA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAfbIHpTFOAoRjGkD90y7LO/4GgqXtETFx3Gy0RgRVA=;
        b=CKvbuO+HBLgk+E+94/QG/23oxKg/cr0dEy4sZntcPmrbbbuZmQgxLWiJy0pEiaEQzG
         6BgsJlT84r2pQ7auSu95Y33UIMW4+3BU3sBJuerJBp1sQ/bhOqQek7JSAvmmAC6J68gb
         YjqhPzWETEfg2Y2AUspqLt+K9VmvTlZG9oYRfl+mGUgFuaA36dWoYz4q/zLJRa95FKee
         fXfz0omzYio/JrwPKfbOGiPg4KBXQ7MHrktz3tyU8xJbV49ivuFK6XI+CVzzvSihzJLz
         lcb6aHDdjjANtnzVDW3IzIeSzNjv5BvYkf56Ff8iMDMpyfmRwzbsMagMILJfgw8yYgsb
         1avg==
X-Gm-Message-State: AJIora9Mpqn6nlUloyASZo3G6lCTmovi1zr8uwfIXdO3agtC4JISkKEY
        XY+YWmcG04Ty90UyliGChBPaxuKz1swtag==
X-Google-Smtp-Source: AGRyM1v62qUIegP2TKUu29j7B01aXZQ9P5qTkYtcyO/nWOruXXEqGU0+Shj61aOOuVm+pox2/ebbmw==
X-Received: by 2002:a05:6808:1916:b0:335:5b1e:2594 with SMTP id bf22-20020a056808191600b003355b1e2594mr14190421oib.129.1658185166349;
        Mon, 18 Jul 2022 15:59:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mojha@quicinc.com
Cc:     mathieu.poirier@linaro.org
Subject: Re: (subset) [PATCH v4 ] remoteproc: Use unbounded workqueue for recovery work
Date:   Mon, 18 Jul 2022 17:59:11 -0500
Message-Id: <165817634388.1905814.2453101244848449544.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1650367554-15510-1-git-send-email-quic_mojha@quicinc.com>
References: <1650367554-15510-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 19 Apr 2022 16:55:54 +0530, Mukesh Ojha wrote:
> There could be a scenario when there is too much load on a core
> (n number of tasks which is affined) or in a case when multiple
> rproc subsystem is going for recovery, they queue their recovery
> work to one core so even though subsystem are independent their
> recovery will be delayed if one of the subsystem recovery work
> is taking more time in completing.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: Use unbounded workqueue for recovery work
      commit: 0a7f201e4284b43a60ee286c0921002c7e42413d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
