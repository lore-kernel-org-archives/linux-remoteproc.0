Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009389;
	b=tsoFfTD5wvvNFv2kfmBp7Xbrj77/byApal5nLcWky20inguetxTpXWiwi+tzONuAzIu+
	 0DFlnt6QUlLFYOwgeVjKoLs/9KIpSPvlV1QjzW21RSihZCQ4clVQJjKtuGhBN47YOKOSW
	 7dZUfJDAmpMobWy4TjAT+XILGmlZmsZZio6jqFSsRl7se7yhhVumgwvK01t4P2oMUatii
	 78+5aAx88aX/yRNYibtNkTJ2JTdsuY88AOCNcj6sbjLYxGELOBCmq/z2eS6gx85SUhFTH
	 qR/KKphwhMAjkw47lG+OIXdd3W8qu4VsfZFexs1iXOzoeH+Re3/2pjVr40Y4mxftdSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
	b=ZHk1sYZyB6TciZ0LSjkRxfck8AimIwa2p+livqRkhDTBmwp7xOoteX3JP8OyxeONV9Yr
	 nYKOTOhZCt5/ESuvkgnkIpmTKVEMQSt76ruiLLZX3gh8BG7UDgMiHnqmfbRBOdgTrhM3o
	 QeGBV5qz5q9y+jy3ImG+vlUslnAvBdOw3iXhewojJcff7DiK1yfau66p5yCZprlAgxOcl
	 9gWQY3QrvQR6H3lqH8H50TOWw+wxT5gmP5HDfK+urHiCq0qLWUK4UQOxQOqcTFsbToE17
	 h2Zx2wgiEcxdFZJMBO/VGQsawQuRLS/Vriuf95Cl18256NwEzkEcszyCfaQ0OqaHa+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Eo9WE8Gq;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E61606A320
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 10:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E61606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Eo9WE8Gq
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so16761435e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009387; x=1793614187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=Eo9WE8GqJeRIO8Yk49GNUKL9w8HO7vFAifgdvoVxif0tOBPZwwU7fcZcNRgcAsq6LT
         +XADKvBjNiRsO1ZCVV9uJhLBsZ8ja9Q+OysK9Q/RyaiaUejgDsAaWtZydNKwIswVGznI
         ag4NQl+jHWeGZj6kfYmGS0qu6zzKcAdTIPqDk6IhM0AL2kuhOx21RYyKXiT2W0bP6T/E
         4joixoz/+C1n5AOQxRj8LuvirLbGS37PrI/dMtR1QEPMLLpP6vWjHOmTxXzGqsM8Ua+j
         cA5eFJLO+Y8XptHfa2gtcCSFcwKXcv2grSXuezNMoXCciuWgIuRhH/bMZn5WNGIR4Kfa
         hVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009387; x=1793614187;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=E1bHoGo8DLBmHjpRVzc5ZiTijRznm2gv+HF1yHun1XHlOtDiG91HnB37TJqIOa1pV0
         e6LuSLtHTM5k4U92BpPJ8wtpL9B+r9Vg622WGHrsEB6ReE8IIWZ2Y4Ifkvle+WohgR4H
         GlKSlV9zOyLZWWjJO+PC/OPRQ9B9tEwozStipZFftFhNeTAZd8ACqLFG5JarrzLl9hUj
         Z7NNkgWxNyrPlj+GWpOiwV3bzmYHeAff+DvcohnrSPAVKiLm3/yc9JTqhDZJsnDyZkL8
         hvZi9JWI28/mHYa2IlZ3ETKOBAWmDgjbvD3MzjOAuhySiMuz5N6KCa2sz0L7bgJnLId8
         0qEw==
X-Forwarded-Encrypted: i=1; AKwUvBx0W+42l4htqZcfhoYyMFOsk8W+AzL3e3+0LU1YLgj8i9gQWfqeYR9ragCnZWMHOi00WDuLX9FKo/ods6IRguBu@vger.kernel.org
X-Gm-Message-State: AFq9FYKrWrA3z96zSKKDsv7PpvLukebDQgXxrNemvDOdike/gPt4oCQn
	WzOy9SKmtisPkTfYXnNBBX0Va1CgCOGirlB00wCyH3QkATyWTVoIn4FIZrwj3MR91ik=
