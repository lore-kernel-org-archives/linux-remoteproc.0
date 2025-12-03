Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03631A7E3
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781706; cv=none; b=mgr7gbCSUEpGPT4UqhWmByBFt64WmXBkCBGNynZtlExuC6lV8TBSHi1qAl5V7EJDT5bcOr/A/54IHGeYTcvL23csrtXmNBhIR+tI/MJ5lkLDt62d8gEsWcqHE+2d/WQ2yUeZ+hLkcx1azgHPjE1mg1itpCnk2UdGvV2tOpEWnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781706; c=relaxed/simple;
	bh=xXnEx3PQpfAGB++vb471mTrg+QrHjgJwqcNS6ZzHczI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n3MFjXJbySiRLrqiG+XgjpYTU7tUhILVMCO+m+zDiuCLm7JrjXw++ZOs3N6eHRC+TTXchlTv3k30WVAz1L9V8pFSG4QoQ5y8wKYxiomlnhWri0xgOlyCJ5CXSo/uxsNRFpslfPqhLFrk46ZjOYjNFiyOMOukErn2TknIF+cRJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dce7Gp1O; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dce7Gp1O"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3438231df5fso8195291a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 09:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764781704; x=1765386504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBJFyu68J6Bp7h4JVdx9Vv54SkiKMXxF2cUFb5Z/EiQ=;
        b=Dce7Gp1OIhNcUOnqMZ3DySoUxw3d+1g60NhCmLB1drzm3kVwZ68+OQuMrtmJCqlAh0
         Q3k3xleBWegFM6x//fFSmDVFLw17Cl/e25R/P0lpNhI15ED0MgSEGzBpo6g5/rcYwZLm
         BE0aI3vlvd3hw2iPB+KSMh/5mtTa+H6H++m955Nfv/w7sShnm24VjFiZxYVPBGiE383h
         +fN9fCYOlYSygx+BwY7gLWhzgzdyqzKl+ECExQsa7pQvT18okaTj7f2hPNEZjd7hZmII
         QU7YnhHX/Kkv4h0LzigXpes7dsd8Tj6Tse8InMXy68kfUkFN+wtzGJtKNqA0tt+WQbku
         ciXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764781704; x=1765386504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBJFyu68J6Bp7h4JVdx9Vv54SkiKMXxF2cUFb5Z/EiQ=;
        b=rtCAyD6hVz+SnjRBrKksOkEoROdoELkkGz0X2w1UqF+sxqDttN4SWefbbkjEcMbpIv
         OBke/uFS6y247v63ocBRzO69ZQ0jeh87kAOratPc/EfBCy9nG44xCNoyvm5dlIwTFGy6
         zhoXirIYkyUlO05Pc9nTcKZmMfjxR9SgJ6bWZHZBLcb5IvzQ9CEpBvwB7ET05aoxbQHH
         YG3Raihfc1aIfyKGcbZ6nHWgZhnoQoTlwewyCskwfn7qH+pGIy+UmtK8z7zlN57YbENl
         6m7xuH82VRhc83ZBpAvtvucw/J8r8/e67sFC+BEyjxL1lVZoJwTetWLSgsd3QSefBUc4
         p8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW37D35avlxX+69BWUzobxizadBvDwcRvsJteNBnutOgvqPO3vudfe2UFcB0VfAnvXU3JFU7nTSzJniQWofv8B7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf4XyTQHgW2wIc5B2kIWMv2eqXc5gZW78sSxwbWMh/rIeXQrMY
	4rza7pKiA1jhxW3qIR16PKDDBKRV+Z2FFmUigx/qj+YdBEBPDuFpoW9T
X-Gm-Gg: ASbGncuPcQy02sGaZ+9SoAFIy4jZYeiKT3wX+rtm2STTIYilhbNe58DGPgTK3X+YYrl
	XN4eewSpcy7vv7+n3UkA+NIzwPnq2LT0jrR0U9ZsaN05CRCmtQgOJ2fER9dNMgoOlk4HCSPfY0w
	Oei4jH9SDlaZOVbCboUF417Ehe2J15lREkBOCqtebOH0c/UFrHYM8QOQgDSAeT06Fi1cCwd8LJa
	0Spt7UH7tu/nT2axRwUEcYTQP0LtcBxK8TjLbtT1FDRAI1GCm2JL/nWBIH8eqQPNGhDgWDysfw6
	tz1cvj0c4j3Sq656X1OxJ/PSkbvqchFRQPsMhLGJmExcIHKsXxcaZ6XQOAf7etpPZ8Q6R4/XTAc
	mB/jGnTHb+dYIoxShhb5+Blny51LzprB9Vi4IcaiJ+lmu4sfholTwWI2mOcLM0ystxLyrH5lse6
	OsuCnY/uNwy5pNKO/GWEw=
X-Google-Smtp-Source: AGHT+IEOFPrAaqKqsqkA6fVb5DGAdtJMcHhJEEPr2VDB+dUBMUwJgpBspXc6JakMLmnmqpY4L4OeTg==
X-Received: by 2002:a17:90b:5483:b0:341:194:5e82 with SMTP id 98e67ed59e1d1-34912844db6mr3091094a91.30.1764781702242;
        Wed, 03 Dec 2025 09:08:22 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-349212be927sm2144835a91.4.2025.12.03.09.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:08:21 -0800 (PST)
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
Subject: [PATCH] Documentation: remoteproc: fix deadlink
Date: Wed,  3 Dec 2025 22:37:02 +0530
Message-Id: <20251203170702.42769-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding file 'gpio-dsp-keystone.txt' has been converted to a DT schema.
The current binding is located at:

    Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml

This change was made in https://lore.kernel.org/all/20250714202850.3011952-1-robh@kernel.org/
and merged in aff0a1701b020c8e6b172f28828fd4f3e6eed41a

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

