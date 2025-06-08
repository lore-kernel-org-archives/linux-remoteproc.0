Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB4288DB;
	Sun,  8 Jun 2025 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749350424; cv=pass; b=nBcZz10iMFvCaRTlBYfbGJ+zOWOd+zbAsntKsihGnXr6i3POZPwnKAOoOOvoUREacDZSk6AYZ2qYPRQ3Q3hxA07G/XvZYTNYmlIH3BeNMO166ZcgZg+40oUSeVR6unuhHC7ra7pvm0742tu13kEsL00YNZs2CXV/ufGR0lDUxNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749350424; c=relaxed/simple;
	bh=4JaWs42oRcbiCskMxvzOiMb1Ode/4TvCDQ0zEQk/uZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tCimxx4xkv8TaCIvFkaG4UvVBZKRJBv5FVLtqz8TkY6+slQ826XFcselyx84tCXWkdLURbl3kUt1V/SCOtsdnURNSvUGt8eogeeRzz1vUY7rdYVr0IVMIRaD0HDadQ9lbogC6ah1T7LRhJt92JdXg5lMAUU/PG4eLuCaJez8wlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=SZzEyhhD; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="SZzEyhhD"
ARC-Seal: i=1; a=rsa-sha256; t=1749350381; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UZPgJ884qwAlPtBPMwxlSHFsNL61bO6GNECSYc98aX0OY60p7luJqqJeJHqH3B5dYbmp9mRRxbAi2ZIdjdLk9vU0xr2ut7n3njZzgtak5bQkTC2aiAynO5TwRvFp1tSVrbbgJRSz0qk1+D5rcgV0lKtzxZ7xOzKNwWImk1sRZ+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749350381; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OY6Q4B4SaMSAkmGry/tqLzhJiwrbuJVjfc9CQgmf7bU=; 
	b=ANtmGHJZqIp5gHAEjtiQabnDZFEullr/QPDd1UELe1nMbXXNUMy7Tit6MB7ix95Ar22sOHKmADu08r8TKoUJTAo8WRomP4R+p2CTmRyXB6dHycOdjs/Aecj4Q3FC4CL/ohL4AqKeyHVZeHWVLkH+C5gFTn+ZcdPz+s+6i4IJm0E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749350380;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=OY6Q4B4SaMSAkmGry/tqLzhJiwrbuJVjfc9CQgmf7bU=;
	b=SZzEyhhD8DF75ycRGnEdjW1pVTqvVlm/aahvUhipU77Y6GySCFh5CA1d7QeUbzh9
	YTJrhcLh+PSX0BkFaCuooVptdEGiTqmS56ev6glLyIBGv7NDqvW4Xx5Q8X4i7F4zt7D
	JSO3amaqe7vLNZwy7bFZYh/FGVYBCOuTypzhZnas=
Received: by mx.zohomail.com with SMTPS id 1749350378587260.1022596609505;
	Sat, 7 Jun 2025 19:39:38 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] remoteproc: cv1800b: Add initial support for C906L
 processor
Date: Sun, 08 Jun 2025 10:37:38 +0800
Message-Id: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHL3RGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3eQyQwsDA92igqL8ZF0DiyTjRMsUo1QTM0MloJaCotS0zAqwcdG
 xtbUA9LWhFV4AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749350360; l=1502;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=4JaWs42oRcbiCskMxvzOiMb1Ode/4TvCDQ0zEQk/uZQ=;
 b=/BdHfhW0WFtoqmv8DQ9O9k993tkWtrDz1R7QoVu0+q42mLd9NNIicU9j7a3FN3pejKfbBsDUy
 UE7Q8Mo6yOlC7Dsnu2oeQl8Fo/8D3N/K3lzioG76K0aQfz+Oefx0+hp
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
functionality will be added in a separate patch.

The C906L remoteproc relies on the reset controller [1] to function
correctly.

A branch for testing is available at [2].

Link: https://lore.kernel.org/all/20250209122936.2338821-1-inochiama@gmail.com/ [1]
Link: https://github.com/pigmoral/linux/tree/cv1800-rproc-test [2]

---
Junhui Liu (2):
      dt-bindings: remoteproc: Add C906L rproc for Sophgo CV1800B SoC
      drivers: remoteproc: Add C906L controller for Sophgo CV1800B SoC

 .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  |  68 ++++++
 drivers/remoteproc/Kconfig                         |   9 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/sophgo_cv1800b_c906l.c          | 233 +++++++++++++++++++++
 4 files changed, 311 insertions(+)
---
base-commit: 8630c59e99363c4b655788fd01134aef9bcd9264
change-id: 20250527-cv1800-rproc-08b3a9d2e461

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

