Received: from mail.hofmaniac.de (v2202607385953487451.hotsrv.de [45.157.178.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121911643B;
	Thu, 27 Aug 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.178.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833914; cv=none; b=G/oRg9osb77GUj5Rr8rTZ8RhTEpl+U2wFjjxSJWY6GFmoG81l4eUFSouHlCZ+6VtwfpFGON08gXMfJCn0jwljvufk7DdQw+I60nERY0APfa6QwX3v8KGEzTVtOK5ZLySW5gDbMPkD23y1dcboB0XtGhrK7hx5L7mKtCiKuxGjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833914; c=relaxed/simple;
	bh=epm4upELTA6FgrAxEbKumsN5HtwBJh9YKjZmI9HLtzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOJp1GVUjGrXdFQPuikbAPLltOAhtBtAzUGboJryx19dHUUyUYcrOKBZB8aJd/4/coVrNOVG/48SKdZp3jgcj+qFpSL2+9V1YDRMAhXgH5iYCw/KTwUrfh26Xu/qhAz/6kiBcOrYI7ysFzRun1zD8nWWoqM9nlGxrDWkaBek2hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hofmania.de; spf=pass smtp.mailfrom=hofmania.de; dkim=permerror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b=ZmrWa2zV; dkim=temperror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b=lecdQvSn; arc=none smtp.client-ip=45.157.178.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hofmania.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hofmania.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b="ZmrWa2zV";
	dkim=temperror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b="lecdQvSn"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260822; d=hofmania.de; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1787833859; bh=2Oz1MxgiShj1tL2/lO3VGad
	AAeQQwfjBsEUSB93W3OE=; b=ZmrWa2zVKvLaXkN/HK6B0JHnsjdWOV02a4JsaJyFo/PHL8k9ea
	FvNqqkO+N/Dq7DNKwtXpmrYFYhqFbFBuYNAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260822; d=hofmania.de; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1787833859; bh=2Oz1MxgiShj1tL2/lO3VGad
	AAeQQwfjBsEUSB93W3OE=; b=lecdQvSnAe7FSEmVAXM7cp+vUV9wiZdVyFNt8QMvKNShN3mibJ
	PT9Xv9A2Z/r1Vt75ey8Z9PlBYGPJzk23zcP+D6Se6d6Gnes0ZOk3cNNORIT8ZVuPfJNz3ttM3T2
	FT5cIXMGaQcroUlyi+bx174OqL2Lm8v/AV0wILPiRbVDySrSCMO7kHUoo6ziU6+1XcphQ+nJest
	/qt4Gb0+CoXuuXhgDGXux2x8eDCemBNevaEuQ1/DAuohcBaSZoMsTrOhGl+bZWQoO7j3BqI2HsI
	yLv7S2UHnJ2ZAgabeU9Tq/EiixsH2hJgGuQGWQiGCN4r5NxVPMT+fFTMg8s7/tcD29g==;
From: Marcel Hofmann <marcel@hofmania.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at region boundary
Date: Thu, 27 Aug 2026 14:31:36 +0200
Message-ID: <20260827123136.438798-1-marcel@hofmania.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>

The address range checks in imx_rproc_da_to_sys() and
imx_rproc_da_to_va() use a strict comparison for the exclusive end
address of the requested range.

As a result, a valid request that ends exactly at the end of an address
translation or mapped memory region is rejected. For a region
[start, start + size), a request [addr, addr + len) is contained when:

    addr >= start && addr + len <= start + size

This occurs when a loadable ELF segment fills an entire mapped memory
region. This can be produced by a linker script that extends the
resource table section to the end of its designated region:

    .resource_table :
    {
      . = ALIGN(8);
      KEEP(*(.resource_table)) /* Resource table */
      . = ALIGN(8);
      . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
    } > m_rsc_tbl =0x00

This produces a ELF program header like:

    LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R   0x1000

In this case, the segment size matches the mapped region size exactly,
causing the address translation to fail with:

    bad phdr da 0xa4220000 mem 0x1000

Rework the upper-bound checks to allow ranges ending exactly at the region
boundary while guarding against integer overflow. 

Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
---

Changes in v2: 
- Reworked the bounds check to guard against 64-bit integer overflow
- Use u64 for offset instead of unsigned integer
- calculate offset first and then validate len against remaining region
  size

v1: https://lore.kernel.org/r/20260826155123.AEB731F000E9@smtp.kernel.org/

 drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd822..ea852ca143bb 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -540,6 +540,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 	/* parse address translation table */
 	for (i = 0; i < dcfg->att_size; i++) {
 		const struct imx_rproc_att *att = &dcfg->att[i];
+		u64 offset;
 
 		/*
 		 * Ignore entries not belong to current core:
@@ -552,9 +553,11 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 				continue;
 		}
 
-		if (da >= att->da && da + len < att->da + att->size) {
-			unsigned int offset = da - att->da;
+		if (da < att->da)
+			continue;
 
+		offset = da - att->da;
+		if (offset <= att->size && len <= att->size - offset) {
 			*sys = att->sa + offset;
 			if (is_iomem)
 				*is_iomem = att->flags & ATT_IOMEM;
@@ -585,9 +588,14 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 		return NULL;
 
 	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
-		if (sys >= priv->mem[i].sys_addr && sys + len <
-		    priv->mem[i].sys_addr +  priv->mem[i].size) {
-			unsigned int offset = sys - priv->mem[i].sys_addr;
+		u64 offset;
+
+		if (sys < priv->mem[i].sys_addr)
+			continue;
+
+		offset = sys - priv->mem[i].sys_addr;
+		if (offset <= priv->mem[i].size &&
+		    len <= priv->mem[i].size - offset) {
 			/* __force to make sparse happy with type conversion */
 			va = (__force void *)(priv->mem[i].cpu_addr + offset);
 			break;
-- 
2.55.0


