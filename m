Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8E315D47
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785112; cv=none; b=EOO+gKJNKHwujX/uv3R1DK9skBeltCZ5Ozex0PxsJH0slrA8yAQQC+XO4kF7pjmokSzeAcqJTVFQ4h1g9N4QTYy9rsKsclWw9qDEIfXA1eZft4krZ6bvoAHATw1l58zbXrsFoRA7fWCtF9LqQj/WEHbaDoTrZ/irTWCbu/VIko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785112; c=relaxed/simple;
	bh=EjjfiB9cBHAXSvDlgStQBwBw5SyzbG3m02xMWWjm2PU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IQiUcXEITTtpFtr0KolFBlsiJ1/MJu+lzb5Sg9AP/9KwwebLykiyR51w7BALkdh4sjblE/GwN/E6SrKM1YiW36cwk1334fMDYHKKTPtFoJPBp2km9TcSF6wT0Un8IUrSoP1fBkGlmWcZOqY+popTEIdkQZb8L7m03XuOMGSVrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7FNjJuk; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7FNjJuk"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so397363b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 10:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764785104; x=1765389904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8aUKLL0U4HpZQYQ2ev6PbF/etF9iGnebdLww9uoN2Q=;
        b=N7FNjJukA26CTj6MzDyUQowrglB4TIXAIBwLViVds8jxgzoGX4HHPv/uR35AnA+I3v
         WzPf8D/rWGf8ZGoCSQ5KpBEm5pCfEOViOF3HEMVcxiTBNwdvCy1/wkMg5UoggFdHcshX
         srPErQLGgdZylEPo6QT8esjWoSCg3XY4wUyT2EntCIb2Fj4M+7gQAL8Jbeg821+VLGl8
         QNSgEQo7mSYIETyki45C+LFFGnvREpRXLGTCGprWs5Oelb0LMm24VWfJ0bv8QM/QJWk2
         NE7FPBmMphe2JhUSHl2+7WYWgFYO7PxLfXTxSFxd4Q/Up/EtsVE+GzRYeCtbz7QBTmDm
         6/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785104; x=1765389904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8aUKLL0U4HpZQYQ2ev6PbF/etF9iGnebdLww9uoN2Q=;
        b=sRnOLlzPRAxJq/2Nd1NFsbY76XwqBUTPCRz6f5Ha/y6eM36ZJHhediKTLO73Kzzi5u
         XCa4NKsL4Vg3N/Ch5Yxmi0plC+XOcNqWmapcS0osneIYnLbBMhEsg3F3wmgBL5kOpBhu
         HGcGEBD5dPecY1Ynu/6Oz7/1aLrP4WmrRdgN0bWhudtFF6YDLEO/odoC0cu+e+gUoCL8
         UxhohjmckjAZK32n2ZkkQcLdBnlGOELTaiPPn8zqvc7Mf1sMF1uznUtG02GsyjMtN6P/
         vaSuFry2nQRsMT0UDBvQqOA5UuAI4rZQuEUPMQfvPZS4nCk05qWxFnOpMmV05tcQ6CsU
         7CbA==
X-Forwarded-Encrypted: i=1; AJvYcCUxSjX6VFDyo7aIdCWgvbvtpkvnxJvWx5bGWbzSnU1n9iQ9DBEmDD6QEBPRINA2cx2uFGG3MIlztGBFHuw1Tcxz@vger.kernel.org
X-Gm-Message-State: AOJu0YysW6vNUoDlSLh01iHdBVNrCCLWZsOpdR0hgODT26JWj55EGCgv
	cR4d7vMvdZ7Y/T26QL9IRIt2eaWqdJ3UWwUimx24Bk2QMoYMtN+m0YY+
X-Gm-Gg: ASbGnctUQW1JQewZ54HQqDaeWWE+2R9UMeyKFRsywZa9By0T2gReJ3g18RqGrgt+P3T
	pbzoIsMxkkdb2vrLHx5hMitGCOnxjtZPQCqmRrfVX/IXhKEDszcTnfIBNMBFlBuU4eH4hM6imu4
	po8+zNoldxuF8jYQfDKTKsMpViw0jexoAwXrabhJ7pA70v/0DWDOp4KFAYinfwweIpHv8Hd64/R
	37m395Pnj4LmgynqQUjlM22tZ2G6PLo5stgQ+8ePz26DCASVhvuUr+YY9oF4i6AefrllH1dpegB
	+fEo7mOdIT6G3le0vBBKCKxrC605aT5sFURUWJGDwm5j27VB/PCfCsMNt00s6LBSwgFhC2ekK9v
	XvkFkVDRs8KA1wCG2f3k4T7vtza6qMIOJ+1oxQE2jBr86l+Xt631BtuqoHzzmpVPvT2mv6UCtZG
	Ez6EVkgWmkNVgfCuEzKPjjfdeOOP5/ZQ==
X-Google-Smtp-Source: AGHT+IFEixLGV3A8+6jlL7a/8Uv2OMwWRqulw8eWOs24wopjQE6qdYvBYZM9hQQi+wS8cPkdVKqjPA==
X-Received: by 2002:a05:6a20:3944:b0:342:1265:158f with SMTP id adf61e73a8af0-3640387a27bmr191416637.51.1764785103491;
        Wed, 03 Dec 2025 10:05:03 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b68367sm21135011b3a.12.2025.12.03.10.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:05:03 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: remoteproc: Fix dead link to Keystone DSP GPIO binding
Date: Wed,  3 Dec 2025 23:33:37 +0530
Message-Id: <20251203180337.50831-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old text binding 'gpio-dsp-keystone.txt' was replaced by a DT schema in
commit aff0a1701b020c8e6b172f28828fd4f3e6eed41a
("dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema").

Update the reference to point to the new file.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index 463a97c11eff..91f0a3b0c0b2 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -66,7 +66,7 @@ The following are the mandatory properties:
 - kick-gpios: 		Should specify the gpio device needed for the virtio IPC
 			stack. This will be used to interrupt the remote processor.
 			The gpio device to be used is as per the bindings in,
-			Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
+			Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
 
 SoC-specific Required properties:
 ---------------------------------
-- 
2.34.1

