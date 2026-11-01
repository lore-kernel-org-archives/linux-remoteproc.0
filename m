Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575629;
	b=vPh0gwch7G8T0Bz2L46vAnHinuZynyPZilZJwlK2eivTdfH4uh0mcVALmt9+NTj8V+HF
	 kvK3za/QsF6mVRcOdWdOh8Ayp8fEouCl3Mg3Ob6n7O2JUHs5ssrUgWCYylIkxezoKqfTF
	 UN6lFP0PcqCtY9500WbgdhqNpKERkaW53MrhpUgRttfVu7XGVsiBL/VSF6J3uOJKaBuwe
	 wwh3qsUFR4O7tFPbgWwUIkOCNauuPJ5X7J9mKgkSBynjlzu7fztt8jiQXTK/uVYzZdsP5
	 PNL3eu6o2i7pDhP3+O1ZnC1/ateCFsL2hWJPHnYTHnBcb2zEKOj3QEaflBU4e5tqfDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575629;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=wEJnWzIAnou4pQH9tImVIhiTvGpOYOR1x4eAbFCRMDE=;
	b=FQJQzm76vv2LIYJ/HGPg9+cDV+nW+crDAMBCGkr3zOTvpW46uhsODZaJWrQYvJCMYrqG
	 qYbo0lgtA7BZhtKR9p0CjpwTxkCUepaee0VOhMrVGkFGs25Qdn8gjJf/DXJDfWFov7IQb
	 EtbDUGM4VXVgUSFgpT8FTZn1l8pl3Kyaei+WACZa7Fl+Hf6Xc7HqHOGASOeRLXbAadI8E
	 5HuUwwrHsLqiO87tZjodht+1WiCEYV4nQgmMRcvoCRCQKwDZJtxgMONyTJKWskU6TvZ6B
	 ApHhvVO57f/8eoeKrfynrgwhnkWFf4Jc1QMq4rYstGn24HlUTx74PqXj5X4RbXla7Qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=UYGRD2Nn;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=dfBbLBAl;
	arc=fail smtp.remote-ip=185.56.87.7
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC9606A324;
	Sun,  1 Nov 2026 23:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBC9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=UYGRD2Nn;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=dfBbLBAl
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575627;
	 b=eHkkyeEmTi4hduU9uxjNzxDyX8QsfET4ecRY8pIEz+Ftxd06iQo7kvtIE4wKwykR6dntN8EBdW
	  5IwcLZBm3ZuAy9rHwk8ziRhKr6V46z40JXDTjXdLlxphV9QQv+o40BICjLDZzfb10UoUsXIgru
	  tWqZH/nSus3Twf9sxp3epgt0EaOw1xoW23ODwARHGFV2+vaul4dUmNzNRc2ULe4bC1kGkpMEFY
	  qnYonHtH3mxVPURnyFFcxvqlo28YhA1Eioq0MVEzsQGzUbvTHvC2wJH3gCNsXoTwkmcb1nfVGu
	  nWzNCO8V+y0VekWy4FG2s3NlmzXCK+VeqFlykBhPOb1j4g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575627;
	bh=hjsHjvJdiVFb4MkP4Oih67FLGqThyQsQsUFshw2v5Gc=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=lbxWpgE7ZdxIEmKd6Zq1LsajLRY/6HDD/GNNaZSddvCBw6EzgCy565SjeWRbVRFCy+IPMVwaYH
	  Z07kJPw1CSz0yNkZfUa4OJKBzT/LTGTLHzmbljI/daFZ1GEfoIGRlLb1KmgN9VFPP+xj+4JfKf
	  e3P5YyT21ReutUa7bGBWLmOggHi8Z7EAOohJBnTKKF47r1I0vBeftGJtz1XJL8FOYYp2VuO9dA
	  AicDGU9FX+LWq6fFDyjttC6e7wKJBSEuw97Px1QqTuxuPTeNFSNstkft5c9Hk+mCPJ3DomUPi0
	  WMSpvHAOBrS3cIefnUnB13L/mKvCFVujLDZy2krjaWGjzw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=wEJnWzIAnou4pQH9tImVIhiTvGpOYOR1x4eAbFCRMDE=; b=UYGRD2NnyIW0SOvzRickxNs58X
	VnipCN8MYhVatJEHmGv/KFeq3M7wCSM4/3Zs9yrHmGnJ+oEKlOjq6nb2R2x9Qf6hQYfNjdc7vGwO0
	oyNONBM6jKySzXQVLLBXBcI4/4h2OtaWvPQapTyF2Y6EaogX4dri0s0R1140yPwpV2/U=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex1-00000007Acn-2pCn;
	Sun, 01 Nov 2026 23:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=wEJnWzIAnou4pQH9tImVIhiTvGpOYOR1x4eAbFCRMDE=; b=dfBbLBAlApgqTHmnycC+gRxNYT
	3Lw1gbuR/w1N5HvIB2yULgKIeJ5KQoMK0HZEx9GtqWiUulwLsA+qmqyKqNdzKWfEvh1YY0hjrhi5t
	hxqkMUjTqizWAfirhXvKVKxDlcthuRORvijdrFftE2pSvZPBlQZIlrM03Hiy7nj01Vi8=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewv-000000002I5-3gcq;
	Sun, 01 Nov 2026 23:26:53 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC v2 00/11] remoteproc: add support for any virtio device
