Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483603;
	b=cOx3D1itMGQK9tbnVZWmMvKg+WxRz4JB2GjTExgxsjiqGIeWmvitvywynETU/QfBqAhZ
	 obIRKD5oFrCOUyN9UrwT6bT8Sc8yPt2upOLy2eLdXae37qW6HRZl8u1Y2I7lbSliocgAk
	 0XF39dh0pKzzOlSt6UP6sTa4U+x5nOsu4ys/MRQm/c0eQtY50hxya5ROhbp4AcC8Fupy1
	 zbeoNxqqRPQN8kKKz+ZJFaG9SEZWA7Y9ExeGyN7/GORso9+4sLsYNVgHersJJ3JSdu3bh
	 iS7nZFVjuR8lk9AjOy1wiPXhBZ0uBy+Fnp7rg5kLn5DHf8Bc4M+YWZcOBMuhSi1NgmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
	b=It8EtlQPkTOFLKbm3hPRvb21aw5S5Rc+YeeKTiK/2o7Worj9YgrtPGtMgQnQWJEgxm8Z
	 6p7t9ZokGdE+G4NV9RuOve24D6aaXfmG/3594EhHRMc6yFLeLpdTF2i+iNfgPv9qSU+bQ
	 SjLgLPoCc6SWh8o+HHsCUTUz7llOZYhDOjOFRkiqp0y4CEcjJJ+JEFw3akBUmcXbCxXTA
	 KgZsk81phNDb5kNXIyWUsUOea+QR2iOkxIXbgtW4hj08V8kd191TjUbXIPf7LfBze14KX
	 a2byzM9VdsP0Fjd0XJGE0arDuOphoYEv7mnkTPFzSjFwU1sw0aLFy8wrN3k1OWWZg0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FNsAWrtR;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E9606A88B
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 11:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20E9606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FNsAWrtR
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2389417f8f.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483601; x=1795088401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=FNsAWrtRx1l04zhrn2VFFerBVJdYlz6fHuvxZ34YaX+EQkhbOu2BcJ+tKlPnmDAD/l
         jFOWkOr44xOlh/vPpEvUpeib0bshVPalquusRI3Ot/az8lIJlwB9SWXCPKlvhDvWddrJ
         UlU4dEPog2mpIVmzCQ9Rsgq5bNx0Zv4vnx4RhbWgv5IxN53prxESm2e6mmERnQY7m55k
         fohxVCD6D47hXbU8NqAepLtG+sub92u+2Vs0FKlmcAd06jLInMedsK7BjWGFEVLBx2uj
         QEbUoo67RJpXq5HnFHxI/o2AvbhzbXRLoiXD24TGQvu2Rxt7VTCTX5xVs+EZZGPyaTdw
         2emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483601; x=1795088401;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=SctQHZSJ1K+ffyr351wmWRUk/50ed0rQo39d9WUp4oAdLOKqdTbpKxwcsjUv5ZO+IN
         tJm3Xb0Fcg/aOKmHjxjPIs0IHrFoeKZFLKV6BFRVjxQOLW434BsPLXG2cY+dIGDbmn0d
         cqJvAK+RvxzaJ1uZkmcgz6v4iD44cJtiJSZKJ9ZE7qErANcK2cCAhk+Ftgu8wZ7To8FH
         8ssElKyBYruAk4xn3Z7p/79spyu1f4f+5MYA3N0gQexT61DEB4AADgJKM2QeLyltSibL
         YNrQb4xSfk91+Umk7FfC0NvbBOtHVhJpD3yh93/YOKKqEtUvM0jCZ/WPxQ8n+92Wuxpd
         2Pxw==
X-Forwarded-Encrypted: i=1; AL+hErET1kvcwkokRcDQVpC53n7sGq6PxN8e1Of2XcK2xgHbHZ96G7v3ujk/MsBncPtgi0DH5S5XeB5FQgwdaEVzJsyZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/8QLiKHP1s9BeJ0TCOARoXCgu/CDLYgL3MUjyaEU0J8UYCfSw+
	pZuwg/cshb5zTLmNxQAWxD+hKFtdAVopv2GuQZpw8faK4kwNVcDM3SXzVSeKhhbiCAc=