X-Gm-Gg: AYBFou1vayOiOXRHtNqteL/XNLzZbdIc8KBZ1ZYjqmeeW+z0vN4pkpjchWMJU5TUKmx
	I0crgjKnThn0NWowbzHkCGYmQ63JXh0U/J8CoFTko1oO1+diK7U2MYweotmxKI/VdVDqJyqdz1X
	n32k8aGVWf9zZYCFaj7/ijCgq+vD3HgGJdhQEUN/9Klycf9R0jAc1zL7YsoXJi+2UEsOU4opcu2
	BNn+4BWghHdIM5l34czsJqiSOHaVDqIFV8ln0hBscDd/EOWH5gosMqxoH8pxDa624OAgrSK84YH
	J8IE5DRLfsjHslB4kwlVae1Oc2OX0NMh+cGhWO5cPNS5pJyMO3jig/iZsAyiiY7E8RUTKab90bO
	zylg0xi0rBMz6py41Dq9lQoSjmgi9TEy5O3ObkLmX4jNYlxcxqPtNjn+aWBggeDtNeATPE2Q4GW
	ER5a6yYn3vsri/Dz9AF7KcQe98j1AT5L6z6rcIdGFtteAqie3cS8y30VLvh2JL0JMvbsIAzVLz2
	jVJ7fAi+ilKJc+hAc9O3dDKWFX5DzBCKduEGRGQ6Yz2jhLykK5lrHKURD/d1+U2Xp4Y3QGQPPsm
	WqzS5Icsn+JUdTyttf51aGnkWkGk9ED85QVxNPnw7Hw=
X-Received: by 2002:a05:600c:c08d:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4a373be2a68mr73417995e9.14.1793009387038;
        Mon, 26 Oct 2026 03:09:47 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm178981245e9.12.2026.10.26.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Mon, 26 Oct 2026 11:09:30 +0100
Message-ID:  <4757287789726692e13b141b3b2af5245ae17e30.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4531; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iP/a86pijHCRmv9wBS5FEuq1LQ6MVYUXu9CglvvJMck=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3yberBd3EQ5Kxjbd3sOQabalehlLr8is9shUn Mr7VDefgJCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m3gAKCRCPgPtYfRL+ TnoBCACmPXG59pHH37OKjk0cHYhrDhchNp4kPrX3S2palkOtr/leAierbz+le2U+7KOrhvBU7KO OP80a7baa8OKpNF6noVMplFsMaR+1zwsJh1ljDSDNIWaTCV0iSh9ffxQCGITsepdNgcKiJx2+8Y zc1UyNiNySdsVvA19Uob6xHpTkz1UEvdmm9MBU2AU3FGEV7jED+HEIOSLn0cTCC/+4gMJcR5rWz VpfXJVB8ddeqWCanJj6J9nA9f3OrlROMm3uV8+Y0L6HXRJFE/0BlFpH0w+RJlUii6GXn0RG4Ncw M6aTTX3VJ0mn53FOzapKvPhm9N2hPV+DrHOkOouTEGWRCUN3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data.

The new callback can be used to implement just the driver specific
memcpy + memset to increase code reuse.

The patch only appears big because of indentation changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 63 ++++++++++++----------
 include/linux/remoteproc.h                 |  3 ++
 2 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..0698bba2db89 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,44 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
+		if (rproc->ops->memcpy_tova) {
+			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
+			if (ret) {
+				dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
+					i, da, ERR_PTR(ret));
+				break;
+			}
+		} else {
+			/* grab the kernel address for this device address */
+			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
+			if (!ptr) {
+				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
+					memsz);
+				ret = -EINVAL;
+				break;
+			}
 
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			if (is_iomem)
-				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
-			else
-				memcpy(ptr, elf_data + offset, filesz);
-		}
+			/* put the segment where the remote processor expects it */
+			if (filesz) {
+				if (is_iomem)
+					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
+				else
+					memcpy(ptr, elf_data + offset, filesz);
+			}
 
-		/*
-		 * Zero out remaining memory for this segment.
-		 *
-		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
-		 */
-		if (memsz > filesz) {
-			if (is_iomem)
-				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
-			else
-				memset(ptr + filesz, 0, memsz - filesz);
+			/*
+			 * Zero out remaining memory for this segment.
+			 *
+			 * This isn't strictly required since dma_alloc_coherent already
+			 * did this for us. albeit harmless, we may consider removing
+			 * this.
+			 */
+			if (memsz > filesz) {
+				if (is_iomem)
+					memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..ffa22c2f04af 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,7 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +100,8 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.47.3

