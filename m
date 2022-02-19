Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A41C4332F
	for <linux-remoteproc@archiver.kernel.org>; Sat, 19 Feb 2022 21:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236444AbiBSV4C (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 19 Feb 2022 16:56:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbiBSV4B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 19 Feb 2022 16:56:01 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C10154188
        for <linux-remoteproc@vger.kernel.org>; Sat, 19 Feb 2022 13:55:42 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v4so11570053pjh.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 19 Feb 2022 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tlXNd4WfVV+N9MiUaNSDYcpKd5QnvzkHB2jHSyxHiSE=;
        b=5CsPhfBVJpIWa/x8rm2/nRs+N1fPus18cLloeaRd9q55k67hSctSfb4OPSgzhhJRKN
         ds1xDXNKBbrg/YjO4G0VLVCjHl3B+o1j4RfesE2fybq4r4tYeUdXsR+h9I0zKcJRX1in
         ANy2eEEcRhi4ELUpvbxjt5gssa2HV/zXKk2xsUk1RXisQDOuDCvNlCnLYGYeJ6jUPjfR
         MxSpYh+aNtu+Y1K6tIqqytBwhlY1/fikjip6nBX029rlIymhVbR4Sj+dMNh/5faVGfUM
         EeXF5jv0IbknANDnNMHFurfvscQuwqwHttIU0niSRoEwE97/ecOlUqR7CWReYDyAIxo/
         Fbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tlXNd4WfVV+N9MiUaNSDYcpKd5QnvzkHB2jHSyxHiSE=;
        b=QqAiOr7Lgn/EcaoeNgsdKvJex2XjwjeGqadRULXAxVIp7qq8We3u5Q6+PSIz0PdVpv
         WN4MBFfvz/EAYUn7z7t1chup45tyOWwbh6+LqoGfOKs4ytT5i8yfy0L1cRZ7JLJOyjec
         8rn9HG2029Df5H6n6PkvaSJcPQ+hs8lQDQLZFm+hsChGj34aFEJnVvbY2zODi3ieZ3Ez
         VZooKQjFoaYE3s/gDnMHWrCYikfDhoreNtme2JFSAxAMR4f4Ivo3zDwYqcgFtEc7btl5
         D5Iha34HXPJU8leYqK12qMRl8mps8vpzTLQprQ2D3EWRfyjshjqbc0sCOvbybdlXXdSN
         0MfA==
X-Gm-Message-State: AOAM531YQ/6Hb5A0REDdT6Em5c61Ta92OH5CtSEE0IJxJSqFeBAj600b
        cgCc/S43A3L9mR9/kgvhelE7Lw==
X-Google-Smtp-Source: ABdhPJxlo3caslaF3DdogQsF2CNkabNAPdTzgIT92VlqtQMgcaudXdsWCY5mLtbEZK5i64FQjhgHfg==
X-Received: by 2002:a17:90b:4cc6:b0:1bc:210d:b6fa with SMTP id nd6-20020a17090b4cc600b001bc210db6famr741799pjb.104.1645307741905;
        Sat, 19 Feb 2022 13:55:41 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1001:7090:31ab:1e81:9550:f30a])
        by smtp.gmail.com with ESMTPSA id i17sm13447337pgn.82.2022.02.19.13.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 13:55:41 -0800 (PST)
From:   Drew Fustini <dfustini@baylibre.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Gerlach <d-gerlach@ti.com>, devicetree@vger.kernel.org,
        Drew Fustini <dfustini@baylibre.com>,
        Keerthy <j-keerthy@ti.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, s-anna@ti.com,
        khilman@baylibre.com
Subject: [PATCH 02/11] dt-bindings: wkup_m3_ipc: Add vtt toggling bindings
Date:   Sat, 19 Feb 2022 13:53:19 -0800
Message-Id: <20220219215328.485660-3-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219215328.485660-1-dfustini@baylibre.com>
References: <20220219215328.485660-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Dave Gerlach <d-gerlach@ti.com>

Add description of the wkup_m3_ipc DT properties that can be used to
toggle VTT regulator during low power mode transitions.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../bindings/soc/ti/wkup_m3_ipc.txt           | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt b/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
index 401550487ed6..4cdbb60fd0d0 100644
--- a/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
+++ b/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
@@ -55,3 +55,37 @@ Example:
 			...
 		};
 	};
+
+Support for VTT Toggle
+==================================
+In order to enable the support for VTT toggle during Suspend/Resume
+sequence needed by some boards (like AM335x EVM-SK & AM437x GP EVM),
+the below DT properties are required. It is possible to toggle VTT
+using one of two methods depending on the SoC being used, either
+GPIO0 toggle (AM335x and AM437x), or any GPIO with DS_PAD_CONFIG
+bits in the control module (AM437x only).
+
+VTT Toggle using GPIO0
+----------------------------------
+Supported by: AM335x and AM437x
+Used on: AM335x EVM-SK
+
+Optional properties:
+- ti,needs-vtt-toggle:	Indicates that the boards requires VTT toggling
+			during suspend/resume.
+- ti,vtt-gpio-pin:	Specifies the GPIO0 pin used for VTT toggle.
+
+Important Note:
+- Here it is assumed that VTT Toggle will be done using a pin on GPIO-0 Instance.
+  It will not work on any other GPIO using the above properties, regardless of
+  which part is being used.
+
+Example:
+	wkup_m3_ipc: wkup_m3_ipc@1324 {
+		compatible = "ti,am3352-wkup-m3-ipc";
+		...
+		...
+		ti,needs-vtt-toggle;
+		ti,vtt-gpio-pin = <7>;
+		...
+	};
-- 
2.32.0

