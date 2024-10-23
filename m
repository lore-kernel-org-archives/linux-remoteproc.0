Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F74E1CEE88;
	Wed, 23 Oct 2024 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700514; cv=none; b=c/k6qyHAQPNoUpsfdR3L6U7K6PqFGbVeJhLtW78DEgOn5PQ2NDBAywPc5q2E9ywB99EahlvBtP9HUTr1KwQErXP9chJO9IDzsFnQcrIGsuRj0elm1onGBV+n6XhpPD7/MDoL3R8PN1F/XuQUKyB1MsyfOEL/dpBl6d46XQ6L0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700514; c=relaxed/simple;
	bh=u5/D8JkS0pteSch/iFvi0JPXftSiwu6DySluq4qPaU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAU9uBuIL5GYCwdbO/Sc/5uBavlcAVuNergPtxG1Skjyh8z0GGX1FHOZhc0dYeD4Dop52fdHWSGguE3kD5d6ykBKR2EtAZkQjDRpUX/wVqEq2Nqri0jwg7MGbiQi5aVaiXX1JHhVbqFSefefesaJn5g9X8dte6dOp6Hi0Jals/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKJkVJ9t; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKJkVJ9t"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so76746241fa.1;
        Wed, 23 Oct 2024 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700511; x=1730305311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgC15d/pQkY9/ZdNYZmW9U8JEuWcaoADNmU9EGiwgmk=;
        b=CKJkVJ9t//XADqBKkvwIJLgKLiHpjw0rKDDxxo5HtGunQndn4eJR6XNNZi1lst0+ZS
         /3rLw8uPKZ07b7EVZVtpXNSuMe04l9/8JGesR/CgbBDeLr2DsRaWu1hf7nFvmEz8zy9A
         G1g2mTCzo5tapRokGHl3cXT2ORZAJzHALpC22ztRnNJ+DlGEpz87DbdNEN4HBxfnfkI8
         ZNz5TmoAu5c+FGstk6V+EhRf1Rc/RNtjBknbV9MS0o4koXjpN6XnvFbT4GcUJ28wlFRc
         cxhL7RT1Qe2/eGEvqgf3beu5IR3b9NB2xs9J+SVNckJcjDXTkRsvYix22MkXRPXFN31W
         RK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700511; x=1730305311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgC15d/pQkY9/ZdNYZmW9U8JEuWcaoADNmU9EGiwgmk=;
        b=f+GtwIghuAG8mdCGPFGj5kELNZwFy33GK7FZLiyCe1yx5IAjsOR3Gb6eAsTYUnzFYK
         xUsLtoujUA0GkjK9uUmkbL7LpKfK99fn+8hOsopzQDXNn5j0AldeNKbNwkjG3pYY8gqk
         fjUGj0O9SFdJXhc2jwWu4r8QcxZDqh6+i0p2ihoW6MEE5uKSJ8Agw6n+ij7DFXvf5GtN
         xs/zmkaeIZis1EZ3MrtAPnH9os9ysDTbkS8wiq8fFpsoTHvkivk/0srjU1mAIaaAxHHP
         DSW3A0mSE205ZPYI9TUJxlP3tB7Uxy+96wwthzq5Wj5GXF4Tgnq7Tr5zOJyzzivaWNDD
         aCBw==
X-Forwarded-Encrypted: i=1; AJvYcCVxR2B5cDSCpu2DHJpGFemubpq7grTbqrq2ZmwP1WTOUDP7QY3mH2jWmrz1ubSodD443yMaKlfUYkW1D9I=@vger.kernel.org, AJvYcCWsyB1txjLQhwMChTzpgLiNDrKlHnwcqx4TcUxb4PuR1deXd2mCg7FXjB4Ex6j5Z7ulkUGQ6Hj1kgbnBxFK@vger.kernel.org, AJvYcCXvSCbB72Jh4fAyIrc4gaKLOdKyQKm2OmuaB5VSOJ8Ch1yx0ILHbLq6Si7NaD4Wl7nAeoECXyTbXUtm@vger.kernel.org
X-Gm-Message-State: AOJu0YxvzeMYOvZ43SOCn1zH4nAvIBixEQi4pHFSMXbzzkBxpchbmVW6
	AI2S3/aMSSZ/uMgKHMFA48FJ2Zv5OStDRUwWxFihWmHp+ekyVR8b
X-Google-Smtp-Source: AGHT+IH6A0+R1gxcuSRH5wO+QbdVBb6hBn6+S5OLqazKgIRlUbTwpM/jY7yy8fE+80bw1Otx1SyW+w==
X-Received: by 2002:a2e:be09:0:b0:2fa:e52f:4470 with SMTP id 38308e7fff4ca-2fc9d2ddc23mr14523171fa.9.1729700511046;
        Wed, 23 Oct 2024 09:21:51 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:50 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new compatible
Date: Wed, 23 Oct 2024 12:21:11 -0400
Message-Id: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add new compatible for imx95's CM7 with SOF.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..ab0d8e017965 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,15 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7-sof
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dram
+      - const: mailbox
 
   clocks:
     maxItems: 1
@@ -38,10 +47,8 @@ properties:
       Phandle to syscon block which provide access to System Reset Controller
 
   mbox-names:
-    items:
-      - const: tx
-      - const: rx
-      - const: rxdb
+    minItems: 1
+    maxItems: 4
 
   mboxes:
     description:
@@ -49,7 +56,7 @@ properties:
       List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
       (see mailbox/fsl,mu.yaml)
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   memory-region:
     description:
@@ -84,6 +91,10 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
 
@@ -114,6 +125,43 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-cm7-sof
+    then:
+      properties:
+        mboxes:
+          minItems: 4
+        mbox-names:
+          items:
+            - const: txdb0
+            - const: txdb1
+            - const: rxdb0
+            - const: rxdb1
+        memory-region:
+          maxItems: 1
+      required:
+        - reg
+        - reg-names
+        - mboxes
+        - mbox-names
+        - memory-region
+        - port
+    else:
+      properties:
+        reg: false
+        reg-names: false
+        mboxes:
+          maxItems: 3
+        mbox-names:
+          items:
+            - const: tx
+            - const: rx
+            - const: rxdb
+        port: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

