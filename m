Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDE37DAA3
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042286; cv=none; b=n3UmH7P8st99rAOvWq8VUzS/4kFvBRCFfEZ+Z/GrznMZ1PXUKxuEQxlGMDJTFwFH0YwwEr4NzZgP0n/z7FlsLgjpF45L1KzUERprMzDWeH8x9X3vhPvwfi0GknCeEUtRQgdw3ab8P/vrUYy5v0NDUivlUpkTKkSixmcdgCC2l+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042286; c=relaxed/simple;
	bh=MjxnF6HOxulAnMhkS0+u3uuOjdak2QW6orbfxS/AkP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYf7QlA4+4/P5G1IBovr2MgaeG8nO0Hn38lx7WQb4P10jTQaZQx9WOBpr++dmgv4zQysCeHr1I1FW+EySvUUoZ8An/coKoLHcpUPR15c6DVS0HiBZQ+aMwNoJ2gxHuQU9vFLHKcYxpGx7dK1dkVadxQEiJtg4U7pLOWNo3OAlYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7SUw4np; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7SUw4np"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530de452c33so30685941cf.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042283; x=1790647083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PaaIrl1ZxcY9+TLKyKoWNojTWFhfz/qoJwuiatwG6To=;
        b=i7SUw4npUdyTskTx2DB5yhkVcLgI8tTW7SW0MMDygDHnFrxf3pi4MSHRNTSO37357/
         goywr3Hbj6MlhwwTPHX1sWetEGfvNGCHB7UrRkI0El09H8YBXL93Lydrmnr+s6DQLOjb
         gc2h0AhQZwIWU0s61cpuCXXIPJo/tyQXn0kzY156DbBKg/SVfkwYohTlwCTyQ0TKhjUB
         jMWv8wP+ndtnWNUrweCgrQ82uN8ppktCcIls9lY22uF1eIUjRl7k2UZCN+dggqwQaiPG
         T25cn5KEUwyvp7p823GCoAjvHvWU5k4cQOb7AWFPLbntkMZByb4xU1ZuGN1Tp2EZ5WuL
         6+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042283; x=1790647083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaaIrl1ZxcY9+TLKyKoWNojTWFhfz/qoJwuiatwG6To=;
        b=i8Ikssy3vZf4KS8hRoIbVTAXxAR5T8D2EZ5vTYlFdHH4DfRszfyQU/8HNVIVnylp1p
         phEwzLlBcfpfCNBQDNC2HwofoOS45546gnOXdOk2dAsSkLbEJAflzAg+86Vdeo9mK7OE
         I3aXRhUl3NDBfOZlapoVxAyj49x8YxX0YgBYc0w9fMb3IN1eZ89zCmAufNcsRuG3ITqm
         uYQVsejBHmPuYkK+jWgE000q5YdMtvXnjZtoZ6Xvdl4LA4iiiv1O/s4jsXDTknCtwe7u
         YWEWIihS+Cg9PjRPfZTnp6j74stKyOZrqMXXsxwh8uRIR8EHzbgu2ndCUKft1850BZih
         guMQ==
X-Forwarded-Encrypted: i=1; AKwUvByQB1TF0xSulTBp2AbZXVBbu+swtEEXGnWDO6aiSrXN4DEPaDpNq8ra/NdJpw1fxrJzQFEPhbubKhpgd8Tj8OC1@vger.kernel.org
X-Gm-Message-State: AFuF++kMsqOZCy3pmSGd2NEDY0fz+7Gw5hbJo843vWrIAMlfcrDAdrni
	z7u1zKW1Gn/DI3FN/JtLUw/LxFxcGzCIUjAclL5To7PPDl3tJN55W4X4
X-Gm-Gg: AYBFou2rris2Ambt/e8BWgXjA8uIfvQLr18cbxH00M5PbVW45roK+oADBV93fdiQoqW
	z5gEkqTSjy1i0Na1lr19qqk85gw/M4zHxneklF/nL4uv79Aj5BpZzn0oQRPRETWXDfCB1Qw7dqD
	5tuqm6D4rTxcnBxqRzGFf5zHFCwmtryzaaR6ETlNQNj0YKL7aI8UHKdLMrvrAtwK0I0Llp3CW4A
	b0oWUqPhUkgLw2RVIg8SSsAKiCKPclPtwt7zhmJhI+DSA4kqDFGUjHZAhrc/orqqaMAPTmyWfsw
	67c1i+WEgh2E5tVzgPdlVcli5fZesPd92GCIbukwxM/YsgmPIVo4Hxpao8Z5JGnyXtGG7bA82ge
	ODVmH4wdlVGZYHpue2+5BaAaS+ltDf4u3HKevEE8BFhDeni4hA2BKT7ruaIRZeeP6MlU0HIVC9Z
	oNIRYZP2qzi5vPFY8SRmlEbsJIy3kPUA4ywXmzecX2jD7dCGUGkpocf9Vq3cmcG1rbowXdLoP7D
	A==
X-Received: by 2002:a05:622a:190e:b0:532:9add:50b2 with SMTP id d75a77b69052e-532d8ebe347mr36832061cf.66.1790042283495;
        Mon, 21 Sep 2026 18:58:03 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140249fcedsm4014716d6.12.2026.09.21.18.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:02 -0700 (PDT)
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
Subject: [PATCH 00/11] ADSP for SDM670 and sound on Google Pixel 3a
Date: Mon, 21 Sep 2026 21:57:50 -0400
Message-ID: <20260922015801.32373-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Richard Acayan (11):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: sdm670-google: add sound card
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: configure analog and digital codecs

 .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
 .../bindings/remoteproc/qcom,adsp.yaml        |   1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  40 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 149 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 190 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 8 files changed, 384 insertions(+), 1 deletion(-)

-- 
2.55.0

