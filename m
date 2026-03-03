Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E8B48125C
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550836; cv=none; b=UxvsDeXlaXzkftUCqe3Q0NPIqwe2/4gK6nzxzv4PaeAJH347JPJppUK13BZEWBKZ2fMnrjNHbmxq88yX0wMt0fhZ6H4eaUnQDrWHh517jsjik+WsMHU9jzWMdhRFWMiWjWBKpKUzzB0CgQwsMx57jyi3FiosjuBliTNdVvCENaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550836; c=relaxed/simple;
	bh=7poRYmK/5KpoW8OLZDL7FezdSS67YOKkI1mZwzix0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cI/U3v9ZDbiBKFtRzFGXDX23wPdVPdsfMnZ+hNKCG/+U82/QfKAlwkoKolwR1+r1TGMr7+B2lbFzvU7+8yLHOaIOI0cH2Fxyl4mtqPI9lcGo0VmY9bIJCKxap7zCN5n/k6S3uGwLOJZvDW/eCTfatGsmbSJcmW7rCGkyx02Nmu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1jFSLUl7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1jFSLUl7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso1905536f8f.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 07:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550833; x=1773155633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y94JqxBgzgD92hSkgY727rzOxGmI4MJQz+PRihecbas=;
        b=1jFSLUl7skLijTkeqR+OG/Zphm0kp9hMTqoU7Rbnhxf0DpXmJacyyllmZd4x9Ghwoy
         mjPmkFmQUUn1m9ZQaCuAqadBASrwmuWjwBVruWsDgbSd27zGLTDc72DiJsiN6JdLeOy7
         5kRpKnWESNuNavCPKrD3c6uJ95r+qE3pn9gGsHNNFH5zBdXuiAa9EodL3ebPwA9l4PYF
         3l39JEbQXcq32sxvA5r26L1Dcr2cwugle3BGxW7dRhzltDDylNE4DXDIlcWDbUvwL/WS
         vjhYhNxYuaYWe5MP5HDnmab8PkiP8UhQkoNvZHJIeDofazcrpIfbistFcU6NxXk3/gyZ
         w8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550833; x=1773155633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y94JqxBgzgD92hSkgY727rzOxGmI4MJQz+PRihecbas=;
        b=nHWSDYLobchsT6ujWrRzy4pICN6xrBsFQ83+tyZoeA8hM4QsPEZOz0AWUjCOcAqTkW
         NfAxGXzNIPOMmisY/fSwOKuIVKYMo4T2k1pWGm77+LYbnr9TKPyTh0uehZydhI20WP76
         CHYgZL/ajemfea/GSXjw/6+eOyERkafw+LSUq77MmFi37M5nXVCrPgP4H4wbVaJ2lail
         UXgH03Cbi/+M3AnMaO0UnwP+EviLyOJK7X2DSbYQH3Owm1oSB0llkigi2x+5G5+FCceb
         BtSCLyWRQOmpAAE7K4AevL6hgC3WtXt7aEIApfaga5ArOsgUOrbw7ureMXLiqS3sIQZu
         ZpvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHA+RWOzS90vu0wm6GoYrLHi2JpWvoN7YuN5F1HJpO8gypm7I9CyREWkf9RhCvRHjMwIOVSy/3RM75y54wrvWJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+FJ1o/U/v8FzEBIF4FOtRbi7QDAjiMu86KyYBEMy87zSu1T8/
	keCsCTP5Ip+AiGX+G7ABwSZ3TndVBrQLbmn5EljTJgot52lbHj70XiHglZA+t9EbuhU=
X-Gm-Gg: ATEYQzw1/X4Sg8z/NZEAlmOqQgYGUb9jNUXkKve1gGr8Qb+BQ+mrvZKHzyycrd+MqXQ
	IXYX/GwhvyriZx+yulhSEbGMMKz2bDsEFknx3qCcVqyTYPQozelJg/iB+1+tuNdeB64XkcVijik
	3Kw8DbsyXqjXmF+UBzodGzWZeWPCl53z1caQu0tavH3fyO1YBGNS1ZEJ3sozoyQO/3iYTHD/gqp
	aYH8f2GXCYo6GHXOEGvTWXxVahf5EY3/tsxyfCaq5oCvGofGtdBUtl8gn/LiHi8rsQRcFjOIm9m
	VIefSB3N6kaLM6NmT8y1eDauLWtRa9LxQcKDHrSdsiKeqOVdeJk7fjzzuH9TXM8gjyp9mJlINih
	5CNM7MVUDfL3zpJy6nPb/PavLy4Q4VOqcN6sfnhtKMijLlEJinPgqxZu8AcrT867OuBkHgUtBie
	XDOAD5tdQ+h2iOz3WnO1tnaP8rfPranqo=
X-Received: by 2002:adf:ee4c:0:b0:439:bfaa:ed99 with SMTP id ffacd0b85a97d-439bfaaf0abmr5088126f8f.44.1772550833464;
        Tue, 03 Mar 2026 07:13:53 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm4297212f8f.19.2026.03.03.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:52 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:00 +0100
Subject: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=msp@baylibre.com;
 h=from:subject:message-id; bh=7poRYmK/5KpoW8OLZDL7FezdSS67YOKkI1mZwzix0Ro=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv6ac/3u07l/DfFMVi+86QkvOP+i6+7x0XeeBWoH9t
 ooTfSbVd5SyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEHJ8w/OHvN4r62LdjRqb0
 ocTt/9dMbYhRkPogG1MYb/T84LuertkM/z01m2Oc84OtLuxRXCK7wO6WTMzZ/21+rnUuxz5+ZTw
 iywgA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add names to the memory-region-names for easier idenfitication of memory
regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec7fcabc7c60b8b286c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -182,6 +182,25 @@ patternProperties:
           - description: DM RM/PM trace and firmware code/data
         additionalItems: true
 
+      memory-region-names:
+        description: |
+          Optional names for the memory regions specified in the memory-region
+          property.
+        oneOf:
+          - description: Basic configuration with DMA and firmware regions
+            items:
+              - const: dma
+              - const: firmware
+
+          - description: Extended LPM configuration with split memory regions
+            items:
+              - const: dma
+              - const: ipc
+              - const: lpm-stub
+              - const: lpm-metadata
+              - const: lpm-context
+              - const: dm-firmware
+
 # Optional properties:
 # --------------------
 # The following properties are optional properties for each of the R5F cores:

-- 
2.51.0

