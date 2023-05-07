Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA041C77B7D
	for <linux-remoteproc@archiver.kernel.org>; Sun,  7 May 2023 14:48:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbjEGOsk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 7 May 2023 10:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbjEGOsg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 7 May 2023 10:48:36 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD54B15EFA
        for <linux-remoteproc@vger.kernel.org>; Sun,  7 May 2023 07:48:30 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9660af2499dso307566566b.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 07 May 2023 07:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683470909; x=1686062909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iE134vQgSNzS2DPVaEM0R6ddInwhWIrVu0oDCzxV75I=;
        b=oc8MiStl06k/dS1OmX4XwZmneuPwM9xkdk/v/DWnQryg+EHWd9nQEPt6B9G4JPhpvd
         v3hxksfYChR46tSlPjY0BRKChVLa3V5JA6a6Pq/0DLrbCS0GnFGRTzjwi5VwKv11T/uY
         j6KdoCiXqvqVoG+PwZnYUi4I2Saq3o66vdVhPwnWeLosFgg3RFvEfAR4Xmu7ttS4+McD
         24ru3EKOORhzFOloHFhEgYpJyc3qS4BcC8P92PWv0+wIgYR9d0OPoWq84lbcUjgWwuOo
         wd5iiMBZuiSV8IqKuh5av12YrwWiv8/C80Jm5kuq8uWUuq4FJWlrBXMg4Vejo1hisjea
         iuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683470909; x=1686062909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE134vQgSNzS2DPVaEM0R6ddInwhWIrVu0oDCzxV75I=;
        b=buGW9D4gXi9n7DgJg5uPjuDnPiadp3ZMB2IgmuoDS4s8+TFr2gVZpYujzeQt5s0emv
         Oy3ZQqAyy5WxPETQsfN8DVb0i5oaLNXvTzWLvErhQLq21Y+tpTrF0ZKh/0Xcr/zIg8ud
         BcjFgpET2lzSMLhrQx/jEWxGgKNUvkIsJhDyhyNt0KBne3z4ZxOaZ+8tB4GNAl++NiuY
         BjRCAC58LxtM83vYXwmrWgWYJFO1xs3wt0rIbfiMx6ZrfMO/HO+SdNH9MzqeLb5hlnIa
         0/3o2zFsGgBUHSZ1f8IRK4xhLJzkMNkRkCMMSy3cfDo3uEvCqDebpX1rguB9D1EtWD4H
         OnEw==
X-Gm-Message-State: AC+VfDyong/uAD0ileMCoq0GHi18tmwlHtf7nkv1bCKR9vCSN74DgUv6
        265N1NsxnhzHOIF27DJCewbQ8w==
X-Google-Smtp-Source: ACHHUZ5M1OGztQCDtLZh/GfKvH6ydIeXxG/nBJmYT6/rF+K1SzlcLOJA7bMvZU4TElE6N4xdoghrAg==
X-Received: by 2002:a17:907:724e:b0:961:8fcd:53c9 with SMTP id ds14-20020a170907724e00b009618fcd53c9mr6823568ejc.39.1683470909289;
        Sun, 07 May 2023 07:48:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
        by smtp.gmail.com with ESMTPSA id fh8-20020a1709073a8800b0095ef7268ba9sm3710023ejc.41.2023.05.07.07.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 07:48:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: staticize adsp_segment_dump()
Date:   Sun,  7 May 2023 16:48:26 +0200
Message-Id: <20230507144826.193067-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

adsp_segment_dump() is not used outside of this unit, so add missing
static to fix:

  drivers/remoteproc/qcom_q6v5_pas.c:108:6: warning: no previous prototype for ‘adsp_segment_dump’ [-Wmissing-prototypes]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e34d82b18a67..f77d11c91a75 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -105,7 +105,7 @@ struct qcom_adsp {
 	struct qcom_scm_pas_metadata dtb_pas_metadata;
 };
 
-void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
+static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
 		       void *dest, size_t offset, size_t size)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-- 
2.34.1

