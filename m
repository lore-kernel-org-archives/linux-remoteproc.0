Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB9DC83014
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E89B20643
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4PfmXE+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733277AbgKZVGq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733088AbgKZVGp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:45 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEA3C061A47
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:45 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so2639587pfn.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8dSpVOpxPRkH7Ii5MIpuEJbpdKoro7QaAmsugruQCw=;
        b=P4PfmXE+FyQXDHy7FgUHIsP5Zo1vGXgGcprWj5PB8cHTbClbTLHEi1OyxOAboyn1li
         UGdIfos4P/stI6PNO6eh333PBp7DupwMLj5qpZjiNbCU5QYrFTXJK7iMkCAwRLzjUis2
         JkUnprHv5osDdjPK3iaQvipXGPnbkACZ8lE44zJLGy6KMKpxWj+cg23jKpvYnC7D+Pz7
         KA1pmb0JW09uAluqEE/mmr6hHVVyZ+dgkCXOGEV7tjTSYy0InNz909L+DGT90b/vpnIx
         mzw6jQdyXneVb8u7SHkkrnloKV8FRa11JJ3EwqN0s4J/xJFb6Y1mhqORAkhNXfck3kVM
         7nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8dSpVOpxPRkH7Ii5MIpuEJbpdKoro7QaAmsugruQCw=;
        b=c/BJMBD+he7oTCvfaQonEnG9kMXfUmxNqPK12q6gIpOAhuLOID+X0ySsVb2FUFo+6l
         A4NxfJS5Gxmg9hPPbsxO4JYUE0RsqIByoqgSPp+X8aKCr8LFoNzlTpCDjUSEVP2tHSKr
         defXS/Y5xHjfHtcxpvY2O3y4DcbQkfOF2kPTxp8cJhD6coPOQWTjzhuuA6S5+d13bJ40
         s+d89mVF3mrCpE4+bToXusL8die74CYjT8N8icYnhwl/iYJQo5jHllzCE4JX4IFYtCYi
         NQOTSQcPS/WCXv3p+GrfGImrLOnmTXgb7/O/b5xWF0W4KGC22C6dZfvXhA01UC3QzWqw
         Behw==
X-Gm-Message-State: AOAM532xGgGsGzTXjxl7isX+/fPSqAuGgaySPXxz4xA0h7ZK9mxYOsgk
        zo+Fnyqa26BWvPpdrYxMALgeNQ==
X-Google-Smtp-Source: ABdhPJyLy0T5HMCS0PiytpdYdYbOO1InxoG7sEnAYMH/+Vu63BhfR4ArQGA3dOHVMbwpVqehSA8Tmg==
X-Received: by 2002:a63:1704:: with SMTP id x4mr3933109pgl.65.1606424804717;
        Thu, 26 Nov 2020 13:06:44 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:44 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 01/15] dt-bindings: remoteproc: Add bindind to support autonomous processors
Date:   Thu, 26 Nov 2020 14:06:28 -0700
Message-Id: <20201126210642.897302-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
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
---
 .../bindings/remoteproc/remoteproc-core.yaml  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
new file mode 100644
index 000000000000..3032734f42a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/remoteproc-core.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Binding for the remoteproc core applicable to all remote processors
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Mathieu Poirier <mathieu.poirier@linaro.org>
+
+description:
+  This document defines the binding recognised by the remoteproc core that can
+  be used by any remote processor in the subsystem.
+
+properties:
+  autonomous-on-core-reboot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Used in two situations, i.e when a user space application releases the
+      handle it has on the remote processor's character driver interface and
+      when a remote processor's platform driver is being removed.  If defined,
+      this flag instructs the remoteproc core to detach the remote processor
+      rather than turning it off.
-- 
2.25.1

