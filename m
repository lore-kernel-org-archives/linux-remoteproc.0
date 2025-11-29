Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8F182B7
	for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379935; cv=none; b=UuCP8hw8bcd/6E37uJOCvvh834y7tl+yN7o1S1Qe+8WxHkgvxsndmYRBjFKOQENf9a5vToGwTciGx/2zWpbkGXTlyK9lYE1kXyeJUBx8025z9zfEnng5ZjfEEwXdWMcbgjZDgsp2sCXTkPoZN4rnM7sMO17tWDPCVTRBl3qm1qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379935; c=relaxed/simple;
	bh=vdmaUHccWmDVYP5bDCaCaO3XBcciiahtVTW92w0BONc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjX1YH+NiyXasV2svueO+4Y1K8TvK0BuYpdOTQPGskHcMbgLYzq0itvuve7iBPsZ+UFMq48UXF81LETHBRrt3Pb3XMgdNNN1BRugnww7ROY9G/m20PV2di6iu8znfn2KjniEkscqVvC4EXyGsrD64eV1tH8I1DWMvP0sI+BxPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WenNRmBT; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WenNRmBT"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c75dd36b1bso1478210a34.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 17:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764379933; x=1764984733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7E/BBPbYBPXOHpVXq81S10jr7hBzzUHbxEs5MGnVlk=;
        b=WenNRmBTYBClOPDBvdjMCVE68wRzVLylbYw2ZtKt56q9YGaeg4G8kl4/XyuItRHgSd
         oH0tKVlwjPDe7bpaDq8djmp5N7A0KuLAH3DMMDV2FaR0vcOTMOXZfe6jeFsh4LWKhfn3
         f8lT8OP2kSjbNlreIKk624myUaP1oxUEn8unnaUhyGCPxsVvEPdA7IoAFDEe55CqU9s1
         rFRHEr+qnztIejvK+ssP2GwVLAFS0xebfNM2oAXrTpFU/sXDVVV0Kj89VxcIFDAi7ETs
         /fgpkSx3V/CPvN0Dt6SPuE5H4ttNzp0rs0J4nlm+HLIa+kyuDq/B3OApt9nXa9zpjeio
         lJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379933; x=1764984733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7E/BBPbYBPXOHpVXq81S10jr7hBzzUHbxEs5MGnVlk=;
        b=OE6VahLqSGrpm19qWB8J+Zl7auPrmPZCzpelNRA/HdR9D/+3QRH1ICp9LuLFJNW89U
         AvQTt2GRNw/YgPgjmXtYBBNUMYImVSCf8GF7l0iPjNOEsanaE9KYkhTdh/LOETuFY+NY
         4bxEmnHw2aOXJHQUw91M26W0R2UdU2CDOF/gkTTsk0YHFZ23S0OEJH+Sh/ZXADi426Qz
         nhyykglqcOmrYe4nmqBsIaUHiABdPbimA5mpOxrviiVciyOT3vucC7taLgV7G4fDvlV5
         od/qgQWVkUaUwCgEkp4f2G4nFjtRIClPezpAEvPnBrkz/Wg9ni2YBVkwS/8ENc1fLgfU
         3+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsffSmXbviztt2jDOseju8GKB5FBGCLzXhwpziT5r0el/5Q6mkSDZ4b+qCv0qWpDra8kXrSUaWavDFcCbgrQdJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh52yAGF+d/ovvof4vv9tADITKOk77gwkIMWITEtShqT0k3sDg
	psCJ+uyUX944fNQIFqtMo4HnjZmgg0MrtoU3QEzm9Q5C+1f4sx8+jO+0ggaLjg==
X-Gm-Gg: ASbGncum7qLRGR14IcmRXrj96evx6KyedVwaSQzAchWxzqORMqBuYtcti80wPuTKUBh
	HNydFcCZnSDi2/XYSXi9Ay5Rzoc1mDatAwjXSKiLCHa+hztMiDMYNymFxmKzyj7yl9BAZJhpF0Y
	JW7V9D4aXgTUAiJIbqbOdfjlGH8IUmxniI/6EOB9x7UjSW9NEjva5LUAB3voxh8UI5P/Kq4+PwF
	ko8OHXRyHf5KtnLPGvM/SZc5TsbRD7QHdwdUY0rc9EyL8Km+kfsBERTDChr9AMRkzo/nyFweY8+
	DyM7pK2710zGN2rd9dX0yq4e0AW5NodLB+mj8JqFwJanTR8cmOa0vi1NCsySZp9Sq+y9U4a5XUe
	PjBtgP29SgXrPRzZNOXXDiC3o/bDJXj87qoO80Xwf4zeX8Zr1w6VER4K8C7c9trVbnMj9bqg8/o
	23YQx2ICxQhIaPfs7yW6QWbScx/NVy2lrml6yFynz6/K5aKxz6bqlkc8gDejycG8UfgddAJYL8Q
	gY3REwjpftmuA2cj+Yt7Jf4dlPk
X-Google-Smtp-Source: AGHT+IGmG/wIFDhhCxEyeeVjx/pa04jiRhUZeAmYhFY0IfdPX2GFReTPcNInxsmHWH9sjQAUzkBQcg==
X-Received: by 2002:a05:6830:2690:b0:7c6:ca1f:1779 with SMTP id 46e09a7af769-7c7c4414a0fmr7001780a34.30.1764379933355;
        Fri, 28 Nov 2025 17:32:13 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fcedce6sm2188742a34.16.2025.11.28.17.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:32:11 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
Date: Fri, 28 Nov 2025 19:32:05 -0600
Message-ID: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "qcom,halt-regs" consists of a phandle reference followed by the
three offsets within syscon for halt registers. Thus, we need to
request 4 integers from of_property_read_variable_u32_array(), with
the halt_reg ofsets at indexes 1, 2, and 3. Offset 0 is the phandle.

With MAX_HALT_REG at 3, of_property_read_variable_u32_array() returns
-EOVERFLOW, causing .probe() to fail.

Increase MAX_HALT_REG to 4, and update the indexes accordingly.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 07c88623f5978..23ec87827d4f8 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -85,7 +85,7 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
-#define MAX_HALT_REG		3
+#define MAX_HALT_REG		4
 enum {
 	WCSS_IPQ8074,
 	WCSS_QCS404,
@@ -864,9 +864,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 		return -EINVAL;
 	}
 
-	wcss->halt_q6 = halt_reg[0];
-	wcss->halt_wcss = halt_reg[1];
-	wcss->halt_nc = halt_reg[2];
+	wcss->halt_q6 = halt_reg[1];
+	wcss->halt_wcss = halt_reg[2];
+	wcss->halt_nc = halt_reg[3];
 
 	return 0;
 }
-- 
2.45.1

