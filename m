Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4822615
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Aug 2024 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723390487; cv=none; b=Z60b6wybUmMZIJ29JsHYcI6zDNlEms+sOh7BvwBnDz7kjr1Bg6aps6Zfq7/30/8luEtNpsmjbQOI1Eo+fx2ZdhYTL6SH6O4w88Uv2bYCoJQPK6pHFCiSSsi5XgVAHBZPdgYzKxMIQBnrwup00io84rqW+uJzLwVqFFCpWVX9zvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723390487; c=relaxed/simple;
	bh=/1IErUjrGRfgokTB7myjq49LMHtkALojTPhMnZQ10TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2nAF8mpYc4oslfJYvAfUBjUwMuJJ8xfnb4d3abE9LlknScWoiiumh+67pR068S7Mu9X4/y9HgibqU3vuQbQT2O5RzpPgxN+rbF/HaxKmcz6XjQrFIWgpXFdTVxw5BmrlimxNfcABL5ehYlle2W1XMtjWfImwy+3qed440ucf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0oQ0+vg; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0oQ0+vg"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f1798eaee6so34067581fa.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Aug 2024 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723390483; x=1723995283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0DtWhSlXUfATpzkMixs1eIp2TMyzpsmPgL1CzoYoK0=;
        b=T0oQ0+vgEu4RDxzMMs5HH65Syi9wLRfSF2qHeCgTKNI5uH+wHTMklgxGYWAGAcTmvG
         XGJSdZ85nQU9B17WGv7PS44hEIpN4LXR7Lf8F5GkGebm/tHRkhcleFraf1JO8uleIBQs
         0dku3RE3OAneKtiNYnPG4EYMR6XVh91PmkJOr1XOpu9xYjwSiSshMvF+mYtlZGiDzz1L
         BSFzvWa4ZOiuEfetybXT8/CZC/1TWTbT+tdiMQtnQ5ERod++yRmZPVbTn0qffOV+xbAW
         xmRqus4QPc8vOwQRBwpE/7sia2Qk2Cyoh7UAHJ9riPRHQ8lNzYe5/RehlwAkJuMIASd4
         6CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723390483; x=1723995283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0DtWhSlXUfATpzkMixs1eIp2TMyzpsmPgL1CzoYoK0=;
        b=GY5hMIG/s/L+JXQ5RFhMIGgZEtmwkTpGiUn2yr9zxBi3ZQNwmzGzaV60Q1TY/ElcbV
         FcEEtVWPEZ+lmatsdru6qytUbFy1bIVrQcuLCeZfOIYZcVRMQWTvHfLjzWr/2UATWfPK
         v1F0qgZ6KV9dFqimZzwKoXor6OseO6XXmadLdtYnX7GNKBgYgms+9SOW5LqycouwmfQm
         h7H/Fvmq5hXDNJQ0cizQ+D0FbDGqIKWl/aRRn13n0KrzzugqHZgwED4unJrzISsyAS/F
         ZLDuzdN2u3gsMKRHC9LHaY0p8p1KYh/T06cPdKuFAnZo3Pg3giiRalGcyXVStYEad4ce
         tNHg==
X-Forwarded-Encrypted: i=1; AJvYcCXJUVuy3lPAbeT0d1qryVcuYLGB1/JjuwBe+iiG/UFlgz7YmWLBTxd2NtbkFC4j1oVKr3LEIFBrXTDi62VVqlw3p6bHDhsTkga3DOLpFVtqGA==
X-Gm-Message-State: AOJu0YyA8nPlkos0QeO3Q+poQGcrvZpgIrykSN74ej2K8tT+b6SZhs2g
	k00n5mlDergovRW6Tlk62JiTIBrGfHQUK7ftBfXvUu5TEiM+TA9jZeOuB3qfT90=
X-Google-Smtp-Source: AGHT+IEjtCXJrQfWFLvuJhoOjMVUW23DEOgZIPInR/kK2N8EKDLphE9zK1Mzzh0T+oYV0DVRW3R/ug==
X-Received: by 2002:a2e:b88b:0:b0:2ef:2c27:6680 with SMTP id 38308e7fff4ca-2f1a6ce8d4amr44289641fa.12.1723390482614;
        Sun, 11 Aug 2024 08:34:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c9ca1067sm43615145e9.1.2024.08.11.08.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:34:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Ben Levinsky <ben.levinsky@amd.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: xlnx,zynqmp-r5fss: add missing "additionalProperties" on child nodes
Date: Sun, 11 Aug 2024 17:34:38 +0200
Message-ID: <20240811153438.126457-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All nodes need an explicit additionalProperties or unevaluatedProperties
unless a $ref has one that's false.  Add missing additionalProperties
to fix dt_binding_check warning:

  xlnx,zynqmp-r5fss.yaml: ^r(.*)@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

Fixes: 9e1b2a0757d0 ("dt-bindings: remoteproc: Add Tightly Coupled Memory (TCM) bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
index 6f13da11f593..ee63c03949c9 100644
--- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
@@ -62,6 +62,7 @@ properties:
 patternProperties:
   "^r(.*)@[0-9a-f]+$":
     type: object
+    additionalProperties: false
     description: |
       The RPU is located in the Low Power Domain of the Processor Subsystem.
       Each processor includes separate L1 instruction and data caches and
-- 
2.43.0

