Return-Path: <SRS0=569I=CJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98ABC433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 Aug 2020 21:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC3C120866
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 Aug 2020 21:38:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OoSQtxW0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgHaViC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 31 Aug 2020 17:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgHaViC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 31 Aug 2020 17:38:02 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4ECC061573
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2020 14:38:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls14so585471pjb.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2020 14:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv3iIpISK+Eauvn2X+pBHs6mFWEi7dy0S6XImcuWXSA=;
        b=OoSQtxW0+3StDvjlRlEx76r1riZgAyXM6VLcswEInCWblGV3xuGwJyaBg0whjjotcM
         wbH5LSI2btvaYWjdAMl8iD8+jfMtNajn/k+jdCapSLxs2PUL9hFiwcbCyWlG2CEiNyuE
         imvA+k5Cp1q54kbpN6IFAXldiwPGnNiDWDg19+L1/3R7QHHB5U7xuReYGKicSFPbD3vu
         T10liVf2z2TtjFiLG9Ie/jgxDwgxN7vRdpL2r99IO5n4U0S6pPseE5xhSbb6AJU/JT3q
         e47+qDo+iusgo3/v0drWT23NdWz5Cb7f8ftbffL7SD4KUSm1r5UVc66381v8afJ6BXnB
         uPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv3iIpISK+Eauvn2X+pBHs6mFWEi7dy0S6XImcuWXSA=;
        b=fEZrdo8PrnQyElUD/DYZHi1pvsStd9M7wGIE1TikhxD7C0NJ3D1TFqOZe0L7phTTCE
         osGyCflPKF9/cQsfocONtT5ANSUJmrhoJGq7DClWW3bAcihRGyAlUrskOrp1xrxPJIEg
         ipY/atVEhfHhrtJCAk8Z5lgnwVuzqA/QdUpiMFC3WCHVIVnqzCnJD2Zn3S4kx6VjOyZ1
         E3QqdEQOwybWwuzfjpWD/iAA3jswHTNR0mKVyh/3ncyuALHB5HAo46GD7F93CcyzTT2b
         CVxBRH+mhegCJqvhoHKfJfoSINj37tHNDXXgfasRHZeR/DAIRt0s2bFVRIuMZDAyRbaj
         esew==
X-Gm-Message-State: AOAM5311VhSEQmnFt5GnUixp31XI5yTTzTGStRNpbIMSSsTcQVWRnJby
        cH3nntvsGuGVpzs2ZEI2xcAWQw==
X-Google-Smtp-Source: ABdhPJwOasYqywsqH/gXmdcdXJCqpia6QSc5UMEsjUUKJTmBkUyNf87L6K0ndjbpJfKkGCtLXdwLyg==
X-Received: by 2002:a17:90a:fe04:: with SMTP id ck4mr1235872pjb.210.1598909880687;
        Mon, 31 Aug 2020 14:38:00 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m24sm8525514pgn.44.2020.08.31.14.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 14:37:59 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: stm32: Fix pointer assignement
Date:   Mon, 31 Aug 2020 15:37:58 -0600
Message-Id: <20200831213758.206690-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fix the assignment of the @state pointer - it is obviously wrong.

Fixes: 376ffdc04456 ("remoteproc: stm32: Properly set co-processor state when attaching")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index f4da42fc0eeb..d2414cc1d90d 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -685,7 +685,7 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
 		 * We couldn't get the coprocessor's state, assume
 		 * it is not running.
 		 */
-		state = M4_STATE_OFF;
+		*state = M4_STATE_OFF;
 		return 0;
 	}
 
-- 
2.25.1

