Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C411891D1
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 19:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282744; cv=none; b=T9X45pL8vJhIES0fDDed0Adld1KwP31NPsO4ZMmahWxqf4sT7a8jjgrkqnHpiqpdlawblxh4/CJk1krS2dSiRJLhnEF4G1PaWWFvpYAUs38Ak6w3xFI0EJL/lLImlLI5N0eLfuwQn1OPRTOa+p3Op7fbl0Uz7LeQ2mpoc9lOioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282744; c=relaxed/simple;
	bh=1JDpJg4D5mnG6rxlSXya5MgNo0kQEJZBIz2UcIt5yCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmNmWmhra6zMLPuWKO9adHaA59ttV/S54+q/KVgHGl2KBBVO1JN3+GdVeOx3J7ba61zWUfhM1nUEeTSRUnED3XFjXBVELrSFb99YfXv/60Cagskds0voCruwsmS3D5loJtwJcwlBJ8SSr2Sqk36YXWRH2Ev/pb7yt8K5qR0izVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTrdC4lJ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTrdC4lJ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efd8807aaso5971817e87.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 12:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722282740; x=1722887540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z48cJN8bsHcSp42cPATakCbMPlmNxxITyOVFPogjtvg=;
        b=UTrdC4lJYNkk4dQErrBwxOCEL2/sw6N+rJf1NNr/F0DX8KEw+H+2LEjkg2Xdk4edof
         78n5+8AXUYn8wtbEgH25DXSsWLiSiXpFYycE7OLzLKK95TOuh4B3UpZEFA0eaROAUvdh
         nC0lNX8Z6cUQzqkJZEBChSQFsO4bjA5x8rZQCxEe7eMCK3CLKBuTJ1bdDctSdjL7CUhL
         yptkROIqUsd1rlEdPHea7DmQvSNtuwjqt/oOALRaHJT7XAalWg0YOa0SV8Xq8C88BAxD
         MlBcziY1THy3XCf+p3cdp96rJJEvNC5nCQX1Y/epS3//4+kTQOxbkRRdPIvlDDAAEQEA
         PEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282740; x=1722887540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z48cJN8bsHcSp42cPATakCbMPlmNxxITyOVFPogjtvg=;
        b=In8vKSVIEiqkzIVSOudg7RFFtCr3yU+lktswyfbV7CurX8nTOwLsV/WX5XjpOJT/tZ
         LHax3Ry1DxmqY56Sg0N8dJ6Npiu3fU1kWI2z63b/BHxCr6mFb9ahQDc8LixE7jVSXSnb
         8aWpBxvIji1UhFZhE9qOQgZcsZ967OiN+l48iBVTjZsdC1TIUwKrqf7076n0r5kJJT5h
         ggl2xoard2rfpAIhKnoNA3vMNuj3V+RMF54DvKgs6MmORguMQn4ZAb/4nQVbE7UYcfgv
         mpbH5Wjl89Ti3dL3uNMR+dv8O7iTptgRpxKvZ2WeynOwTDab9koW0MEI1nHv5hz3Q9Aw
         k7TA==
X-Forwarded-Encrypted: i=1; AJvYcCXTKAyHoFs1CaOLyX3quMHjPJaVhh69iihFJpL/JMf6PzZHFaOU4udMKeQJp38xAqHZ3nPCEGFNFeDy9gH6b4el8tCPhcETddYeL7tage48CQ==
X-Gm-Message-State: AOJu0YzYF4qrgKhXB62qj2mahXB/fWXFExjTS1fzV9BOuVe7Fj1r/8le
	hRgnjVCNQxhTOtYbh1+VSdTMt+jKtCUgkBGCGGe2O4yNvcpjmvsKIcyZouUTvpk=
X-Google-Smtp-Source: AGHT+IFcaKUwE6nw58d+MaCnRlOtr9ZAVvHele9K2bliHS/NEwazq7CG2wLr+msRJzjdwFVnFB1bnw==
X-Received: by 2002:ac2:4bca:0:b0:52e:9fe0:bee4 with SMTP id 2adb3069b0e04-5309b25a273mr5894940e87.9.1722282739977;
        Mon, 29 Jul 2024 12:52:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1088sm1615590e87.106.2024.07.29.12.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:52:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 22:52:15 +0300
Subject: [PATCH v2 2/5] dt-bindings: soc: qcom: smd-rpm: add generic
 compatibles
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v2-2-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6374;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1JDpJg4D5mnG6rxlSXya5MgNo0kQEJZBIz2UcIt5yCE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp/LwR8pGhbfM1GtrQTm+ZLaqyAWQ7eK4uhzfH
 WdV99zdoRSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqfy8AAKCRCLPIo+Aiko
 1Qu4CAChkTQQu+D2Q3DYhFnTtiOJZcnzT4tw+OmUtPvnE3wrdXUmPLbNL+Qe/hlQj9q8FXOb1i0
 MAXHqOe9xi/djn0/l3DN8/FnmKtUTaVUk3cpsDZu8jXehrrAPtM0nbCRS0ZNZEV6XuSdOh0qo1s
 P81wKJtFvpeI5W0LDFT2p2oEqE/zgb0a9LeETEY4mHc4OIaHCZU8bTnZ3uqnXuu/xDIkJ9HSCr9
 xTDxGbFEbXwWLaWe41AWUil3so4QOe+Ej9xNXZdCJJ9DMZO2j6NTL2DzNYmGP8mb/chR6p6SJAf
 5GM0Oel8/rlBJdDCZ9DIF1aYoJ+YZlN95NTBNLe1XJiuLHGP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add two generic compatibles to all smd-rpm devices, they follow the same
