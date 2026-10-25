Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902100;
	b=gpED8gwWmW4Da61XN0EPIZi4kW2D7Voq3VNLsgMJuL80pQeoLetZAjM+toHJsgXEGnON
	 22OYnNg3adsMCN9G83XZfKuzAC8i25qSyq9KnUe5G67tr9MAp2182CRgDjigqJ06HyTNZ
	 SOrkZGFxdPrfewiqko+QQpqUhA139ZPudf22jxIZz4+enFsLWdnV3G5dyEOhE+8ZykL2F
	 U4mz6j9ieBtk97IMRIBk0TdSP4mCTfGm2C/FWBeHx0tbKAqr/XlRRqtkKy/g/XIKctNNl
	 6lLekn3lY0MNEVUOMZpDl7BYNKI8K7MqnaCMK3z0q1xIgbkkF2EVlu3fLWP0MKl34rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sQpV73Kcs4GI5xDw4C4m9SV0di9xYR8vy4GAZW0RqrE=;
	b=Ov+qnlCf+F7GItZEey4KxJctBD1Fc9mZohgDL2WFqosuqT03IoI2fJ4JN6DZcr4sbD7N
	 /kdInSLhR5rUYbq9JdT6PegMz74ncb0BQJnWJFcvP2TIX5VzE+GxDu9VQlGfawdMjNEk+
	 nuZxbDBxVPrbIvDz3TSqrkjoR2EFI7VSKCth122pUbklqKT0qxAdOYywwDdcfGrKZ+42i
	 oX3iddLXrWH2KHBnQRz+g+Vuv9hR1aikD8kb68ig7Lr6nk0CHHmSotamvr797X/F1XS8a
	 S5D3EuDb42lCmuqqq7/AVfbMY5rwMKE2o2DRIjHiVeIFhW+kZ5xBtxQ7li04RCgqmwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbAJ2kgg;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34001606A31B
	for <linux-remoteproc@vger.kernel.org>; Sun, 25 Oct 2026 04:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34001606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbAJ2kgg
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-156cbe59524so1146339c88.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 24 Oct 2026 21:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792902099; x=1793506899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQpV73Kcs4GI5xDw4C4m9SV0di9xYR8vy4GAZW0RqrE=;
        b=BbAJ2kggBXisKSYtQNvdmndB54XQ0cgBU3M8e5krx9TxDZ1vw2AH8FlDfRs3kQMra6
         4YOVd4xYXK6+NJ/apZB6S0E4yeta0IAt6Kq/DZuAdlXxgg81KTNBtX3TMT66zTYtRqat
         O3JoLVsmVMj3TJGPes5NDcUJ5P8MZbS4BTxhYVbLkK5d16WCE4F418uF2SbXdHQLmtfT
         8Vwt4ChIRw24QRz7eEjQXw4AV/1fUlkD2tdd+3KeShqjcFdPHz4G+SvkQpQwWvCnA+O6
         Vchh8ZgbXj+Hsc56Pq7rs1qkISVA8N2kisRuR06d29gFbMiq5J4BtE2KjAcCJKVq9FH4
         1fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792902099; x=1793506899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQpV73Kcs4GI5xDw4C4m9SV0di9xYR8vy4GAZW0RqrE=;
        b=pAj5M0Zv0RP35gPkjSdTfnqUI1ZCsT4BjH7Oxw/FTrAZSRG34Wg8dLsPRsAbn+e9LJ
         6LrGbeSRMNOI3pjVxUiIV0kW5FFP+fZsan7ASMbkYGrRrDqHHYPD7BFVBOKPKUVGkM91
         KkVkBbHYz6w9N/+5wqQyOCrQt+ksRYaSppmTo/bitdNFH9M8L8748Sg9VHB9tVqQ8Qhs
         dudTnHn/wVvSJXn97V5LdRPvzXUmLPFdmPSndZ/Q2ez626pTtyK/m30SpGSSDOijwJNk
         HggFChGtVDqWhdzeeV0kE1xLG6Dm6Cv2ck4YTUMOoObyLx17R26PFS8c8sGsBE2PzpUp
         WjLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLQNCjQ0ODH3/mHCvYxU+9vE8jr+YTtEUhvRetT2LCqeEw+f+rIJfCxYsZk9C4I2f8lwr9qpLvYqYEKPSpnwJl@vger.kernel.org
