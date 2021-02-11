Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6AFC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7328F64E58
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhBKXsM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbhBKXrN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:47:13 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F73C06178B
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:30 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id o38so5060056pgm.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gwpmc0x1+3eFyR/7BUUjdFio04J+RxJRu7OO5iEL6OM=;
        b=WO0wSo3j+XaM9YaYHbZhCBQTUA7k48YCAkeLLXG/SjngCPEgOa+wAvMxV2TPCD/qvh
         0fkme8eCctnok0ahmPDDDgxEkD+RW1+4aJueNg1Y3ZPvt3IjOHEnKDID7ewATFrq9zpo
         fSj9BxnHyc7QZOdKJlXLnF4keh6RIAzIl5WS07h44J9qG26IR4DBd5uNzHeFwbXP/puE
         B29RUK5RkBKvLKNJulOKT0aSt7EiuqK3kMRDlrR2pmEDpTJPC9AM+ocTJZltBa1sQNhQ
         wV8C90YueHgfVHmAI9NIue9ErJ0P0DgASlEgwmEyfS+qbuKRuY3vqs8gub33yAtz94wp
         y5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gwpmc0x1+3eFyR/7BUUjdFio04J+RxJRu7OO5iEL6OM=;
        b=gqIZiL4hJGCz0twZJOyXxcJ4krOU/vjvDOsXGSevAKUqn7DgVe/WfXh6VkLjQjYcFx
         4SoZTlA2SPAmBCfA9AwKiwxNui7h7rjCDTH2apsSTpaeXbxbdBSlP6AqR9JK5i9gkDmC
         OxEHkXbuXffYtqNiOnP6UfVjcb7NLPsbH47huAT7ppiyCrqcuPkNF43NQc1zFmE2W8bj
         VhwLklN1bajA3Qswk3IFNm+YlW6Az81HuqnvGL4WKPwX8ALP3+hIV22EOrqt3CsdLz0J
         kR0dmCRxtd5Vcppke02wUDkY6SZ4SK6csGHmhg6V3FJEigtTz9QY2wbO/4H8iAv15RwM
         hfnA==
X-Gm-Message-State: AOAM530dw+4TBzd6n5ncsfKPideniHERnU3DiT/LfjppXrRs9/Yx4T/N
        3NI7MpNnn8tlmj+fzBAkOkoshA==
X-Google-Smtp-Source: ABdhPJyoshmN5hyMIWVnq14r/Vp9QrsrpigZcMtxfRIKShVYx5fnja/+wwPeHN7sZeaMkTBfgb2VSQ==
X-Received: by 2002:a63:43c6:: with SMTP id q189mr505041pga.245.1613087190012;
        Thu, 11 Feb 2021 15:46:30 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:29 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 01/19] dt-bindings: remoteproc: Add bindind to support autonomous processors
Date:   Thu, 11 Feb 2021 16:46:09 -0700
Message-Id: <20210211234627.2669674-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch adds a binding to guide the remoteproc core on how to deal with
remote processors in two cases:

1) When an application holding a reference to a remote processor character
   device interface crashes.

2) when the platform driver for a remote processor is removed.

In both cases if "autonomous-on-core-reboot" is specified in the remote
processor DT node, the remoteproc core will detach the remote processor
rather than switching it off.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/remoteproc/remoteproc-core.yaml  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
new file mode 100644
index 000000000000..e8bb8ef9031a
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding(s) for a primary processor applicable to all ancillary
+       processors
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Mathieu Poirier <mathieu.poirier@linaro.org>
+
+description:
+  This document defines the bindings used by a primary processor to determine
+  the state it should leave an ancillary processor when the former is no longer
+  functioning.
+
+properties:
+  autonomous-on-core-reboot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When specified the ancillary processor should be left operational when
+      the primary processor is no longer available.  Otherwise the ancillary
+      processor should be made inoperative.
+
+additionalProperties: true
-- 
2.25.1