RPMSG protocol and are either accessed through the smd-edge or through
the glink-edge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |  2 +-
 .../bindings/remoteproc/qcom,glink-rpm-edge.yaml   |  2 +-
 .../bindings/remoteproc/qcom,rpm-proc.yaml         |  4 +-
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 74 ++++++++++------------
 .../devicetree/bindings/soc/qcom/qcom,smd.yaml     |  2 +-
 5 files changed, 38 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index 3665dd30604a..02fcffe93f1a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -139,7 +139,7 @@ examples:
   - |
     rpm {
         rpm-requests {
-            compatible = "qcom,rpm-msm8916";
+            compatible = "qcom,rpm-msm8916", "qcom,smd-rpm";
             qcom,smd-channels = "rpm_requests";
 
             clock-controller {
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
index 3766d4513b37..c54234247ab3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
@@ -90,7 +90,7 @@ examples:
         qcom,rpm-msg-ram = <&rpm_msg_ram>;
 
         rpm-requests {
-            compatible = "qcom,rpm-msm8996";
+            compatible = "qcom,rpm-msm8996", "qcom,glink-smd-rpm";
             qcom,glink-channels = "rpm_requests";
 
             /* ... */
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 7afafde17a38..0c3e668b5d31 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -142,7 +142,7 @@ examples:
         qcom,smd-edge = <15>;
 
         rpm-requests {
-          compatible = "qcom,rpm-msm8916";
+          compatible = "qcom,rpm-msm8916", "qcom,smd-rpm";
           qcom,smd-channels = "rpm_requests";
           /* ... */
         };
@@ -163,7 +163,7 @@ examples:
         mboxes = <&apcs_glb 0>;
 
         rpm-requests {
-          compatible = "qcom,rpm-qcm2290";
+          compatible = "qcom,rpm-qcm2290", "qcom,glink-smd-rpm";
           qcom,glink-channels = "rpm_requests";
           /* ... */
         };
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 2fa725b8af5d..270bcd079f88 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -30,31 +30,37 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,rpm-apq8084
-      - qcom,rpm-ipq6018
-      - qcom,rpm-ipq9574
-      - qcom,rpm-mdm9607
-      - qcom,rpm-msm8226
-      - qcom,rpm-msm8610
-      - qcom,rpm-msm8909
-      - qcom,rpm-msm8916
-      - qcom,rpm-msm8917
-      - qcom,rpm-msm8936
-      - qcom,rpm-msm8937
-      - qcom,rpm-msm8952
-      - qcom,rpm-msm8953
-      - qcom,rpm-msm8974
-      - qcom,rpm-msm8976
-      - qcom,rpm-msm8994
-      - qcom,rpm-msm8996
-      - qcom,rpm-msm8998
-      - qcom,rpm-qcm2290
-      - qcom,rpm-qcs404
-      - qcom,rpm-sdm660
-      - qcom,rpm-sm6115
-      - qcom,rpm-sm6125
-      - qcom,rpm-sm6375
+    oneOf:
+      - items:
+          - enum:
+              - qcom,rpm-apq8084
+              - qcom,rpm-mdm9607
+              - qcom,rpm-msm8226
+              - qcom,rpm-msm8610
+              - qcom,rpm-msm8909
+              - qcom,rpm-msm8916
+              - qcom,rpm-msm8917
+              - qcom,rpm-msm8936
+              - qcom,rpm-msm8937
+              - qcom,rpm-msm8952
+              - qcom,rpm-msm8953
+              - qcom,rpm-msm8974
+              - qcom,rpm-msm8976
+              - qcom,rpm-msm8994
+          - const: qcom,smd-rpm
+      - items:
+          - enum:
+              - qcom,rpm-ipq6018
+              - qcom,rpm-ipq9574
+              - qcom,rpm-msm8996
+              - qcom,rpm-msm8998
+              - qcom,rpm-qcm2290
+              - qcom,rpm-qcs404
+              - qcom,rpm-sdm660
+              - qcom,rpm-sm6115
+              - qcom,rpm-sm6125
+              - qcom,rpm-sm6375
+          - const: qcom,glink-smd-rpm
 
   clock-controller:
     $ref: /schemas/clock/qcom,rpmcc.yaml#
@@ -84,21 +90,7 @@ if:
   properties:
     compatible:
       contains:
-        enum:
-          - qcom,rpm-apq8084
-          - qcom,rpm-mdm9607
-          - qcom,rpm-msm8226
-          - qcom,rpm-msm8610
-          - qcom,rpm-msm8909
-          - qcom,rpm-msm8916
-          - qcom,rpm-msm8917
-          - qcom,rpm-msm8936
-          - qcom,rpm-msm8937
-          - qcom,rpm-msm8952
-          - qcom,rpm-msm8953
-          - qcom,rpm-msm8974
-          - qcom,rpm-msm8976
-          - qcom,rpm-msm8994
+        const: qcom,smd-rpm
 then:
   properties:
     qcom,glink-channels: false
@@ -129,7 +121,7 @@ examples:
             qcom,smd-edge = <15>;
 
             rpm-requests {
-                compatible = "qcom,rpm-msm8916";
+                compatible = "qcom,rpm-msm8916", "qcom,smd-rpm";
                 qcom,smd-channels = "rpm_requests";
 
                 clock-controller {
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
index 4819ce90d206..d9fabefc8147 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
@@ -56,7 +56,7 @@ examples:
             qcom,smd-edge = <15>;
 
             rpm-requests {
-                compatible = "qcom,rpm-msm8974";
+                compatible = "qcom,rpm-msm8974", "qcom,smd-rpm";
                 qcom,smd-channels = "rpm_requests";
 
                 clock-controller {

-- 
2.39.2

