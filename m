Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575630;
	b=O52kJzMQxGY8wRkmVlb62A82oZHR8haPW41T1CuCJh5riZ2kqr4l0zM0D/aEg2brUJzq
	 ZNvnh5yppT+dZD8YT4nvDIThtQN4xOHOhY/4wNCLQxdEmywwv6UAM8ky9THAMzgtGD/z4
	 C52yfUH6654N6lanKSaHbo3Cffg8khnJkdWgjUxeCAHUBQpb2MvvczZCDWUyWlGtT9Exc
	 a6gxCSpJY8EaDib2+N98s6PGktCks0kdl7fIH31dKHLXEQ6kVybVAQ3clQEtKwUA3x6dy
	 abRUawmKRlRdqOUXNxxbfWsdz3DSsjyk+su1+zPvvMELctMa9yNoteXnkPLd66C2RJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575630;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=+qT0M4hF3EpI3J8XMmC6HVsCM7bNb8jZ8T3SzWLo+IU=;
	b=wfoXFjWW7Uzjs1JmVAnCQfggbl6+fjHWfmEVRZAo+Ug3nDV2gR0SndozP5qU3x8XT9Vp
	 znzYCZFCKsYqZA2KfoEBgA/eDEhzaEZD5mjTvoUaOIzOTkP6FKLyF82CZtN7YA3a1Zoob
	 EVYCCCdWbvDWtKUqSdcIwKLdjgeYsIYJodpgPa04AyXQfycBatqlb3z2FqlyiOIlRqlr7
	 WU6dDfvgRiefMzsblYgQaGce2wS6dDQnSM9xDDJccB6dNMNUGyx/HaehqO87/hitC70cK
	 LtyBlX2M9+JJy4BtiFA9TwOOml49eMP0C09xr2fyZLN3O12Lctp8i3WfpY9r7WHsFKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=LYLIAX6a;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=kP9Orr70;
	arc=fail smtp.remote-ip=185.56.87.6
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53AF606A32D;
	Sun,  1 Nov 2026 23:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53AF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=LYLIAX6a;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=kP9Orr70
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575629;
	 b=CwyrfH9rVTcsQA3U5esVGAVq/K2HySbPjGM9xY+h2cp7Y5SIHXnAIb8XH/4rEAmwQBmz17vk/f
	  6lymGCDUOIZM/lO+uittBC2GCdG99LDCdJRsWyLC03T2JhJ2LXE2S+O8pwWSwJHiu4AsMVr3bk
	  2KXVY/cuASFgqyVxB72mXno3xofbBNv5pqCuBXl3TQtZHefv/XwWXzGPcd48LRQh4ft6nFBoNh
	  pV1F4WG5ONEgbpQoIS1Tp0U2meGlrE60MTEwhiGpNM2UTaHPDR/YOnrAktdWISsvC79MfNFz99
	  IuDCFvb44xxUeYgApTl3mpN3I8iELgsI3IjnVIwpcFHPQA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575629;
	bh=05qxmrdLaWrLNeONtEiAaIQpCdfThsWTWZ28C6CrHTk=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=YfXrwoC1nuqaf8yLg0ET0SSQqrVXF5vsvT+PXaz5cVWQA8PGxKZunL1KCqVnv4HsompQlJpbER
	  SK2sBs48JpSynxLfrg++gB5+A8qgz0oUUjf2849T0O9D3asDrJwRePhTY2PbKCijKcgJdv1Qwd
	  rYjdkIowi5MIomDcKq625B3wURJoNzCC2XWASSARHSbEVA2IGfbSW2vYxegXkzzjb5+/XcubHX
	  dNYGjN8dB0GP5kdfajW75DvHNVqma8POsDZDDaT+RY1qaVUi+nmQ4dTIajwX8UVYglNAn+vKDf
	  b6lNMQpvI07AFkbQWdRwSilPUIyqiTAMntUXY4FNAE9UCw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=+qT0M4hF3EpI3J8XMmC6HVsCM7bNb8jZ8T3SzWLo+IU=; b=LYLIAX6aHvTWZFiXeH70iexF0N
	tDrNt03yyir9TGrlPl7PSWZpY4hIFaTC3rfQNPXcbRY+w+J7JeC4cXfCkvPcaKij6KFk0hqpDQFNJ
	FdDNEkQqp4fVBC+HjPpzbxD9MpGotpzSvnqJ604tAaUNE73ihknVqAF8/LPPIecM91p4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-0kln.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex9-000000075WD-2ND9;
	Sun, 01 Nov 2026 23:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=+qT0M4hF3EpI3J8XMmC6HVsCM7bNb8jZ8T3SzWLo+IU=; b=kP9Orr7055HiCxFq6e9c+5HXYF
	R+2NxasF5YU3E3+XQYhLXpnNVXowsSe11Fb4DEHmpAmr6XIYxXYblrwOkNqYaExIXwe3mJQxOzxAX
	SXjWVJkCavg2GLkDPqX+jz2r5mMeef5Wscg2/DUmeCi0EsvYcxpszmOyBcGDGAw2IrX0=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex2-000000002I5-3346;
	Sun, 01 Nov 2026 23:27:00 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:45 +0100