Date: Mon, 02 Nov 2026 00:26:37 +0100
Message-Id: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2RqolIgnExM/wKshZKmLrAFK2
 tpoCP8uoFePbzIzbwRHlsnBIRrBUmDHpp9BbiLQDfZ3EnybGWQsszhPlLDUGU+DNboMbD2bssN
 BVLreSVQ1ViqFeTtYqvm1/l7hcj5B8Q3ds3qQ9svjUmvYeWPfqz0ka/knyv6IQiJicUO914qqF
 DE/Bmxb3LKHYpqmD2BW1sHQAAAA
X-Change-ID: 20260915-remoteproc_virtio_map-bcf32a5fab54
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8611; i=francesco@valla.it;
 h=from:subject:message-id; bh=hjsHjvJdiVFb4MkP4Oih67FLGqThyQsQsUFshw2v5Gc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT23L87qZHNmzat6Kkx/SdGqZfksUb2u98u/Moosb3
 oju8l3p2lHKwiDGxSArpsgSsu7GvT1zzb+lbWB8BDOHlQlkCAMXpwBM5GI/wz91Rj+xQo7agCWv
 7NKnas4IO3ThVNZD3dvnUlNnmydPXlvC8D/hTqdm6+Jtcwy3xE75IPDqM2dMg/w7C4UZEZsPeLY
 81WUAAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: ad9dbb98e73fb9ef78a08ed9f14fdb8b
X-AntiAbuse: ID - ad9dbb98e73fb9ef78a08ed9f14fdb8b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex1-00000007Acn-2pCn-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

this is the second iteration of the patch series that introduces the
possibility to support generic virtio devices over the remoteproc
transport, whereas today only rpmsg and rproc-serial are supported.

Some introduction and motivation can be found in V1 [1].

This new proposal leverages the existing virtio infrastructure and its
optional usage of the DMA APIs to obtain the goal in two cases:

 - if the remote device is able to access the whole DMA space of the
   host, no special arrangement is needed; the DMA APIs will take care
   of cache management and (if required) DMA translation, optionally
   resorting to swiotlb if/when the buffers allocated by a virtio driver
   are not DMA-able;

 - in case the remote device and the host share only a small portion of
   memory (often the case for e.g. mixed-criticality systems), the DMA
   APIs can be coupled with a restricted-dma-pool area to force swiotlb
   translation for all the transmitted buffers.

The new functionality is introduced by setting the
VIRTIO_F_ACCESS_PLATFORM feature flag for all non-remoteproc-specific
virtio devices (i.e., all except the aforementioned rpmsg and
rproc-serial); this flag instructs the virtio framework to use the DMA
APIs when mapping and unmapping buffers to and from the remote
processor.

The series was tested against a custom Zephyr application [2] running on
the Cortex-M33 processor of an i.MX93 and exposing six different virtio
devices:

  - rpmsg
  - entropy (rng)
  - gpio
  - i2c
  - spi
  - can

== Open Points ==

There are still the following open points:

  - some virtio devices (e.g.: virtio-input) communicate through the
    device's config space. The remoteproc transport expects this config
    space to be somewhat constant, and there is no mechanism to sync
    changes made by the driver with the remote device.  

  - device de-registration on remoteproc stop is causing oopses (under
    investigation - might not be strictly tied to the series).

  - I still have to wrap my mind around DMA ranges and IOMMUs, and the
    way the remoteproc framework uses them; the current series keeps the
    legacy behavior for the first (i.e., DMA properties of the parent
    remoteproc device are copied to vdevs) and assumes da == pa for
    remote processor behind an IOMMU.

  - [i.MX-specific] the imx-rproc driver was sending messages in
    blocking mode; the change proposed in the series, required for
    proper operation in atomi contexts is sub-optimal and needs more
    work.

== Patches breakdown ==

