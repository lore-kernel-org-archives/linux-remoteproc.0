Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792814070;
	b=zPgGLx6cF9JoQ4EVzdc46gxYUBNLj7vybEu5aS64NcefWBqRbIbexO4x0fm7/tY6TGil
	 JSVCf/SrZJqt5AgI0AVNZzQPvAYh3kdt7qAXbPMRRSkMuzwA7ss7IfTm+wsr8luKHZB1y
	 Vo1XHtPUERjMeO1uyOcl1hUIJUYZmHqnMFpPaoWkOEMMVU1T33b2AJ6UAIea8DIjIrVHM
	 8sZ/55JuMh6LdfS+0bbasu2NNusOwUmItrlGIcwNf2Xyq5a4vyig3ZYQOddxhkvwE//Dq
	 fE2PWY8eUqyGTLdRRl7iJQOi8MK72Gtzqw33X3QeC5fDVEIa0yLjIfDxieDUkiA9TGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792814070;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r9Oeew+HIGKjdLmCd0UHv5aPDW3Qih0WbW9njiFpnK0=;
	b=KQYnyQH7tDOUR1XGPJDnkSKn7eIENKtzJVny63v6yCXxd6CmPX8G3ArRRKKo7VXQHMds
	 4FF4ROaq1k5J3hQqgOKpk3D4vuwLjQi2Q+lTL+/9I9YwOI8c2wOe3oNqsB41cWnv4GUPC
	 7bEGRmFEQNt0wlbCp1SQ+ouAyp7IObiMHe9hXPKPQ6gw79LgVzf4FKiqlYmMVy1K5bFQY
	 UY/uRr9WGqqZfh2zrMwi8FV+WiI5Y3TKn3vP2ap77HvZju3yfjeXju6lG+m/B+nOdCDr0
	 jNfcnLqjSXmtK5bCcbFXsdcH//JSopP/tSIchXIAznPiw059J4oUz3czvkuj5J3SAwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRSzzD+V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E991606A31A;
	Sat, 24 Oct 2026 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRSzzD+V
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792814069;
	b=xs3Yah1q2+U/bBGGfAO4pSNJfBki9qFJAzsENYHYvw40525cA8XjZFriPdrv9KJfhsW/
	 9nKhzXJ48gyVhr8bc70Pguz8QS/7cZ7Xma3BuVNsNeGaZzkt7QCdXm1Y5OyX/TdIcJjbz
	 xRCDtQ/cW9W4gQj6B/yLjqJ/Pic3a/Jn/cUMTVLSoGn5iW3Zpyr32sJJU6a3+MRlfNSdS
	 3unyxArWHfEfZBvOp6f6k4rjcNWuY58aC91cJsfGfmPiG+A3vbmr000qvCy3yx7MgbM73
	 XkBMyTKeuYGTcujSvjrbIXyCFCxzlDCoUQctFrBvaoK4by2Y+vcuHT3UbXWY1Fx1xgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792814069;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r9Oeew+HIGKjdLmCd0UHv5aPDW3Qih0WbW9njiFpnK0=;
	b=RjxMHqHkm9jPu8rWJToXXOWFadrl+aR/4xtGk7sNZahETeYNZllS4S8Rc/VqYkEUFiDc
	 Mz5hjIfFyF6L0KOOlqYhHnTnlbtHTJR+vkxlcHVzH6jWSfoOphYygUB6a3THJ10I9RKnb
	 ZrIKGmrAnk4imi5zW3iqfa5tEJ9kciBgainI9LU0L1ppiZ9RlbbrcaQI+Ij0RqCXWJEHR
	 KrjZppvuSPUk4Gb/PSENG7fpB4cuzM3vYEJsGz+6Aij1SLx21TIovwK4XDgh2lRaQz3fY
	 B4CBDqswigCZ4xRZ7fTvE+Om4kYoXNm+eJ7vYe/CXGH5F8p3RvWTqP3i15yTT1SN7cg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DFDE1F01825;
	Sat, 24 Oct 2026 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792814069;
	bh=r9Oeew+HIGKjdLmCd0UHv5aPDW3Qih0WbW9njiFpnK0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CRSzzD+VsJibtdGqeuXN9LpGAP1S5ilm6AYwjbwgaP5hS8cjpTUiE1YWLrfy+FgZz
	 1wn+b/Q1JwRYMI2etG+UgFzKlSSuhGIsuy1MaJVBaEaKTLYmgMw4XbjHLI1KlCxn1r
	 bwBCX8btex4RQn1Whjx58iTvxab98y3TBF57eP2NVAT/q9Wg5iXvbUM3KXPJKDdHzB
	 26Nr1TnBBEK47V8p4Oo/SGsSotdpobnQsEWPiR0+wsbhaopqqnZyy1ZJ+vRUMUhj7Z
	 2FD6zHdfHV/WRe2bI4Gp8YU3G3Lo/PYIravCxibL6ZMGKCx4Te53XBulAkCVXdxpON
	 BfMGt39vPQPXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8803344706;
	Sat, 24 Oct 2026 03:54:28 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Sat, 24 Oct 2026 09:24:27 +0530
