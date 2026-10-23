Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737580;
	b=PTYSdBA1n4dG8hCdMu493E0da0+9I2ugO705+Jxm370qeF+FNSvLfxpW691YXHQbK0D1
	 GnHV6q7//DercJXpyujh6QiCB6+kZ0fL+LBI98Esb7uWAc/X5ZPKVZcma0zXM1TbflUt1
	 lfUAhH3V1S9xK8W+KiOYRxC90g/Nslw/+6cCoBXWsLF7F4aCsYou/Y8SVo5P4nod7FbeU
	 PJuzBjUNrGx1ymFVCYO/PkSezdJJTUsn0Lbhxpm6NwUNLQ7QLeLzuwgNr967Z2e4llQ4e
	 EEYi1MZpGerB87yzAgLh92FtMEEu1tT8LS661d8PEhTC27SP/w30UM0rEJQ3kHdXKCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
	b=1cQOtu6hqOkgRTtpfqq2oyHAlpzMfDPzLf89NjYe7FZedDUka/FB2u/apqN0TQx0gs1Z
	 YGG6TNmKyVL4CJ5Bwb96zTqTy1ZdWsIJacwRXKZneAAK0BVjnBk8HaLscbI9dApd1CkFC
	 9MzVGqtctxQj+XrdnWejf2k5A1VQlamhNcTafawC41Ys3F8syjrIeM2Jyo7SlU9JkrhlC
	 CxYSnzZPfBfhKqABEs0O5kSJ7Bnro/pZFp4I2pMKPg8gKvRjJWuedQ5DFRxzSHOz4Xt7I
	 5o5U9ocqLXcnIN+5/J0XAcpUFV2TZ4DCDHfeOhz+IMFrhS2pgTVR0kH4Z0tul40cH9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fE4ppVfH;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109D606A31D
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 06:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8109D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fE4ppVfH
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4be28b82so395657f8f.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737578; x=1793342378; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
        b=fE4ppVfHoNB+tK/mqGsUIPIh5aoPUqkEgxSn5Cj0FGM6quF2/uIzJwCvKtU8WG0mA0
         L136++YEFUA20TrKOmLvLaZaj0ijNsm/68oJFMCLZ2CHmV3e6eEeowGJ92nFJ8PaIkEj
         XWpX535koWVdyGgFkzx4GOWmijDVt6xKotlPNi5EM2IUJcAuelwuZkclNyNBfh3hsICi
         +gY9vo0jJLA0wLRR1PxXK6+TYqbqBtBlVDIw2r+i5h1CRSatAwgzJFEacYctpAKlKZQk
         ctMuNg1Y/wJvHQRMdpMmJusE1FAITXAGuf1TFMpQk33y34iWeuc9P7zaKuKz6SDDn8tr
         223A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737578; x=1793342378;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
        b=AbaLXJWYmnHPeSNz+5+/jhv09kRILVxfMsIxVyRnfq9xBJnnZvwfN7rXsj76e1IYCr
         NhbP3GENQwdfa2Zhcb5nc+LfZ6S4nYkYNAE+5lAz3BLgLIe2wFmSvW2ivY/HaYh6NRB2
         42Q7YZD5DqOUZDhNpdM8oMf0xQTaRnsXhizXCS5jPV46EdsSqllRlmJt8gc2BCSUNinF
         Lb7YrMBvkKoeHzFlHqu3Itfoz7ZgJUHOZHOjuaTI5BcD0nB/HtHeE2kUmDkATr9RsRuQ
         rdVfokD4KHrxRjHBq5b7jKqztJxxyut6KTMK3RjQvSdeJrIiNGehb/LZtuZVTAzHTHF6
         OTBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjjXjaf5THYY6eNWDSl/xh5cWrpQSGe/+M9MIl5AAGKOkrWh3XvZRUkIQ/gxpnL5SrehHaLyLMD4ZUhgib+kBb@vger.kernel.org
X-Gm-Message-State: AFq9FYIa2XJlr+5zHGY2pZ2FxlkqOdcBBX90/I36tD9mPYGhgZ4no1cB
	1/xEXtycVfXkUaFecj3Ml80ttCYXfdkNIKi60LWWG26YErLOfj4fgRo1
