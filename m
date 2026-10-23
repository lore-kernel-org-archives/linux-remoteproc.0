Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737589;
	b=w0SUXC54mL7ObldqqEoZJxqpaq3lMQb5Z2gvxslvNDzwc5E5GQS+NcQQUJ0llTRnBjGu
	 ZNVJQkehz0ea4Jh7xc1X3b6C0ch6pvppvGkOyVuWcAGHj37jzzqouuFg2Y0dn2gxWev1+
	 LRZBiMw2i39xE00T+4ssVW09uJcZd+Ph7L2ns/zhjnBdARuhTbGsSgzptNshVV8nX7lrz
	 BTlZiknxxP1Qxe5/BYwshP4oS16mZN3w2GlqLlrU0lehjcVWojetNY+dSqYY65LOQcYwV
	 n8jFNRgIZUturUDBvfQ3D2wZZnkDggMy0NndCaIN6tpjhicr5SIpluXh/BLJtgixCKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
	b=ZM0cqQYefLocnXlK854XHQnsjPE9jWS+0HQfOzS/brZK5SHwEuliHNuQJUfaHwoCPZK1
	 qd/iIa1xbBO6OUdi0DKc/d8BNi9iCmEjseMlzKwntfcFtUoX37dKn3reIR9gTAc/51Pp5
	 niphdwWtYYla4FGsGJMJ5+6vqiOzbyn9fClVn7GaSFMG4r042ulkXMzlD4YE6lG2mApBG
	 O+ICz16yZ3CnMJ5WfnJ6m99tbtbM01PPHpJhyFNgYS4TNdxaoDQaU3IFAJGmrCbFo9ffT
	 TT+hu1XuqmPLLLkFkxT/ixc6qk4f77Jkf+sqstt4PPo0Wojpq6c3mgqftAGMXYsZgSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46207606A327
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 06:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46207606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so216731f8f.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737587; x=1793342387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=dTYQCezJmgcg9GGfQwV8y0d2iLfg6yCWGHqDKMyjsr8yZxOhyUsBMSf/ZNFgwODWF7
         Ca65GerJrzoQMUWzaApQ6FsH021ecFKPP84Vo4xTo6/rpTav2Td2W5SPBRlg3hXGl1px
         xP9Z4zO5uXlxiArcnHL2bAJmJPkPMjMl648DPWqdP90u701pWOiEyM5G/1muxUzPFpq2
         GELahv1hSqryhdLHy5UgrSQvCjuip2O+DMxqQdyrDLqCzm8Xny5XxFUUYZp9tLCW119v
         aS17giMu5xehA1z1L3jBEqcI0NZSj+ukea/DASddTVYuvZWF7/0CR1CzHU/29htSAxpq
         Vazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737587; x=1793342387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=XYhZ392p9EGuAzvCnJSD8cbqEYgGv9MJfEh4+W3raJ1AwlmAXKytUGUfHsgJpEU4T+
         ha0Tj0HDNbp0IpGWwW6+lSlQmOCLa7FwNYG7QOKNxruUixKNYKQHWeOExsmBhEmKmhmu
         J+VFBLRbihD9p6eANoB6dlN1mo488rRrht26nXdAvVk0gmmNUPRYHbVc/7/w+3/rye+5
         GDoOk5KZIxtyu0NFKVKm48NJhGt/OrUCfg8UmNkYtCewcg6bbZ9S233spLHNdzbBtKfk
         MbKh/l21z6jE61Vai37Wy6xqMHIvcNrvaBEW1dRRRNe99JnWEGRRSS17oqrQiIuyVPqI
         bG1w==
X-Forwarded-Encrypted: i=1; AKwUvBzSojN0Dz84PyRdXAcZptWqUgzpjx2oFVoY+l0NVIotQJy6wcDTWlf50ej69BdcslhRuLkRCdZOKacW8VBocUMd@vger.kernel.org
X-Gm-Message-State: AFq9FYJhqGiPD6+PnHL0Fy8Z7N3MjgM+5g9cfYqEzvzuWPp0MsKu6I1z
	OokoPctaMuxazsz/oBtOaUAwiJ9B0DUb0L3AGHff7zT70skBRMCvOiNm
X-Gm-Gg: AYBFou2y0AvWUuAS3DyHxnPzdruneGm3/2mxRsV2/3MwjLqKietK2Unb1IxJ8axIEb0
	8/OcsKyElRyuSaeQXl9qR2CNKpaIQ/TRO+lMVF32BqtdM8qRwTKjmjhxvz/JmqmKVsC3fZ7Wxd6
	z3WOgESoLlA5Zjfr8DjGEaZ0z9GLLABuT+dxbwovWRnbsNEyDUbhJsyV75Np2GAne5hv6suzAN0
	+lNS+VVQtvvJkT8U1osQa+1Bo/Ua/X0rprH8rFFysh1RRQ28gHfXJT/joB4lhtmtgl7X/vwIjvD
	7DYZidcrGSwh0Cm8RMYKHwHnrjUCK/S+FRFRGQxq8AOfkrE41qhLRxV9OO/YwudQ8COtM5eaUjo
	e0P04buFS2R2xvWmrg8vUQryNK64GusA1Xrl8VzPz+DjBBlHbnbCWDe/Oh8pY6IAs52GcV3sCSb
	cGgiRwXIeQG0F9UeI7l8iuIUOCOf/BH/btlVNW2cfVZwIXQ5hH6kArmAAt5/QIDwGq01z/I+sX7
	fVizwFzQ1S66uOjGgL8EAHwM/9l1GRKTXaApMQpj5IoJVjiDl9XXCDGh/7HuwcIykN6InktDduZ
	6BfdbFq7WLegpVdRVtfueb71okKdRORoQfKQPu8uHYl/UyIgnLKobnN/PCv5LGWrOi8bBPM9gcw
	Rw/I=
X-Received: by 2002:a05:6000:41c9:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e384e4205mr1725429f8f.0.1792737586551;
        Thu, 22 Oct 2026 23:39:46 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:28 +0200
Subject: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
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
Message-Id: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
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

A firmware may drive the core's timers, which need their power domains
held; the remoteproc driver does not hold them, so let the DSP node
reference them for a driver that attaches to the running core to hold.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index d6319c8e96f8..80eaef0a19b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -76,6 +76,23 @@ properties:
 # Optional properties:
 # --------------------
 
+  power-domains:
+    description: |
+      Power domains of the SoC timers the running firmware ticks on and
+      times its work out with. The firmware programs these timers itself
+      and makes no power request for them, and the timers' own nodes are
+      reserved for it, so nothing else requests their power; a client
+      driver of the firmware holds them on while it drives the processor.
+      The processor's own power is managed through ti,sci-dev-id, not here.
+    items:
+      - description: power domain of the first timer
+      - description: power domain of the second timer
+
+  power-domain-names:
+    items:
+      - const: timer1
+      - const: timer2
+
   sram:
     minItems: 1
     maxItems: 4

-- 
2.54.0