Subject: [PATCH v2] dt-bindings: remoteproc: qcom,sm6350-pas: Document
 SM7250 ADSP
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261024-adsp-sm7250-v2-1-ef278af8da5d@brar.si>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0JmbU1boQgr72FYlHaQMRFIBxsN6
 d0FjAuXL3n//QUYAyFDnS0QMBLTOKygDxm43g43FORXBi21UVIVwnqeBD9KXUjhbXH2rcK8tAb
 WxRSwo9deuzZf5md7Rzdvic3oiecxvPe7qDbvVzZ/5aiEFLo7VdapTuaVubTBhiMTNCmlD5D63
 pq2AAAA
X-Change-ID: 20261015-adsp-sm7250-da58db1e47a6
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792814067; l=2822;
 i=patches@brar.si; h=from:subject:message-id;
 bh=GuEwrEMO43vHoIW4u6rPZvhBWRNxjETv3/Mw/VJkhR0=;
 b=J7g9bjVXCQ3xsqu578Sr23l8hEGB4wJwwCBDJA67wIAE2OmsJXWkrHEUPDJI+Zw12rKF2fiSw
 mxueE191jyrBjetKy9Gw9nQ/1xDd6DxU6GNOstir7OGw8EsICRdVC6b
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Document the ADSP Peripheral Authentication Service on the Qualcomm
SM7250 SoC. It has the same interrupts and LCX/LMX power domains as the
SM6350 ADSP, so use the SM6350 compatible as a fallback.

Signed-off-by: Ishu Brar <patches@brar.si>
---
Document the ADSP remoteproc of the Qualcomm SM7250 SoC (Snapdragon
765/765G/768G) in the SM6350 PAS binding, with qcom,sm6350-adsp-pas as
fallback. The SM7250 ADSP behaves like the SM6350 one: same PAS ID, same
interrupts, same LCX/LMX power domains, same SMEM crash reason item. So the
driver needs no change.

I am bringing up mainline on a OnePlus Nord (SM7250, "avicii"). With
this binding the ADSP boots on that phone and I can play audio through it
and read the sensors from it.

The SoC devicetree is not part of this series; it is being sent
separately.
---
Changes in v2:
- Use qcom,sm6350-adsp-pas as fallback compatible and drop the driver patch
  (Krzysztof)
- Match the fallback with contains in the allOf conditions
- Drop Reviewed-by from the binding patch, since the binding changed
- Link to v1: https://patch.msgid.link/20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si
---
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       | 23 +++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 42e02c643..8387471d6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -15,10 +15,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sm6350-adsp-pas
-      - qcom,sm6350-cdsp-pas
-      - qcom,sm6350-mpss-pas
+    oneOf:
+      - enum:
+          - qcom,sm6350-adsp-pas
+          - qcom,sm6350-cdsp-pas
+          - qcom,sm6350-mpss-pas
+      - items:
+          - const: qcom,sm7250-adsp-pas
+          - const: qcom,sm6350-adsp-pas
 
   reg:
     maxItems: 1
@@ -83,9 +87,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm6350-adsp-pas
-            - qcom,sm6350-cdsp-pas
+          contains:
+            enum:
+              - qcom,sm6350-adsp-pas
+              - qcom,sm6350-cdsp-pas
     then:
       properties:
         interrupts:
@@ -102,8 +107,8 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm6350-adsp-pas
+          contains:
+            const: qcom,sm6350-adsp-pas
     then:
       properties:
         power-domains:

---
base-commit: 23d0516587f896f5f16a47c97ddb41d28e6289ff
change-id: 20261015-adsp-sm7250-da58db1e47a6

Best regards,
--  
Ishu Brar <patches@brar.si>


