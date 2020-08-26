Return-Path: <SRS0=heY5=CE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72259C433E4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Aug 2020 16:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5047D2074A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Aug 2020 16:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qf8ULyJn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgHZQss (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 26 Aug 2020 12:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgHZQpf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:35 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189E4C061795
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:34 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h2so1154456plr.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UBjkd/nhJw+5eFsm4c9uEVXQEw9HU2zN9X5gsAn0rmo=;
        b=Qf8ULyJn2F0iIwf8dA+aVpTzmLX0NtkKs/Jg3rzWujRiqTX/BHskaLds1G56xa3F29
         FTRgUuV6keGhWYBXOPLaqAXhI7qkN7cMWY10ZU6ejxCHlUV+8K6bP9PuHM3NEASjyvJE
         nBDfvDxgy0jcWkglP3DTRGGkN7DLsjFFis7JQ5SRvPY+4w4XSdpm4GzCerzPaturE5KD
         +H/uDvHagHaN16pGk3gDL/jHhsQJD7wPXm1Xe6oSEnUTNbVWbqE7xIlmRXN+SsOGczdC
         3/sjiH0qrIOqBUdxrw2KKAvnUK1YNxOFkaowjK5A78JQuwO5/7meLRB6Qjcnaf23tqFV
         k+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UBjkd/nhJw+5eFsm4c9uEVXQEw9HU2zN9X5gsAn0rmo=;
        b=f3JZMIuZvrrlJer+xvq3DDDSUlYd37Eu1t6buiNm7Apz2PTeifquTgJlsfCabS//YC
         wytuv21I1WIssAaVDOT8BoMGUCJijUqmlDBudgn/BF+1PY5PdQI+c2u0MW7oKQ+R1scZ
         wvgulsyvC/i20UO2MVIEUcNF51O8p+nq7DlaJ1+EhyGm5AS1UZwyX0r8GFLWc3md2Voi
         mhNIsJ2dP/mZkSXnVHxCv7uNNU/Zi8mzh6zVXraS5thB95AFWIbgzVYfZ6hk0JCWVGm6
         k9+y5qk1DbwZgRY3AUfSZUf/mPTU9TuTa9vB4mBb7EUwqLbjJGHbfFVsw9rcsgTpSCQx
         kTRg==
X-Gm-Message-State: AOAM530YvOzolRcmnDZdZas3iU/s5Vo/L/Zzjzv8DdBSJwqMt9kzRTAr
        4yqdnjLN5nXUWStPioTZLSk9GQ==
X-Google-Smtp-Source: ABdhPJylZ5yXv125kk5hDT9ig5MisH34jLUAAF9+rT46jI+xNbUFWx4mK/gKw6o8/rZiB4tbO9QS2A==
X-Received: by 2002:a17:90a:8904:: with SMTP id u4mr7075859pjn.87.1598460333569;
        Wed, 26 Aug 2020 09:45:33 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:33 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] remoteproc: Remove useless check in rproc_del()
Date:   Wed, 26 Aug 2020 10:45:18 -0600
Message-Id: <20200826164529.224476-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826164529.224476-1-mathieu.poirier@linaro.org>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Whether started at probe() time or thereafter from the command
line, a remote processor needs to be shutdown before the final
cleanup phases can happen.  Otherwise the system may be left in
an unpredictable state where the remote processor is expecting
the remoteproc core to be providing services when in fact it
no longer exist.

Invariably calling rproc_shutdown() is fine since it will return
immediately if the remote processor has already been switched
off.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fb2632cbd2df..7d78c9a9d88f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2260,10 +2260,8 @@ int rproc_del(struct rproc *rproc)
 	if (!rproc)
 		return -EINVAL;
 
-	/* if rproc is marked always-on, rproc_add() booted it */
 	/* TODO: make sure this works with rproc->power > 1 */
-	if (rproc->auto_boot)
-		rproc_shutdown(rproc);
+	rproc_shutdown(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
-- 
2.25.1

