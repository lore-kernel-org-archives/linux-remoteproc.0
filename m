Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737585;
	b=nVtVpItLOXJprB1xgVM7ZNeBlm1Id+kS5ITT06KGCizlmy7qZDNVN0lq8XNc0idI76jn
	 e60Ni1t0vgnxONeCTlegCvIk96fykRzNWkh9rVh6Zf5+ZznN7zyFLkU1/4vmkCk7Lzb2n
	 QEDCK4ji1gRV7ZCxaf6rGancbeF0VBpGq55HyUalTOdSq5dW6F/WYSVsdFpnilybU8eTr
	 I5ijFBX7yCscxLcLrf3OIuZtSalSRoJk2abC2TJn+olyv5EGJ6flPjT5fXctCVboDINDB
	 RfAPm0iTeOieBEPk/FrY4lMkirPGM2fq67r/yizso/bxvJDctFc646sepuYoJwA1NCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
	b=gmxsP8p1xfU7t9TPLzxYo7Y8VTclc+8fNHjjeJKSykvQ+bQHshYFvxmshnsXbLWTw6jP
	 5H1IQOEaSBURQ6QTTseyIws0+wkAG9gPiBba56hnYthETSzBK7Wfa2b55N+2Jaxc+b5oZ
	 1+jG1ofbmuUc47rdc7pwvcpzWJif/xLZNSAMIaMBQaRexTs0aqzO6rTfDglU9q+rAq0gc
	 OhKVUf0pbz5tc1lfyz7Ae98iNKp7DVz/6NdlDdCn5teWYLDHNoRlH/IAJguKW1zZe5TsW
	 2Lk7iBQHSukuKCmxOKQBQ+Hh7Lf8G2td0PV9z6VaGAsD+67ATIBVYWKVd+iu1vC2Yaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F583606A321
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 06:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F583606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso252323f8f.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737584; x=1793342384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=K5gmrOYj3tl5gpqCrSw9ozcnETPEC4k8tihxf6zDQDJzO6W1ugLAFbGbsv9Cz/MxUB
         quIUfAE6oCPFSLcX8P+JtzAwqC/EvVQVqVldkQtMgEtTOx+hyvg8NvWOS4XYCf7ud8/o
         Gzc0esoT6mvjMChNOgbAm9m7/Zm3rnihd7W0X1kADDuHzZZYih0caal6tQPHJOejfhVK
         K2BbjC/G+1p6cfFAnupiIBsCBTQOgMBNzgIf/8rwbqnvo+qua43tmcZ9lsB9uE0vJbXz
         TBLYu0YNtvQan1lTxqxqkmOEetHMR1uVhpgkfELL7ASKGJziVeEfwDGBOoqAdY7h9Fsl
         950g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737584; x=1793342384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=atEIRJ7CPbN5eqErDSja9uONFPr4GvWjZxksmZHBjOp0eLFuQwZZcDG/9RvowzU+2a
         n8EP3GZ3cKyTkN5y0Q1D3QW7/jLxFu99qQzJgb3Vwtsy4zFgELT+yzl5Bul6JS/VLgmY
         J5j8EbAgriZLkkTly6iSuL0AnPGhMkDi8RXaaTywFA3om/lwchaR7N6eKB5+IsF+K9ei
         hIjq/8n1ZMZksflQaG9alYid036AQjvAJ00fLeJA7a/dfD8vGhfbVIN2qD+PUj4ksDQM
         w8q9YHl1zf4Sq/gFWzKVvrH9Rde7FC/ohGN/V2Wk6SH0GAc3p9qOua4SHMnMFdXQFGRu
         62gg==
X-Forwarded-Encrypted: i=1; AKwUvBwcqzJ+UIBJCsCtIj08IcXtWWg6/+gEYdo8Rn/yfcpGghXrTKxSaOsHoaYzynaz97CTwtR4BRCbMUwWoMhCbntZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJfkizi62ohM6xICrN7ySy1GWu8bohiHHI/Wqg3q5Yc4hj+ts/I
	eRDkgZkiRw0dUL0Tg3HlXDwim3010sfZ+BYb7VXD45GZdFh2jKjxHAtCEQT212YNBQs=
X-Gm-Gg: AYBFou3zD2ANSeoAwAOamOxXmEILfMAQmJqSJU0sYlSeFN0dUstUu41Wlr1Dih9moYU
	7+p2CexSGsN55mwjELnEqaI7uK3EyFtrvHCwSsaGnSDTapQmV5IeljDmc/LKO3ubaENguxWDPCc
	y2zH/zeUbxDWnawwvY9N6Ky9z0i/MW0l1jPsAQtYMABnsNjqPa+Osb44KfPWv7uStPaawTqojn/
	nMTkci7nsMGL2m2+fQRowvU8jsjRflGQlroz2G3AeWgXwZYUlEmLhIwYJCESR7q7TQfxZUD2uqP
	Wn6N47PGfjbxrFZtiyHpGKlKGUOCPHvStTwlVxRcqLHb+/QAMyPkqbCiZumjBZzu9jFW2/dvgIr
	1Xoo2QSA0o3JjvxppeWn80jXSFWRcOdKFxYPUI/zSIdi3IyT9DdJxG+7DcEGnyoA67N7zn6Rsae
	sZ0DhXmoZGgkCluyiCKuWrkXYOp5u738Ag/ahUo413hZJAqwCwMEBIYAoxbohq8z9z0U8Kv5nen
	XFKtdxWmXpzUPnaoqKg3PcuWlYomrZeJ88EiGFBiQMfzVCElIrB8Fznn5aCHwj7B/nRtrQLICvT
	ki2p9cLMn1D3x1A+IJU5Aq++R9jBEz6gWLBiROQAAGk0QXUrcUm1VyvzbsI+Rt9Q2AOjfhgYInm
	NEqE=
X-Received: by 2002:a05:6000:15d9:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e385b9322mr977703f8f.47.1792737583628;
        Thu, 22 Oct 2026 23:39:43 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:42 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:27 +0200
Subject: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Allow specifying a second sub-mailbox that could be used by the firmware
in addition to the first one, which is taken by remoteproc.

This is required by firmware that doesn't use rpmsg for their
communication with the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 278b88b7f906..d6319c8e96f8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -51,10 +51,12 @@ properties:
 
   mboxes:
     description: |
-      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
-      communication with the remote processor. This property should match
-      with the sub-mailbox node used in the firmware image.
-    maxItems: 1
+      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
+      communication with the remote processor. The first is the one the
+      remoteproc core uses and should match the sub-mailbox node used in the
+      firmware image. The second is optional.
+    minItems: 1
+    maxItems: 2
 
   memory-region:
     minItems: 2

-- 
2.54.0

