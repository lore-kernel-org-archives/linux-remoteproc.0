Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018307;
	b=AAzCRlkxeFDZ0aaXnsLAq/QZRtTS3P+DrqyzDmDGU48rdQC+8dgBhiJVT3St/O/L8CW/
	 UxAz0Ohb/oCGE7+Ej3d4tp2/eJmnqvD3ZdUNg3Ogcy73bokOJ4sVoNYTKCf6skM+n/Eyw
	 hu/eyaEj3BoLBV+CQLyx7KTe9LQkQxHw6nO75XGvZ8Opmvd0+xeCPDWn70F6NA6c4WAuA
	 2C4/V5c1IMx4pCW+xZwQE1hIPYxXJOQ5dJUtXH+xN+q+G0Gk+q6/fodI++LNT0dDtWFmh
	 0km2yL/16/e29WE6pQA0/Pzzv5sky1x1MpCNz6Su0kzPfnCeqAG2LhznHcDJSNa8RpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
	b=2L5b+em+zQbdw5s1L3EyRCSBGUGsJ/i/udKAHCOlQMrJl0JCQfk6wteaZbldTYYD1LdP
	 rql7SmhbgiMiWBLw+nc8upg6npCW9I/SOS9INcpz7+EJn2Mi4A3847rodcjFwW4FCxUZx
	 7nVJyKbYTgGxjOSAQJYb1FDwSbmtztW0/Xg/23/imbxUtX7wkNyr10TqZqnSmtjPFQm8x
	 /YSKf2usD51muSmUyJI+65ZsABmF0TKDJH2BC8aZ/mBp3haYR4owl8Uwv04hcnGbMdLOB
	 EcO69Pp1hHCfoEjXXtyB2sKfJWXZTXqLyHC3eBEohbY+zShdXSVFI62H30/MAv9k1fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBM5NYlb;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E78606A326
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E78606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBM5NYlb
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso97039137.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018306; x=1794623106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
        b=GBM5NYlb/2KYIN4+6oMVOLhLKYe1LYH8PoQfIrk8eZ6FQAl7UVf+/C81j/j7XppFWG
         z/T8GEY3WGp8Vwq0ODHSkuO69L+H4C7HtJSSmeI/KAuWS7TTiWEyAww+ReZbMh8CFCig
         moUIluGJDFdTlUnZA5r5NwsxOJ0n5zVtuL/1AaRv3KtSxvKKEndg/SWSVhBkrWmljX5R
         eY30JI4smany7tVNErBkmoacVJ1goZyGnHKqBH8k+bP7GHHsI7Av5XSBG73zILOL2Ytu
         r7+tAt2NrDpSJXsMr+w6ZBiJtwAFkrbTQ5If9mCUy0VKqh2DreVuukW2Cy//e9bb3INR
         Az5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018306; x=1794623106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
        b=M5CkuCay2gG8rT6EZK94KukCOyRKV1JRMHEPC7olmPhQ5oUXbDrWIxj3zMXWpzTpTQ
         csWynuADu8D3kG8mw3C5hPcXtjsMsnnZNS3RH+b+sJWUYQWWp4cDghfy/FURBEFhOyVG
         5evTSbqEb2nb2j/ZdjRMvDDql0C9fpkIpcLgLlUrr66AwcH0zUHos5kYX9vWiIpYMefZ
         shWiKoCKp3nj9RVQZQrxJHZXaG0EMNn0bnNrDY1yj5sVQQXrR9ODpfDEhYaU8bF0OXPS
         hGpTtt1d3v2iD13n8T8sVgsBZG/ekVYkNMy9CaJeZ9plcxLBAX6FGMLxQEhUQMRvbC1x
         GQaw==
X-Forwarded-Encrypted: i=1; AL+hErES3wGkaLaW0J8nVAwV48crFoQ3pqjk+mmfE/iaYaPoiC2IFFD6nnBxtpl+osLNkNdnP19essnfvwssg0jbbORc@vger.kernel.org
X-Gm-Message-State: APuU4Z+aTn0/cqQNgAk0e+/hSuDjvaH+9nvHp7W9LyfdjStzuHjYmfhj
	tphrJLz5DJ9DxHiMAZ4QTwtv4yZdC4Vpq/1BIC1Yla1lgT5uBLrSc3ud
X-Gm-Gg: AYBFou3yfN7QAoInFny9onlxG88YG/mWVtDRZbNwjXDQSiSbVgGzVkElNZ4UNXkP6T+
	EnPM5N4JmNufLcQYkyJtNdamhXCmHgOUB/k/RLNvUeDMsLe4VwJEXRusY4p/TGiPtRdy4uJhmDM
	S3zhpu9AWPKNHkk4Cz9ZVnHap7mL81SJ/TwHw6JRb71T8B4C+Br7C+cWFjuD2w0IOYwRknKpTzg
	4sFa1NaPGQshmy5a3Ik4u9q0D6MCeUHoim13KumZILYAr1oIvTa1y32AiG+52LO/t7onzBUzlk+
	FMH5tkf8hJ6FKicEsh8+JWRC2MUCV5tozKzQ5gPvwE4vAT/6sCoXZIRis0XjrzfRcs+XK4TALyR
	c6L9ha9+mgda8xe/+PUxDDSdd2k9IDPatXR6Zbq3owPj9NQaoV0PsudcClfXO2rlpu9mL3iKbEi
	l+vYONt3fQMfsdRmyhR/dqfZ2yMFsbzc+SFSYfjfijjJxQ2AE1kkNHnbiz1nliWIhAPaQdlPzhp
	vZz1D8A3gI/SekXbe0VcOIc/ExLsl1wN0VcamwzzLi3uGKl+dee5BDEeUiiyPUkRBemzdHWM3Xc
	hDeCNDOcNVzNIXV/0HJgBV2NNgpR
X-Received: by 2002:a05:6102:32d4:b0:7cc:3eb0:6ece with SMTP id ada2fe7eead31-7d2a166319amr2396569137.33.1794018306156;
        Fri, 06 Nov 2026 18:25:06 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a89412besm2641941137.3.2026.11.06.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:05 -0800 (PST)
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
Subject: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
Date: Fri,  6 Nov 2026 21:24:44 -0500
Message-ID: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
- stop using fallback compatible and add lcx power domain (3-5/9)
- move lpass codec bclk from sdm670-google-common.dtsi to sdm670.dtsi
  (5/9, 9/9)
- reformat q6dsp dts (5/9)
- set flags for codec interrupts (7/9)
- move "qcom,..." properties to board dtsi (7/9, 9/9)
- add review tags (6/9)

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (9):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 .../bindings/remoteproc/qcom,adsp.yaml        |  15 ++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  37 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 142 +++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 199 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |  16 ++
 7 files changed, 411 insertions(+), 1 deletion(-)

-- 
2.56.0

