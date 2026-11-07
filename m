Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018319;
	b=jke5NOAV1cl4wqr401GpgX6jewkcxN60+nMCNMaGIjUHlb78Iv2TFDMYKrSG7N58Osf+
	 40yJvikzofrENjWJUXX1Q5lxcICTu/KOcvZsDfwMBzR8Oxs4vq7SNI3CQUY/C1n1c5M3O
	 S1UzPbiPPwoA2MAY+Keunl8WleG5vEivpiWKlkQYMkVucLMvPSONSU2K60fjhJkSGiTmL
	 G76nvkHySSMAqSTJ6ZrVH+pCrsBxvmp79Y/bG7ljknx4U3RdJsE2fvdylY/OjYcQ9MMQe
	 wrwvoakPv69WSUAb5OLZh25JoKQGgFH5aQAWIXFN/tVcQ5FOcbF+5vX/Pfb7bxzG25A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
	b=hRDttV6BZQt5mtss9KlseO367/TNIkRGvS8oIXQB8CwsQflECXL0nW4Z4Yj0LcqOh7ge
	 MhTCacU0TZtlNDExz1mW7sMYIedfu9GXhG3xmaMHMKjb0ABTVrilcC1AwY0PCgmG5dF+Z
	 hvqnS1Dre1HSzqr5NoS+WRmIhBVHMdy8bVGYetSk6/y0WHQcIs6oGkEUVtQ7/cTDHcYIt
	 dvOoxALYtqdwNahed28v6jPTdszipBuL/FsRop/QfN709z0+3yJjmos8DMmnamDEulRi8
	 zs2tByLUwgj+3kcjglUhmwA22LmDhcjmcQZIX0j53jLb8dovCamstYv+9XG8Sptgkvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwycBg3c;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8087606A32D
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8087606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwycBg3c
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so219169e0c.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018318; x=1794623118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=KwycBg3cH1HqVRW6kJ7+USn537IV3Da5g66Atl2Gquu0xboormo2pgUjXPRdJlb04C
         4YKWvr3kM08HShpURq3K4VuvPSVt0YCavDKlYhTYWcOB4DH6I/uJ1h9cKa1W3i9HVR7P
         AGSVhlFcXjBI4+sHhECBNAmCTpY9Uwg0gJrQhNVBUQBL4WjAl6X7tlU8Evl2Jc+zT2UP
         3bHl5WlJX8OAweqjEVhLsfN8dNjZ6xcLCdFWe/AqdeqF9bfTbVurtxzve8zV9ZuY6Cm3
         3CELI7dLRTJCuv+u1+F7KdpZh8PEuitufe9gAVbFk+YUSVlU6dFoEpMKPkByf142hStz
         rdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018318; x=1794623118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=rjV7j46Q9jDV1cuNgvSmR8ArdooGTrJ67wcLJ/m2rHKLG7O4IT+c4PeIgW5U2zB8dn
         +H98KhvwdGlW1yeWRpWP75FpJEXHn9cLqaoLE/UVfy5HzjLHIkdIvWCxhJhMJBwRYF5r
         9ydKTWAoBFb03gxV6gJ2Uqb333aroS6/r4ObaHHPryaNZJGlKw9c2Dh0UBgSbrJ7zwvM
         ESaBHpcEX1JFxEZW3Oy4QdGP3+O4l/e4xh6otLDSZwFcGtsM2ymwQgwSgXErYuwJABth
         N7oOFzmHvJnwamgXNYUb0hz4bCnbcRGut+Czq1txA01IthqvfezFwlncPk+Em6AMa177
         FyIQ==
X-Forwarded-Encrypted: i=1; AL+hErFA7jp+TZfXxab9MWKorqXRDMwfFLwEhnWQLtNagmFU2q685aPjqCPNGNATq25ernXIBEmvY9fejtzzuMkCe7Jl@vger.kernel.org
X-Gm-Message-State: APuU4Z8c6/k6Kco2F1NEi0FEO81EmpFuO0e7swRkaKUmjRSqCUd+0gcY
	vKcY9JHiuB2vHQIv6Bq2Gv3s3YMW3UeICc9zszwL9CzGpgqXkJqebVUo
X-Gm-Gg: AYBFou3HQ4rVXx6Io6fONtlqbjahEOfC7STdroXFYpmuA1EmCvJYo7AFC47279/wBNA
	/LVLJEKveuUF4cMVdtGFVBouoPz8L1NrIWEgtqoe6+zoKAweDIkt9kXzvrLPPlz0TobaVrlh68g
	2BFjl5KSvZWm/mnWAzez9GAvDYnuNI5wz5NlG+Iyw0S2yCy1/Lhk3duirhv51F+OHJscRjcxG5P
	p6urDzI3gc5vJvtb8K5t7CSloAGzJ8hH2pBemuqs7wWTf/aHxRLIfHUn6h8gE/8iK/f/Yap1Uc5
	ii6YJ28iEh8maL+CmNAl69vqFX5bhekvV7abqUZAurXdL+U5egLMDgtoy7EBIB2rVQ34WlZCVkV
	vw/9xn38vTcFs3nWoUUj8+3Q2FA2Qe6NwBCO5TzPRS9zV9cKKsPHq1AJSu+feQOOxISPVEwtUpH
	a53BevpK6ZWyOaZaMW5cSXojipJt5CyPmdo6HJKR5ELinnlPx3nLgxHdt+v50X4rYYG0A+7qsPA
	iG3YXh+G53mBI0cL5Yt310OkLaIzv2eA+Pj0Pr5+8pl+ZmAgQ41tFkyROEoWGEwFdNdUdXSTKM6
	l3AfdW0gDOBVjGymC/qaN3QuK74v
X-Received: by 2002:a05:6122:1dac:b0:5ea:aedd:6077 with SMTP id 71dfb90a1353d-5ecd1b5db23mr209349e0c.5.1794018317800;
        Fri, 06 Nov 2026 18:25:17 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64ce125sm2548910e0c.8.2026.11.06.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:17 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/9] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Fri,  6 Nov 2026 21:24:45 -0500
Message-ID: <20261107022453.159341-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.56.0