Subject: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
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
Message-Id: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6416; i=francesco@valla.it;
 h=from:subject:message-id; bh=05qxmrdLaWrLNeONtEiAaIQpCdfThsWTWZ28C6CrHTk=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+2pMJw3WeC50aUWsYfunwwabAS+xy2cPsN6gUSh0
 F2Fz+IxHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEausZGc4+23OpO2tC/Xnz
 eeFbN9o9FTKsV/XZfdH+kfiC3NnNG2cx/FPek+yY8/Vjjnex/L4FnB95JzB3fpi0+qGt+GKPatu
 bFYwA
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
X-SGantispam-id: 50063f9cac90a9ea1a98b96c97596c2f
X-AntiAbuse: ID - 50063f9cac90a9ea1a98b96c97596c2f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex9-000000075WD-2ND9-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Expand the section on virtio support over remoteproc with details on
memory allocation setup and constraints.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index c117b060e76c..4b42ed582fb4 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
 of any type (a single remote processor can also easily support several
 rpmsg virtio devices this way, if desired).
 
+Memory carveouts
+----------------
+
+For a virtio device at position ``X`` among the RSC_VDEV resources declared by
+the resource table, the remoteproc framework will search for memory carveouts
+for:
+
+* all the vrings the specific virtio device requires (as ``vdevXvringY``);
+* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
+
+The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
+resources inside the resource table and/or supplied by the remoteproc driver
+and will be indexed by their name.
+If a carveout with the same name is provided through both means, the one
+supplied by the remote processor should be marked as dynamically allocable,
+i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
+
+If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
+try to allocate it using dma_alloc_coherent(), which will resort to allocate it
+either from the first ``restricted-dma-pool`` region associated to the virtio
+device's parent (i.e., the remote processor device), if present, or the global
+DMA pool.
+
+.. WARNING::
+
+    This fallback mechanism can result in a vring being allocated using a
+    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
+    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
+    memory regions should be specified inside the virtio device's devicetree
+    nodes and not attached to the parent remote processor.
+
+If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
+use the memory region declared by the virtio device's own devicetree node (see
+Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
+Otherwise, it will try to replace it with the first memory region (of any type)
+associated to the virtio device's parent (i.e., the remote processor device);
+if no such memory region is present, it will be replaced with the global DMA
+pool.
+
+If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
+device's devicetree node are present, the carveout takes precedence and the
+memory region is ignored.
+
+Declaring the memory region inside the virtio device's devicetree node is the
+preferred method for ``restricted-dma-pool`` regions, since listing them among
+the memory regions of the remote processor device would make the first of them
+the (forced) bounce buffer for the remote processor device itself as well.
+
+Buffer allocation
+-----------------
+
+There are different kinds of buffer allocation scenarios:
+
+* if the remote processor can access the whole DMA memory area of the host, no
+  special arrangement needs to be performed, since either the drivers (in case
+  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
+  virtio device type) will take care of any necessary translation;
+* if the remote processor has limited access to the host memory space, for
+  example because of a different addressing scheme or for memory isolation
+  constraints, the memory reserved for buffer allocation shall be selected
+  depending on the virtio device type:
+
+  - for rpmsg and rproc-serial devices, a simple contiguous memory region
+    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
+    should be preferred, since it allows zero-copy message transmission between
+    the host and the remote processor;
+  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
+    one declared in devicetree as ``restricted-dma-pool``) is required, because
+    such devices need bounce buffering to work correctly.
+
+For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
+offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
+in the vring descriptors are the DMA addresses returned by the DMA APIs for the
+virtio device. The virtio device inherits the DMA mask and the DMA range map
+(i.e., the translation described by the ``dma-ranges`` devicetree property) of
+the remote processor device, and is never attached to an IOMMU: these DMA
+addresses are therefore host physical addresses, translated only through the
+DMA range map. The remote processor must be able to access the buffers at
+these addresses.
+
+.. WARNING::
+
+    For remote processors that access memory through an IOMMU managed by the
+    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
+    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
+    of the resource table, at the device addresses they specify; no mapping is
+    created for the buffers of the virtio devices. Such remote processors are
+    supported only if all the memory that can hold virtio buffers (e.g., the
+    ``restricted-dma-pool`` region associated to the virtio device) is mapped
+    with its device address equal to its physical address, for example through
+    an RSC_DEVMEM entry. The same constraint applies to any fixed address
+    translation applied by the remote processor that is not described by the
+    DMA range map of the remote processor device.
+
+Allocation of virtio devices
+----------------------------
+
 Of course, RSC_VDEV resource entries are only good enough for static
 allocation of virtio devices. Dynamic allocations will also be made possible
 using the rpmsg bus (similar to how we already do dynamic allocations of
-rpmsg channels; read more about it in rpmsg.txt).
+rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).

-- 
2.56.0

