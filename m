Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E591C0032E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Oct 2023 07:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbjJYHiW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 25 Oct 2023 03:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbjJYHhn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Oct 2023 03:37:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093F53C22
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Oct 2023 00:35:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507ad511315so7923211e87.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Oct 2023 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698219348; x=1698824148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bh4BuX6mtZj4adG7q0FqVSsfQ8nAZqCkGJa5faAKDA=;
        b=H69AXcBSC22A5ekX9AX3j5iICT6RAUgaaCNtPXcAiblaw946gZZDJ1R25UuzgvAr92
         YJjsFtXRuAFL50vNn1AVip5TLiFJaejokBfrtcR9VvL4DLPN6NM2LMq49Y6fcG6mgxcS
         i1cDRl9j38wnjoJ4fQhlr+YgaluqpFSntGHehwZMpJDqFtmCOP5GXQHoXHcjOVdj8KN1
         OaOjokUHS46sz7qFwA39Fjx4W/Jux3f+8U2vBnK9I+W6v+NlCKnV1ssP91JpLsLKikDu
         ohOCSuFZ5S2/I1835Ikt4xIqOg5SDnLgoGwETay1o0DjE9HnSme8YJMVq7Hy5E2zBc3M
         dtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219348; x=1698824148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bh4BuX6mtZj4adG7q0FqVSsfQ8nAZqCkGJa5faAKDA=;
        b=HKHUen9pZ0iLi/cgP0Xfpc2tWn1R60T7OjVxzIaPedN4iy2WXgZ9iBqx3zaDsCCjPv
         EnTVAJgDT0R4WzKwPPETrXSFim+UgXjCsDAOGiQ0i1uKElFkrZoz3T2yh5XwS4k19tbE
         9lBRcaHzNvfvyL1yLNLaReBhbV5Yxq9o+jDqNFV8fcuDYFO0DEM7SAMA9J3gkH3TNYfa
         GTJO5Du/GA3okIyRn7VKLMo5KswLQk1bgXNyXFEIC0a0ig7XJWy60l6vVvMMuvK8dDWm
         JBT+yer0TbVT2Vu4KTeOcgZG5aEadO3NOmrJzt9itOeT5y5s7ddhcbaGucAH5hIkld3s
         8izw==
X-Gm-Message-State: AOJu0YxwAZhqw4cL0agyvO8ACb5uROD93tLdVJu9jE29Q4TcqyvYTpSl
        zNLOZfpNbIWFgkaQN8cUR9Q0SA==
X-Google-Smtp-Source: AGHT+IEok7+7i7J3MiWpVTCnYZbsBa4BwVdftYEt/MBaQimcueIhBHWyTcSohkn9ayIdCz1seqb6jQ==
X-Received: by 2002:ac2:546b:0:b0:507:9a93:84df with SMTP id e11-20020ac2546b000000b005079a9384dfmr9912707lfn.25.1698219348231;
        Wed, 25 Oct 2023 00:35:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d14-20020adffd8e000000b0031984b370f2sm11416346wrr.47.2023.10.25.00.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:35:47 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:35:44 +0200
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: document the
 SM8650 PAS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-remoteproc-v1-1-a8d20e4ce18c@linaro.org>
References: <20231025-topic-sm8650-upstream-remoteproc-v1-0-a8d20e4ce18c@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-remoteproc-v1-0-a8d20e4ce18c@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2945;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ReX6I/P07eTgtQQTrQKO8qWXZbNK8GFq7o2EoG+yCMA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMVQLaoczDUEsgaDjUrfWjriFoPMK+x8TpWa8qPX
 s3uq6eiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFUAAKCRB33NvayMhJ0U9hD/
 9AT3wLIpKzJCgeYqnETIcqLOYl9i2NfBxP3JI7g7QbnyLE6VpjM66rjqljM4WN++ZoXTI3d3phUg/8
 /bOLZGqepIHLnQxiNf/R4pgiWf5/sq5JVS+St++c/0LkK9+/g/AAAuYzvX9NvbXEjy8KeowZWBosbP
 sDvdZHj0swuDrvr2pYg3k/KllaURNNwxlSUf4vWkH4ruJ6L4QnxwD+BO55Ar22yN2xIWcs/F2D9Isd
 kB4D7u2+uyqByiwCXdKQZa+ZsGtw1PJXLx4vVOO7wcJJeUBmN/GAIbtHB56yOAJr1QNXU6KdlMc8t5
 TblmLDPwbGjbPBrt697f7MBgkWE+T1b5oswndRfOYvrToHHAoRUWwuV6l4NuPKAVg4NrIzCMXgAoP5
 CNWjJKZHWwEVfh59sCTXmhMB0jKojp5pqQgbD9HTrJIEQN/ZkllPLUh3/JviAeUOwGBESn8w9J01e6
 EWYVbUVdJDkSw9uynnJhTNbSp6t2459fzrEZOp3kSjNGme93DIxZDwMYdJG204khMcnur4Sw8Vpgpo
 B5r3dSvlAJLqaPFge9UrBgxmwUaN9h9898OD5SzxSips53igQEtvBviSaJUK0aY4/AiSAH7yzujmpi
 ySL/SBqY3pm3fI8CKrMGpNW9dDHPfkth5V7+rcgxMDcF9TJ8lGP84ak8XZvA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Document the DSP Peripheral Authentication Service on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 41 +++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 58120829fb06..316371c8ee6e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -19,6 +19,9 @@ properties:
       - qcom,sm8550-adsp-pas
       - qcom,sm8550-cdsp-pas
       - qcom,sm8550-mpss-pas
+      - qcom,sm8650-adsp-pas
+      - qcom,sm8650-cdsp-pas
+      - qcom,sm8650-mpss-pas
 
   reg:
     maxItems: 1
@@ -49,6 +52,7 @@ properties:
       - description: Memory region for main Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
       - description: DSM Memory region
+      - description: DSM Memory region 2
 
 required:
   - compatible
@@ -63,6 +67,7 @@ allOf:
           enum:
             - qcom,sm8550-adsp-pas
             - qcom,sm8550-cdsp-pas
+            - qcom,sm8650-adsp-pas
     then:
       properties:
         interrupts:
@@ -71,7 +76,25 @@ allOf:
           maxItems: 5
         memory-region:
           maxItems: 2
-    else:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8650-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+        interrupt-names:
+          minItems: 5
+        memory-region:
+          minItems: 3
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-mpss-pas
+    then:
       properties:
         interrupts:
           minItems: 6
@@ -79,12 +102,26 @@ allOf:
           minItems: 6
         memory-region:
           minItems: 3
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8650-mpss-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          minItems: 4
 
   - if:
       properties:
         compatible:
           enum:
             - qcom,sm8550-adsp-pas
+            - qcom,sm8650-adsp-pas
     then:
       properties:
         power-domains:
@@ -101,6 +138,7 @@ allOf:
         compatible:
           enum:
             - qcom,sm8550-mpss-pas
+            - qcom,sm8650-mpss-pas
     then:
       properties:
         power-domains:
@@ -116,6 +154,7 @@ allOf:
         compatible:
           enum:
             - qcom,sm8550-cdsp-pas
+            - qcom,sm8650-cdsp-pas
     then:
       properties:
         power-domains:

-- 
2.34.1

