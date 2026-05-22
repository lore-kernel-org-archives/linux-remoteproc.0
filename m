Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4A3D6489
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448831; cv=none; b=K9Gp7aJbndz/V6JIx7AGQer7LtgTOfIw7UbcsoEbok9yLQXJbeEApIhGWiFnvBDxCv1ntJbIhuh+T+Ef5PVsV4IFT1MlizLo5IuVkdlkn9tvhxwqQaxx10MMNeSJF7N17U/TybsYYYP63yAKWey8UWlH6T24HijMPyg7fHr6ez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448831; c=relaxed/simple;
	bh=2dMtwqfr2ZGbuWNME1mjoFf1yb2LMAL7HBAwNxavaO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9sjKSLIrbV7GeYL9WwjExZ/A+82Ae1ludIEM1e3T+hZ6eCJ0SNWaIrZjMg0eCPGPAfeu9o0zlzrYNeJl/JB3skSWzZSFTY6VSPZX1d8kGoc0ostxPmyoydtr5+o3whtEmjVvZvcNHNeVM2oYzcyGrLvwgiWPZfeFOMRaB5URds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qx1ulHm+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qx1ulHm+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so6052235e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448828; x=1780053628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwywBvEJpsm1f+bVDJtLQZjSntFIsWCaI5FtaThXLqY=;
        b=Qx1ulHm+f2y1feqh5j9jNlHWR9uXFM2UuOzZyTgarDV+H203L8Df3r8rUx3vpMCqiY
         w8w3KrXsPgjFZ39QJSSNpIHuAunTpuJiGw7DfS1pV5B9HP6ViBvTkaZ6aCVaBwqZZ2WN
         +pxDzNWLRzcIrnHudwyCE6wS+wcQSKYAMjMy050wdoI4jPDxVCDhXZu9AQtYgAhJ6bnq
         YKjvU6mPKRIuY8UORO2ItIhszgiAmD9ylqSKvyntu8ToQc3dvMayYTc+BsZZVDoqOV89
         ift3BfYQyurW4lV7Caza0e8Cu+k2rpNikmA58WSByh43248BgJiKINoMoZMqHgyQy05Z
         RlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448828; x=1780053628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwywBvEJpsm1f+bVDJtLQZjSntFIsWCaI5FtaThXLqY=;
        b=LgMx8co6YwqXXC+EeVl+pHWqa0sqwnVWBaQedgkbzLlHSLni35+OCUb1g3/EUAjfrD
         n/F2iZ1Svi7gtOgTTIUeamqJ79tWg/BXIfH4hX8EPsKs8FiO4Tk7tKKA0Gov/FiwctNx
         tYQg1y0aSquI3ibqzfDu53lijGx3zZrAQSLjxBXIP/VR6pst+0nvH28NsdBnpx6elXI9
         9sSFAAM0eogFru83eL6DDYF7pCDuTbSuonwEGkhxZ2TADQ94HzFyOoIU3aLVRoQziiAU
         ZDc1/nKvJ0VODys7wDdfzqceH7J3Hteasn5C1qjkbF3/NgnTZrMyGPz9d/p+uqaOQp9x
         2kMg==
X-Forwarded-Encrypted: i=1; AFNElJ+Z+jaQA9PGIgDXRAQ2kqDhIg81rWEzS1Cji/PEu2fbuZD5GF7/5VIx6tqDh40RMHoeLpum3b3zoU9w/CYVjk20@vger.kernel.org
X-Gm-Message-State: AOJu0YycE4xS0AdmQfIs/KP9DyB8c97Yf3LAktKFbDrdTh1YqDMhgJFe
	GKKYgfLChLtEKpQsnnbweHHiwXAROPwqOP3WZWQ8rpG+WgpOqBZ6Yxuz
X-Gm-Gg: Acq92OGsCQ/U7l1qdGWhNb7r/2KhcVwP08kX09eD4oP9sahSZvoMgOVSZ2IJw/sCLx9
	qqTKCIzlkQP9Qs368HQK+fW1aqrmA+gEq2wCU7OLpI5Z5tbLnsDLTtpOY3zBRci5ByWxqbUw68m
	Ku6IcRbxRi9r40Dbrvt5yHsBQHYBDvNUeL59+t9Ynm1XUxvjHvuvqaN3Hxq9YCeWGCjf4qw/jFP
	iXEMGw+J20CDNJZUs1aSSipE4AyyisBpMReAb1jc4PnF1mKepGwlzIBxKG1+vnVxXloOqWV5g6D
	HA/dvMeUIjRN04UcwSmfew24JSXeuMY7PIoCcmqfrGlC9qQ+S4mfcblZcJ3ap23pBUk72ns2VLH
	MOn6BVQNRNhNpHycFeGgTvcg/lxx7r4CR9WV0fBspgaE6vurj6cvoffZL4vMRW+NeVe5d7iT9Au
	Wnxck7/iS2og6EWCyQDsh9U8BofIkBYzGzIfxTU3YGLfZx2w3zTW+BzDfHbzSS
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr37709105e9.24.1779448828096;
        Fri, 22 May 2026 04:20:28 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add RPROC support for the MX95-15x15-FRDM board
Date: Fri, 22 May 2026 04:18:44 -0700
Message-ID: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

Laurentiu Mihalcea (5):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-toradex-smarc: move CM7 node to SoC DTSI
  arm64: dts: freescale: imx95-15x15-frdm: remove common rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  8 +++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 65 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++--
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  7 ++
 drivers/remoteproc/imx_rproc.c                |  7 +-
 drivers/remoteproc/imx_rproc.h                | 19 ++++++
 8 files changed, 113 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.43.0