X-Gm-Gg: AYBFou1rb0Trp1K7raQdK5u7C1KUB3jva95RP7FFiBb6oKdT5hY00+IlQ4ujQskVZn2
	NyxDUQ22GrcUmY6q4wJ4ZWFgp9WsTgx5Pl7oumoYz/KXR+5omwojTDw2pwe0LSstfuY2JD9FYlw
	ATW2jQY+aFXZSTog89+13EiqZZ+NnCQ/4+JntFc0/LIC3KwRoksE5s3FOQQFZxcYPUJ/XxVfPEs
	wqw2w67VZzuhYyLvb0od6korS915ba7mQ3qv7QAoSQVoaK6xWAKUg5AdMYjAerAWvg/HIhPa8cq
	XSZGFe0yH6RhqxapResH/xB4bbjNV1RAvw1XcpPL33emClSJG9I+tw3+hC3FpJ4GoHuFxd/gXQX
	mCjhfYiMwGJUgmAjL3rK6xeai84Ohy0I9NPM8PRJk2YIzHs43JLvk/uQPBW4Dk+R4+ZrfB89RHD
	0Tv8YVk/UxrZ2Aj66OA+jCkl61wXwX9+3Xsx9FNwgkMz7NvfICu405eucB05RsgK0X/bWvEO9ti
	mYjDroi1TjVqQC0HpqjIFknK25OFpeoDiX/8Egq25t8i4wBMZLkbmFvoFwB8BOqDBNc8bKThOjR
	8J6EAt/hbj2jPELJOmjQHzHAK+Bo1FltufiGkwH3LSsTX6AsccqG/YGWoQCs/r+C7VZJHLQIwew
	2FvA=
X-Received: by 2002:a5d:5f41:0:b0:48e:c84:5be6 with SMTP id ffacd0b85a97d-48e3859498fmr1687114f8f.14.1792737577617;
        Thu, 22 Oct 2026 23:39:37 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:34 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 00/16] New DRM accel driver for Texas Instruments' C7x
 DSPs
Date: Fri, 23 Oct 2026 08:39:25 +0200
Message-Id: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB0B22oC/2WMQQ6CMBBFr0JmbU3bwZK64h7GRQOjzAJq2tqoh
 LtbWBgTlm/mvzdDpMAU4VzNEChzZD8VwEMF3eCmOwnuC4OW2kilUKTBjRQFYq1043RvVQ9l/Ah
 049cWulwLDxyTD++tm9V63SWyElJYi1aWh8Wma5Mf6Zn546M/TpRgDWX9L9c/WReZbO2MQUPyJ
 Pfysixfz8MqRN8AAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

This series adds a new DRM accel driver that supports the C7x DSPs
inside some Texas Instruments SoCs such as the J722S (the only SoC
currently supported). These can be used as accelerators for various
workloads, including machine learning inference.

This driver attaches to the DSPs through remoteproc and talks to the
firmware running on them through shared memory and a mailbox. The
firmware is the accelerator's command processor: the driver pushes Jobs
onto a per-core Ring in shared memory and rings a mailbox doorbell; the
firmware runs each Job's Kernel in the DSP's user mode on the client's
own page table, moves a Fence when the Job is done and rings back.

The kernel driver itself allocates buffers, manages contexts and submits
jobs to the DSP firmware. It also populates the per-client page tables
with io-pgtable-arm.

No carveout holds buffers any more: every buffer is the kernel driver's,
page-backed and mapped through the DSP's MMU in the client's own page
table, which answers Andrew F. Davis's question on v2. The one reserved
region the driver uses is the first 256 KiB of the IPC pool, where the
handshake, the Ring and the Context table live. A buffer that a DMA
transfer names must be physically contiguous, since the DRU does not
go through the MMU; the client asks for that at creation.

If there is more than one C7x DSP core, the driver will load balance
jobs between them with drm-gpu-scheduler.

The firmware isolates clients by using its MMU to protect their memory
and by running their kernels at a lower privilege level.

Besides executing user-generated DSP kernels, the firmware can also
execute DMA transfers at the request of userspace. These don't go via
the MMU, so are validated by the kernel driver.

The source code for the firmware running on the DSP is available at:
https://gitlab.freedesktop.org/tomeu/thames-firmware/ mostly under the MIT
license. The ABI with the firmware is defined in a shared header with
versioning.

Known limitations of this version:

- Runtime power management is not implemented (system suspend and
  resume are).
