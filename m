Received: from mail-qk2-f21.google.com (mail-qk2-f21.google.com [74.125.230.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC4837B3E4
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042288; cv=none; b=WM9V/RDQj96UPqaT1MeylVBlesZ1eoDl5CazTebJWfEYxxniObpu0d7npWcyPESGTpKqANR008qV9WAk55lignOyNKwnfeB3ie1Agl1bXSn85bHADNtdATj5cQW5MUh7s2E7BBrHan88rkWh4QOJ1E0BoCiSj2Fc63Sn5eUCg/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042288; c=relaxed/simple;
	bh=aNnUwhKo5OWaeITKE/V1RLKjimX2AydhyY8J6h0P+DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGj/YiFabYpiYB05t2xmxfijRlxAWsjUqFxoFWrYSnXgihq/xIRcoG8NlDIweulrdIfpMgXNIBN6XR4DwiA9NvjWaiL9TJtS054AOrZPqh5E2ncExKpuJ/xrkky0wuuadMIfIomtsywAqqhRNnIrRiHDwLH0qLUe6Dk1lyP66sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwA1xJC3; arc=none smtp.client-ip=74.125.230.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwA1xJC3"
Received: by mail-qk2-f21.google.com with SMTP id af79cd13be357-93910cadea0so226872385a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042285; x=1790647085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJuZQqGF1rNZ10ZkvnBMS2sNZzKZITrbk4Ko0Bs8caU=;
        b=YwA1xJC39kteH0qwiTOaJIu2G4J3vUttKr7PW6knFxBbF+gUJKJj6svhnqTbZw4LiY
         ZvnAx/xqW61oi09xvxQBWMXpHp1EhodTk+U9ifuru5EgDimEdEtcGlWMGDu/Jt66qenZ
         6SMSGLtOUkJV3WQVCoOLlOo4/oZ6NTnztI19ClcsaZC7Wtr8uMC7BN1FfwAUc5g/ua8p
         x46L0XSJzCIKK1UFaZG9nRJgWTqyFOiiDO4phfZnOOOeHWmHa5gfiB7w5ilZ2ESEhWLs
         jn5Bzx9VMvANTDu1gdlmaL7m9mMr2zsQNjsE8/wURYEOI+nbYvDT32g3FLylaOmbtjPb
         3ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042285; x=1790647085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJuZQqGF1rNZ10ZkvnBMS2sNZzKZITrbk4Ko0Bs8caU=;
        b=ZYNFh1t0A66cDLaFjWbctOYCwHmfTNYBMyprmm4IG5JdK2y9ANaNOExoC54PORdSPG
         wEgtYmq/7zkogiHrZjQPbA5O/Ohutik44LKB+w/Pm+j/5iK54i54BAxPuq7Cva6uH57D
         jbi88wczg0WVTY6z/PArDBF4Uebfy7wJkq3VhlrKiJlT22XUopkTNxzVr3ssFHd77l7b
         siwphhVma4Llwb19fYOWKtJOnNMnUGHXSoSCrFO+CMeYZxBbHNTdhY+8wjHmjBt6tFhL
         bIJvQB0IuBPkcyrsljfpoBvvAfKZoo7Ew3lqYZO2Zvv0fRDDSzrZe1NYgfMfMPyyjnes
         juYw==
X-Forwarded-Encrypted: i=1; AKwUvBx/a2hD8LhjbNF+bhJZtAUCngCgUnUFRgLldhtXH+EPuEY3CImHabIk2OJJ1cHHiTRFlbTu7jgxsTH8zN48g4Gl@vger.kernel.org
X-Gm-Message-State: AFuF++k7moOX5p5tpsinGhUULtVpwgy//h1FDU/yxQD44Hpkdho2kgmx
	+BQ0+OIzSYirmx3SKWV8hB6z6EP2U91/0ZLnbVajp0fyhDDPmMo02D8y
X-Gm-Gg: AYBFou1SILfl0dz3TuGGqRXpUwcA+xktkL68h8B1Wek8VSaEkD9xRXVAnQPd9HHd2xo
	WGRkVbHDnuK7K3htVYQ22HXkPoN+fWxuFs7Q2EJT+6KupkhbUOXAybUt0w1Zf1PSeiuT4n+rfF4
	r7Hfzq5nO81gcJRZKgq7oFDwIlD4qoLnBE2nkAhQrd6oI9B0VuSt7q9fmoaI6M8/xSlsX3k8pQq
	2P9CkNYFV/OF9AvQGyvX0brAfuAlrCJ5cCycYaidyL455M4uikkUK+zp5xsrYHELdfwK2fdXhaP
	4pkatHVWgC+vOcj2utAFUY/+soScqaGTBI2bkXM1bVSWyfDJXeUvZ/9h4a0b/MZCszG/8wcs738
	0pQa9+Ydpllh82Am57t+oysG6tOAIPVI6RHxDh6ZBl170Y8Rc0RpGcZF48a3HUVG97rQBGRbEws
	jbxYEjv0XGRxlpcKHiwAKVHQ66v30FuM5XmRG9b6UjcSN352CpYdb9lY5It55MfTod1KJLqsP/8
	UDWbMs2Fcj4
X-Received: by 2002:a05:620a:4412:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93c15d73ab9mr365709785a.19.1790042285432;
        Mon, 21 Sep 2026 18:58:05 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1cf0dc12sm18928185a.5.2026.09.21.18.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:04 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 01/11] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Mon, 21 Sep 2026 21:57:51 -0400
Message-ID: <20260922015801.32373-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index f91276822858..7862d68c9678 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.55.0

