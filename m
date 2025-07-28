Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E0217659;
	Mon, 28 Jul 2025 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700734; cv=pass; b=RarnANrCry8MR4aStp1+5DhwI4NQSuqNGZnE3V4tY8zl2NXRBGeePzf7PCKVUjenGCZFOnUK+LeMGmWszT1XwutzfXMrwLOlLKP9vFWHTi1xGNu2uaDJT6x9FaxrK8ygHXeU8kW8OIA3XDOkxdGMTkeUR3WerDIlmFId9dRtVvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700734; c=relaxed/simple;
	bh=o3o6Hwd7R+P+io2nAG+W+ynXaWMGpWl6Lp7cQJ24jBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jehKCPoJdNnXsbi0igA01vYfN/Hyjto2WXw/cwqRQRiMXQyp/qgxr2qzCTxLC9KVa4a2KGVjq3LdSFz7MAwnDusPBrqXYO9b79q1YreNZKz8yIr6yluDqhej9SGaSAsZ6DacTnK7+K0bfESDzo6TJxHL/l9fE+vDE76EmNFC2oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=rfkEPk3g; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="rfkEPk3g"
ARC-Seal: i=1; a=rsa-sha256; t=1753700692; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Blp1LA3zwmqGaYw8vMpLucHMeouRMIjw9DulmkBAHKrp+k6Lf7ULbuikM5r96LiNhipf6Mj/Js8oJI0CDVVJFwMGsXc/wovc/rO3YM8G7wo4fq2+2AXvlvTQzZCALYxHsMv3frWVMW8LaX1W1/DGIe0bkIhDmFBpQG9y1w0Vk/g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753700692; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jCizZ02zFYgFTJVgQnn9HjMW4JFU9RDiqu1R7dpUS1M=; 
	b=Jy3f+Wc8X9W/l9eGEoWqCMBSrnSj/NjrfQMTZr4Tj8G/bZdKBZYk+gz5WeEnFch3ganwSKmbBoPWAhKuGMBFVrEwF7cCCv+HXQH+VaksdeDpBdRk4b8c3LNFjQ7Z4Y5cfH8ppkNKU+VqFbSR6uBEuHWKFm0zKxh0BvZApdXJtHY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753700691;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=jCizZ02zFYgFTJVgQnn9HjMW4JFU9RDiqu1R7dpUS1M=;
	b=rfkEPk3gV7BigRvAAzzRz+yFbIyXNKbUPabXlpz5LkwH8Ywjat1R13dsDyvWE8Ov
	f/MtbUvMo98bAXBQhqcKHAWSPVnQzSv6j29mw3dmpT4HSmLCk5UimDmsWnKVp9ywyzN
	Pqe/hHT9Ep/aFyo/F2xqGTJl+DgkKRcNsN7o0ZHc=
Received: by mx.zohomail.com with SMTPS id 1753700688350626.8599402973831;
	Mon, 28 Jul 2025 04:04:48 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/2] remoteproc: cv1800b: Add initial support for C906L
 processor
Date: Mon, 28 Jul 2025 19:03:22 +0800
Message-Id: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpYh2gC/1XMQQ6CMBCF4auQWVszLVLQlfcwLGoZYBKlZEoaD
 eHuVly5/F/yvhUiCVOES7GCUOLIYcphDgX40U0DKe5yg0FTYWVq5ZNuEJXMErzC5l66c2foZDX
 kyyzU82vnbm3ukeMS5L3rSX/XH2Sx+YeSVqiq2vfW+q63rrzOPDyDuMdxIT9Cu23bB99d02isA
 AAA
X-Change-ID: 20250527-cv1800-rproc-08b3a9d2e461
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753700654; l=2103;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=o3o6Hwd7R+P+io2nAG+W+ynXaWMGpWl6Lp7cQJ24jBg=;
 b=2WgzAeLnoD8k1XxEY7PFQ3ylOvW0DtHOhoyd5UxMdEnmrwJX9ZgR0Yjra546NediC2SVFNIv2
 2fxv/A4Fme9DssmoChq7d+u5hFxe1gPl+2stA3rvhkoSxcEKLss35ep
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

This patch series introduces initial support for the C906L remote
processor in the Sophgo CV1800B SoC. The CV1800B SoC integrates multiple
cores, including a main application core running Linux, a C906L core
typically running RTOS, and an 8051 MCU.

The C906L is an asymmetric processor designed to typically run RTOS.
This patch adds the basic infrastructure to support remoteproc
management of the C906L processor, including firmware loading and basic
control (start/stop) from the main Linux core. Mailbox-related
functionality will be added in a separate patch, after Zephyr mainline
support for the C906L is ready [1].

The C906L remoteproc relies on the reset controller [1] to function
correctly [2].

A branch for testing is available at [3].

Link: https://github.com/zephyrproject-rtos/zephyr/pull/69594 [1]
Link: https://lore.kernel.org/linux-riscv/20250617070144.1149926-1-inochiama@gmail.com [2]
Link: https://github.com/pigmoral/linux/tree/cv1800b/rproc-test [3]

---
Changes in v2:
- Add mbox-related properties in dt-bindings
- Remove reserved-memory node in dt examples
- Fix warnings in driver by handling conversions of `void *` and `void
  __iomem *` correctly
- Add missing <linux/bits.h> header
- Use `rproc_of_resm_mem_entry_init()` for vdev0buffer region
- Remove redundant rproc_shutdown in remove() function
- Link to v1: https://lore.kernel.org/r/20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech

---
Junhui Liu (2):
      dt-bindings: remoteproc: Add C906L rproc for Sophgo CV1800B SoC
      drivers: remoteproc: Add C906L controller for Sophgo CV1800B SoC

 .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  |  79 +++++++
 drivers/remoteproc/Kconfig                         |   9 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/sophgo_cv1800b_c906l.c          | 239 +++++++++++++++++++++
 4 files changed, 328 insertions(+)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250527-cv1800-rproc-08b3a9d2e461

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