- The J722S EVM does not resume from s2idle with TI's shipped
  system-controller firmware, so the resume path ran only in the
  driver's own tests; the suspend path ran on the board.
- The submit IOCTL waits on no sync object, which a Vulkan driver will
  need.
- The 4D block move is the only DMA transfer type accepted.
- One firmware image serves both cores; a core found running another
  firmware is left out after the handshake's five seconds.
- The DRU channel stride is stated for the J722S instead of queried.
- The J722S is the only SoC this version runs on.

Three additions were needed in the device tree bindings:

- power domain references for the two SoC timers the DSP firmware
  drives, which the remoteproc driver does not hold;
- a second mailbox doorbell, since remoteproc's own serves rpmsg and
  this firmware rings the Ring's; and
- reg entries for the AUX SRAM and the DMA engine's registers, which
  the driver maps into every client's page table.

Everything else is done in userspace, as a Gallium driver (also called
thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html

Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Changes in v3:
- Shared-memory ring and mailbox doorbell replace rpmsg
- The kernel driver writes the client page tables
- Buffers are bound at userspace-chosen DSP addresses
- Kernels run in the DSP's user mode; faults reported per job
- DRU transfers submitted by userspace, checked and translated by the kernel driver
- System suspend and resume
- Versioned firmware ABI; hardware ID reported and checked against the SoC
- Firmware rewritten bare-metal, MIT
- Link to v2: https://lore.kernel.org/r/20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net

Changes in v2:
- Add thames_accel.h UAPI header (Robert Nelson).
- Link to v1: https://lore.kernel.org/r/20260113-thames-v1-0-99390026937c@tomeuvizoso.net

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Suman Anna <s-anna@ti.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Oded Gabbay <ogabbay@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-hardening@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Tomeu Vizoso (16):
      dt-bindings: remoteproc: k3-dsp: Add the L2 auxiliary and DRU regions
      dt-bindings: remoteproc: k3-dsp: Allow a second sub-mailbox
      dt-bindings: remoteproc: k3-dsp: Allow referencing the timers' power domains
      accel/thames: Add header with IPC definitions
      accel/thames: Add driver for the C7x DSPs in TI SoCs
      accel/thames: Create a context per client on device open
      accel/thames: Add IOCTLs for BO creation and mapping
      accel/thames: Add support for submitting DMA operations
      accel/thames: Add IOCTLs for job creation and submission
      accel/thames: Recover from faults and timeouts
      accel/thames: Add IOCTL for memory synchronization
      accel/thames: Install memory mappings populated and dirty
      Documentation: accel/thames: Add initial docs
      arm64: dts: ti: k3-j722s: Add the AUX L2 SRAM and DRU regions
      arm64: dts: ti: k3-j722s: Add second submailbox to the C7x cores
      arm64: dts: ti: k3-j722s: Reference the power domains of the C7x timers

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/thames/index.rst               |   47 +
 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml       |   33 +-
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   16 +-
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |   27 +-
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |    4 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    3 +-
 drivers/accel/thames/Kconfig                       |   27 +
 drivers/accel/thames/Makefile                      |   12 +
 drivers/accel/thames/thames_abi.h                  |  238 ++++
 drivers/accel/thames/thames_core.c                 |  867 +++++++++++++
 drivers/accel/thames/thames_core.h                 |  120 ++
 drivers/accel/thames/thames_device.h               |   97 ++
 drivers/accel/thames/thames_drv.c                  |  554 ++++++++
 drivers/accel/thames/thames_drv.h                  |   67 +
 drivers/accel/thames/thames_gem.c                  | 1077 ++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |   77 ++
 drivers/accel/thames/thames_job.c                  | 1319 ++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |   81 ++
 drivers/accel/thames/thames_trace.h                |   77 ++
 drivers/accel/thames/thames_transfers.c            |  405 ++++++
 drivers/accel/thames/thames_transfers.h            |   52 +
 include/uapi/drm/thames_accel.h                    |  843 +++++++++++++
 25 files changed, 6043 insertions(+), 11 deletions(-)
---
base-commit: 1ecab8b0bad393750c60cc3819ce9c256595463c
change-id: 20260113-thames-334127a2d91d

Best regards,
--  
Tomeu Vizoso <tomeu@tomeuvizoso.net>

