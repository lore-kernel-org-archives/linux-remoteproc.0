Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7D8394464
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330618; cv=none; b=L8A9uIGsHM0+kPSi9bEoOWH1nEm6XVFRcvI72nUUYDpTo+mPwZjepQnSGNhGFNOlFVZKQ8Pd+9tsfEvPlEKgepEBZz57w7Gu87C8CQwnj/sBEm6evQsHIPi9Vv27cx8F6KQkgNxGIlt0ACQYP/7JNnvCeMz2HX0vk1K1lRKxmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330618; c=relaxed/simple;
	bh=edVr0rbhOgkFhSfFFpjtgCVxX4FcaJ3T2Pi370Z0o0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQXXkxgXYxtee1BfgpstMhxmR42xy8182ANrt74z0E9SJdiBPtbBqxgZ8EpwK0ZaIa5wPH20CwiohddDV0+cjf+952ELD0LfTa0E0WnnbEB5j3W2dhYtHx4MGti50/gCvo+4XZld0JinASHrJZTLd6VPJF2nA6CMVC/RQ5jl89k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LwkvDyS3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LwkvDyS3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so13543005e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330612; x=1773935412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=LwkvDyS3r7uLqkOdoZS5Z0JTOq2/rgMvyyOJuQn24jVuE3hrQkwOtWlKi1GEsQzupB
         9QUwdnNE5AB/MDhIp+mTSFySmPkNupxL8YsmNgQw6IyucyrNyRV/oIcFTVRIq1chqTtw
         nuH9vz0l02eRM7foPh8lByCnlFNdj4bxUiqfOqw7UMRt+tAa1xojayKbuEoeUWRmjmgp
         GuchyZOzVXT0NW+fMkPVphrejZif9wZysq1QsgXH0tYdy5qOSs0JQREgdyFniZzVDhXC
         9CQ9PGSzELILqFFmyxNCHdzFbvSynMcpbHi11WLvP0loZ6bOdVGzrMY34OQaIJ6y7E4I
         9WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330612; x=1773935412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=oCO2uBXFiSw3aC/0ARF8WKMaZ2550RVmfAjSms0y7jIrL6rLsUXw75HR3CrnZizzYb
         VYvMH1u5HdN5SKkMHhQ9RlObuh1RV12QJGVNz5AWm+b1GRN0zHLGNXiiagm/eAvvnVll
         B3UxYfDQmmnJojcdMqVeLiV2/uuzvODGShPIvW4+oQasf+qB9wQTdJMN3j9hISo7JGG1
         Hn6AMvtHaYkf2q0y6ohA7w4kUOp30mS1OWc/792MoSgpjdbgVklXORjCWC+3R1QmM0Ph
         qb6/c0IKG6BkkHCBdr08nRggPmO3bCtfGHPcGMkJ7dlKxr7932UnkC43/kTt2ttDn9X9
         R+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN4vlAKYIW1TT0ZhE7mAHyX1UqcHa1WfDgCffcKrTwXTRRDYlgqKNApsRfStt/qU4FCEFaiFQdycg0AmlchEp1@vger.kernel.org
X-Gm-Message-State: AOJu0YwgF9wBJukcVvvIHnsf3LI46hrDXpY6Cj6CMUig2YicaTxE9g/g
	jxEkvXG8C6PUS5T1wPBSAlyvK4UPWcUdbWr7FwM3BA6MzYa7I+jXrlP5I4UDtN3zvTM=
X-Gm-Gg: ATEYQzw8VChpI1fdTeaMzXr0rVrwLPI5tAp8XMjBm+xQOKHNZZm4yHnqJmjP5sMam/M
	WTcIoQqrBRfm2YhZxfCmPjH41jthgYR7tc3Do5J+xGLWBcuyDXigAhwV9XDBDAY3sgmEcRpN8E1
	BMnOMexo8rTTdjWaV6NpNto+ow2DY4B3wYHNZO72f1GAI7/s+rwBg5z37IbAPqHUbTYF0Uw1mNl
	PDH+D3Kk9TeVVm8gZPhI6ht8xvC0zZXF7IE+yy81W5XmIighbYxPOCY2ZABdVzWPsjYnVDRzFDK
	6YuCCQmEHgJgsT3jZKZb5T8njcGRNFuEmPJfstDQiBVcAFEPqZDQyorw31LFno4sNTtotzX9Xf4
	EwmLtrGCAZCg5OF9ai8ElC2wPwLWlUvufWQ533gt2k6OvMw/wquwMY40Oxmte/fDcEdnw3aSiIu
	mvlp448FixfyrqW4/o2k6N
X-Received: by 2002:a05:600c:8b05:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-4854b0f064emr120153505e9.13.1773330612434;
        Thu, 12 Mar 2026 08:50:12 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541acea11sm269787315e9.7.2026.03.12.08.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:12 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:59 +0100
Subject: [PATCH v2 5/8] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to
 pre-ram bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-5-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=edVr0rbhOgkFhSfFFpjtgCVxX4FcaJ3T2Pi370Z0o0o=;
 b=kA0DAAoWhcFWaZAVSlMByyZiAGmy4I6g3ZLR83kcQhbcT+FK7suc2HUjOfNOmusY1ybZ3Szav
 Yh1BAAWCgAdFiEEiWFVZv8fucZjoqazhcFWaZAVSlMFAmmy4I4ACgkQhcFWaZAVSlN5cAEAxmek
 R+iMfvZ7Ha523ikLYNBTzD0cWFBa1VsJt7ZqvpcA/iQKjzj92bSRqPvO9rmBaPloTrU5Mpsq75r
 xUZv5BIsI
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c381cc33064ec427751a9ac5bcdff745a9559a89..46483d4085c20fc297d28a49ca7ef5d4bfc4ae9a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -957,4 +958,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0