X-Gm-Message-State: AFq9FYL/EoY2Dl5nj9x+38U6KyMprI2HbbXmCE/iZhoekWMm3g+PbOQf
	lrMxBuqrzvJxjI8x1GX5TUehOJ815Hc1dDBlGROukDiUal5wf1Hm2k05
X-Gm-Gg: AYBFou1y/AGlpaK2OIaGKYZyo3I4iF9P1i/Y+9MSEKfAfeWcpc+eT/Ykfpq8DDDD4mx
	OvOApVwX7mppZqsI36DHWI52LFS/2i8AiigprN3L4CtxOca6A9py8kS2tH2tK/OwlKOxZxPlgBk
	FM0VBbrgYJBWfr1yLJdEwA8y4RgGk9QTrXGDrrJQrfgU7bTdYr7SvAsb0pKO/VnJjNRT9X0yvfQ
	5DC7bo/biBBCD8MNJ9L2AYPBZ+xa/qGBlwgo/AJTQuSruin0C4mAmfHsyxkddFu8Q1yxPoQi1yg
	ba14PYvYOwxp1DzxoM6dZ1W9yoXqTLwvRzfkHoIBTqRiPpXUQEk+R4++v4uF6Ih2FETACbpXYAQ
	kkoWskP1Btf/fbcV9ORGDPBHgxLU+OTAPIgJ6rWkn9cnVVIVC49+vEyNXwOkBW5EQV5j+sa2jWD
	uNuBUexf7+b1pxV9OarNB+aR0//PfI4ATXmyoLEakNHToyJe5cQ0BVi6nxPtBCY1FYdn38h9d1k
	o9vIr9n8maJM6TOU260O5J4E8he5tilwfz6Mwd2AmHS9rRw6WjNF+qa09RAWen3TbmQaoioniq2
	OJ64bPDD2FLAc6RLIkt9lQ==
X-Received: by 2002:a05:7022:1e13:b0:143:271a:308 with SMTP id a92af1059eb24-1993f6d7a1bmr4400139c88.46.1792902099202;
        Sat, 24 Oct 2026 21:21:39 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm14037825c88.11.2026.10.24.21.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:21:38 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manikanta.mylavarapu@oss.qualcomm.com,
	varadarajan.narayanan@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/2] remoteproc: qcom: wcss-sec: add IPQ8074 with a separate M3 image
Date: Sat, 24 Oct 2026 21:20:58 -0700
Message-ID: <20261025042100.1356088-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds IPQ8074 to the WCSS secure PIL driver, on top of v14 of
"Add new driver for WCSS secure PIL loading":
https://lore.kernel.org/all/20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com/

IPQ8074 needs the PRNG AHB clock, and its firmware ships the M3 image
separately from Q6 with its own load address. On the board I have, the
M3 image goes into its own reserved region with board data between the
two. Patch 1 lets IPQ8074 name its regions "q6" and "m3" and give a
second firmware name; patch 2 loads M3 into that region before the
authenticated Q6 image. Without memory-region-names nothing changes for
any compatible.

Testing:
- dt_binding_check (dtschema 2026.9) passes; the schema also rejects
  named regions on other compatibles and a named IPQ8074 node with only
  one region or one firmware name.
- arm64 W=1 build of the driver as a module, no warnings.
- Not booted in this form. The equivalent change on OpenWrt's earlier
  copy of this driver has run on every boot of a Netgear RAX120 v1
  (IPQ8074 hw1.0, WLAN.HK.2.0-01792-QCAHKSWPL_SILICONZ-1).

Varadarajan, would you rather fold this into your series, or should I
resend it once v14 is merged? I am happy to test either way on that
board.

This work was developed with AI assistance (Assisted-by tags on each
patch).

John Macias (2):
  dt-bindings: remoteproc: qcom: wcss-sec: add IPQ8074
  remoteproc: qcom: wcss-sec: add IPQ8074 support

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 96 ++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 97 ++++++++++++++++++-
 2 files changed, 184 insertions(+), 9 deletions(-)

-- 
2.47.3

