Received: from mail.hofmaniac.de (v2202607385953487451.hotsrv.de [45.157.178.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285B396D14;
	Wed, 26 Aug 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.178.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758913; cv=none; b=LohDZUJ3WKEJxLzsphityLvEmcDgSTRwkxTSLM8EJebSCBSwUrkV7wruChy5xLbKYmWfx7mRnEiWrZ1Z0g2JoE5icCq2LoMrskEK8vW6GQokju77gimSj1xsDOgPxpeFOWJeNMW0TRCNzFEDP6JuajlaaLpq2W5PnHKAIGE+C54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758913; c=relaxed/simple;
	bh=qKPPPkz5siCBjspASYaxLH6P2L1euL45uQz99Fdqlds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3ko9fRTNt43T1QJLQch7II6PVXZ/xB6bGnvjMTBmj+Uhew+Ca8HTsFMq5OgWMGuSUrAfEUcMG4LZzE07SEhLJXuJ+YBgNvImbmF9rTEJVKzhz2L3npwnSiLHGsdNKGCe5Zx/5FZKPfKQzNRwG9IXCkvfHl/7gPLngUE1P3fVBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hofmania.de; spf=pass smtp.mailfrom=hofmania.de; dkim=permerror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b=Ll6Sfhf5; dkim=temperror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b=OTCxRjVY; arc=none smtp.client-ip=45.157.178.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hofmania.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hofmania.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b="Ll6Sfhf5";
	dkim=temperror (0-bit key) header.d=hofmania.de header.i=@hofmania.de header.b="OTCxRjVY"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260822; d=hofmania.de; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1787758689; bh=zER04bhdBkHM9l1rq7hXQnK
	z0Gxo8A6dY7QEZEIuBNk=; b=Ll6Sfhf5cCt/Wxyl/vrJYEt+2K9AI8FnatY72Y9sBXIT/rDDIU
	6/kUYS7VGnd50RnMrqtTVDACpqJDM/1y3EAA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260822; d=hofmania.de; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1787758689; bh=zER04bhdBkHM9l1rq7hXQnK
	z0Gxo8A6dY7QEZEIuBNk=; b=OTCxRjVYL+MEwe+atjWE2a53m2pwGYkQGl34h3k/VLO242QVPs
	fgUmo08UgYxo+YJStcphY1nTRJcUTLT78wq+oKmyg8ShVr8EOVVRcM8FHMA7uspNb9PFMr921r6
	2COnuBOobGf9zCAjnKTQXHpEYUJbQbYAPFSLOlwdX35ZBmTp2xFjTBd6MQly0FFiLV3ST7LdHbD
	klGUGsKPPtEMa6TvbHWnoPDPIs3U6VuVK0w54pDrEfh36xDp3XBOdEKIVx7z3wr7BXo8yjoQE/t
	LlvpC2razII6jPKWBD7qafoEp0fKML+cLSJ0Iab/BCK/dBf75IXqtSoQyMLKL+h9sEw==;
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
Subject: [PATCH] remoteproc: imx_rproc: allow mappings ending at region boundary
Date: Wed, 26 Aug 2026 17:38:38 +0200
Message-ID: <20260826153838.19018-1-marcel@hofmania.de>
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

Use <= for the upper-bound checks so that ranges ending exactly at the
region boundary are accepted.

Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd822..f3c7c2ff6713 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -552,7 +552,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 				continue;
 		}
 
-		if (da >= att->da && da + len < att->da + att->size) {
+		if (da >= att->da && da + len <= att->da + att->size) {
 			unsigned int offset = da - att->da;
 
 			*sys = att->sa + offset;
@@ -585,7 +585,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 		return NULL;
 
 	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
-		if (sys >= priv->mem[i].sys_addr && sys + len <
+		if (sys >= priv->mem[i].sys_addr && sys + len <=
 		    priv->mem[i].sys_addr +  priv->mem[i].size) {
 			unsigned int offset = sys - priv->mem[i].sys_addr;
 			/* __force to make sparse happy with type conversion */

base-commit: bb840ea69347aff7bde5a208e7b5b180669a7656
-- 
2.43.0