Patches 1 and 2 are cleanups to the remoteproc-virtio driver and could
be applied independently of this series.

Patch 3 was submitted a couple of months ago [6] and paves the road for
the actual support of generic virtio devices, removing the fixed number
of 2 for the vrings associated to a vdev.

Patch 4 defines the VIRTIO_F_VERSION_1 feature for all
non-rproc-specific vdevs. This is required to support some virtio device
types, and there is no other mean of defining it, since the field
reserved for features inside the resource table is limited to 32 bits.
Given that the 1.x virtio specifications are ~10 years old this still
seems reasonable.

Patch 5 defines the VIRTIO_F_ACCESS_PLATFORM feature for all
non-rproc-specific vdevs. This is the first step required to obtain the
full virtio functionality.

Patch 6 introduces new devicetree bindings for declaring virtio
devices exposed by a remote processor inside a devicetree. This is not
required for some devices (e.g.: can, net, gpu), but for others (e.g.:
i2c, gpio) is necessary to declare child devices and link them.

Patch 7 assigns a fwnode (if existent) to each new virtio device and
assigns to it the memory region defined for such node.

Patch 8 expands existing remoteproc-virtio documentation to explain the
possibilities introduced by the previous changes.

Patches 9 and 10 are i.MX-specific and enable the usage of the newly
introduced support on this family of platforms. The first one might
probably be submitted independently of the series, since it aligns
the behavior of imx-rproc to the other platforms in relation to
mailbox usage. However, having a kmalloc in the hot send path is
sub-optimal. **Advice needed here.**

Finally, patch 11 is the PoC that has been used to develop and test the
series and shall not be merged.

======

Thanks to everyone that commented on v1 - the functionality evolved in a
much more flexible and no-nonsense way. Thanks in advance to whom will
do the same on this revision.

Regards,
Francesco

[1] https://patch.msgid.link/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it
[2] https://github.com/WallaceIT/zephyr/tree/multi_vdev

---
Changes in v2:
- Rebased on v7.4-rc1
- Drop the custom .map APIs and rely on the virtio framework to perform
  DMA management and (if required) the bounce buffering [Robin].
- Set the VERSION_1 and ACCESS_PLATFORM features only for
  non-rproc-specific virtio devices to preserve existing usecases.
- Add the possibility to have a memory-region property in each vdev's
  node and use it for DMA allocations / swiotlb.
- Drop the new DMA subsystem APIs (no more required).
- Drop the spi-virtio bindings, which are not critical for the series
  and have been submitted independently [Mathieu].
- PoC i.MX93 FRDM dts: drop the virtio/spi node and child devices and
  move from gpio-keys-polled to gpio-keys.
- Re-introduced the rsc-table in PoC i.MX93 FRDM dts.
- Fixes in the remoteproc-virtio bindings [Rob].
- imx-rproc: drop unneeded rework of reserved memory assignment.
- imx-rproc: do not send async mailbox messages with payload living in
  the stack.
- Rephrase and expand commit messages.
- Document the memory allocation behavior.
- Scattered fixes for minor issues [Mathieu and sashiko].
- Link to v1: https://patch.msgid.link/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Francesco Valla <francesco@valla.it>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Francesco Valla <francesco@valla.it>

---
Francesco Valla (11):
      remoteproc: virtio: cleanup rproc_add_virtio_dev error path
      remoteproc: virtio: replace commas with semicolons
      remoteproc: virtio: support dynamic number of vrings
      remoteproc: report VIRTIO_F_VERSION_1 for non-rproc-specific vdevs
      remoteproc: virtio: report VIRTIO_F_ACCESS_PLATFORM when required
      dt-bindings: remoteproc: add remoteproc-virtio
      remoteproc: assign fwnode during vdev registration
      Documentation: remoteproc: expand virtio support section
      remoteproc: imx_rproc: always use non-blocking mailboxes
      dt-bindings: remoteproc: imx-rproc: support virtio
      PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   3 +-
 .../bindings/remoteproc/remoteproc-virtio.yaml     | 106 ++++++++++++
 Documentation/staging/remoteproc.rst               |  99 ++++++++++-
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 188 +++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                     |  76 +++------
 drivers/remoteproc/imx_rproc.h                     |   1 -
 drivers/remoteproc/remoteproc_core.c               |  55 ++++--
 drivers/remoteproc/remoteproc_virtio.c             | 110 +++++++++---
 include/linux/remoteproc.h                         |  10 +-
 9 files changed, 558 insertions(+), 90 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260915-remoteproc_virtio_map-bcf32a5fab54

Best regards,
--  
Francesco Valla <francesco@valla.it>