X-Gm-Gg: AYBFou3EjB2wFV+m6W8MoE5/yzZMeHBsivJfNzty7OQ1lECz0C+TO5KoC+suhrWL98d
	uRE6owiFRizEEgydDBx5hYR+wfCC2iKXppzozQ3F4XBPMfVCenjKEvyfSAgTf8UZb7weelJsRKc
	gxwefXYBXqf0OJWgKLhV4sTe9WkvRCFbEnH0uu2jorTV4QL1d/Uh4d/vRs+x84QAxFDJdQskSCR
	Vn7efGQPJUba100mEFZuBk5i1GZiJ3e9lcUMT++QZsDFW71mYDzckJdTeoLn76503J7V+tRdwiL
	Jw3j0bcwbq9O3EBn7GuB7dG94Q9lJczEiUfMRDHLsQsy8KgEABO98VUB+g7WPlW1i7FsF2DjyG7
	gMGQ19fERykmJCLr0NakWi16wM/GZQ40s57pPgJJJ8G3dfsNgMPYhukdU6sa62f08bj4va/aZbu
	5zXEFtiCF54WQGatm2jYs510RWef9trnvVeDBmOF/K5n/bDvoBAh85gNDhQHiY0ikvA9i0UkSPU
	QbLtNTviDIVfNldznLTiCxXDpDzpFxhugkoL9kD2LUL34WI9lqw8bOthTEJZslTbB+OeHhjA2zk
	mG0Mg171BtF56XfvyCyQf3WjswT0F42853ckO/jhaSxICeQDze0Qz8T1j4fv/aI3nA5vkiSYj/F
	PxNad81VNHhb+wEgQ
X-Received: by 2002:a05:6000:40c9:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-499c83c0d12mr9610739f8f.38.1794483600775;
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49836b8eb11sm17512463f8f.57.2026.11.12.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu, 12 Nov 2026 12:39:50 +0100
Message-ID:  <a6e3206a90f3be915a57a7497a34ef97f914b340.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4986; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N+9MpIEOMHu+xlJxUw2mD/JXqfJF1eqVB7nMk5Eh7D8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV2s8sFfFVOC95VOupA+IXP3fdYI2xxC6vn/ iHUWQY7n6qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldgAKCRCPgPtYfRL+ TvLzB/9SAwbizeNpaG5VX8F40ZM0gqXMvkPFUjPd5fWsSsgflHW37D6qTZi0Hy6tMwfOBRx5FL9 z9329gZpkYZ2BO9TlrhlDR0n4EHawZPES1yyLw3utlF3vt2kGtlaUK2UPYWUFabDCoXF/9FBRb3 4IuKrl8TTSvOT2JiVFtlLWqK3J9S1obd1J1frD66oRhf4+AwrFC5uXbxHGRqvPMAfyT5/fAYp8l QCzAhRxPHgvizEmswaldebcNk1c93h9lEFeNniN2Da5oG/C/O49s6x1CymDFlrkjuOO/9yRaICZ GRGNSBNYed0GgnudxNHtbGspOPm7C2RXZURJEsbgywCXCkfZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
da_to_va() + memcpy_toio/memcpy and memset_io/memset isn't suitable. An
affected mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data. To
cover that usecase don't keep rproc_da_to_va() in
rproc_elf_load_segments() and let the new callback operate on the device
address.

The new callback can be used to implement just the driver specific
memory mapping + memcpy() + memset() to increase code reuse.

The patch only appears big because of indentation changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
 include/linux/remoteproc.h                 |  7 +++
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..3c749a39e5da 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
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
+				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
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
+					memset_io((void __iomem *)(ptr + filesz),
+						  0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..165ba8fc1d88 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,10 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
+ *              The objective is to copy [src...src+filesz] to the remote
+ *              processor's address da and set the remainder of the memory range
+ *              (i.e. [da+filesz...da+memsz]) to zero.
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +103,9 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
+			   size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.56.0.rc1

