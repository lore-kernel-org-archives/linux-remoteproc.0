Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880008;
	b=fyPuyVoj38K7LASvN4s9U+/nVDCO+QVVFco0ccnVMwpXvBXFOADbHQFOEGB+Q34xKl9/
	 8/84uuNGDf8inUMpdvEiZUcmuVx+UtZKm0V4O+z0byX1B7uylHXeUriPWhVEkjX/cPYhy
	 1eKNAgXdAz4MCtN1bqfpdF1LofRxH4hUoYDuNVbYjW44z46KyFn43VMXbbQf3ARfd1dvZ
	 /C9YUSqzOJ1RCipJHHEuep0Ek67DmrkrLkyT1YwN1UJ/WTlx6WLc817s+eGRm52RjfgV5
	 5+6Lt2uNdvC24JqlfFOG//cfa5PUArLli3VvOF4Suvv0cJgvuy9NUIubNRRy7tpS6zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
	b=iOGj93hGsggmmjmSgCEoOkBazY/9NLszcT8YJHq6DeGcn+cM9OGQuXsmXVRoa21anPD9
	 VOZMY70an5krqT8FY9qtdKTR1yUeqILM2yQ9QD3CxmzAU3tc3c/dfo1hXXBXoA3icCv9n
	 z8H2nnYksBei1Lm+xouCOIwWPt1y1Q9C4j4cc+lGarYj0Oc7AhXA+/AI1a5aKmzWUvOe7
	 ZAKX+Elr+15FcQ3dG3wiGxDryCxEYCS2n1ltSuQDb76nt1FcAc6a+2Ncb5I/0NPg0vjqW
	 j1WNNdnuimKcaYA3Ajtf1wZ+D933HLS9WAQKT+Y3Uc/unlNlSGlfaMKYrNZUM/xlLag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ACIntLEs;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09B606D810
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 12:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB09B606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ACIntLEs
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12595115e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880006; x=1794484806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=ACIntLEsyxBxKA0gcYb8VuqBqXXrQ2KYTGR+7ZtV3iHg4P3w2wcn8bEVle48vYXnu2
         e2+zndvzHtX0yKSoc0Y9dcYnhfM3ym6C+gZ23mYkG+818nplIb4MPkhsqDUHSJUTytU8
         pO52J29qFJ7k8G5C7zfWLsTr//nsiiUp2fvcK+ckRyFMy0pj/fbZIA6NgXnVzFLvOjuX
         deXgDB6LolgVysDAfVpNEoAjMfbiKUJkggHRnlhhmuucxV3hHcHnTnu7y4dEpdzTGxgE
         ZCew/+eUousg9QY+ujSRmkcmisxOSW+eZ/Gx+XzOda9xeLgX9SB6i6rhd7vr97FfWotf
         SYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880006; x=1794484806;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=Telt6dhnsaOrEWPCsoiBW/vzAA0glCyOf19AeRbbAVWMjahLdnCmqg3FZIcNBXRK+j
         1iUR9GyC3dmoZKPICGv85MKK3kcWdGFf2YDJwWTLI2gQf8Z2qk7M5JmZvk7OWDuEl6t8
         6VMwJ95lzVJSRbswUvZBVdN6hMmMnaBNHinERCw1EJ7KVPtI6RdAwiq/Uk4WtSqjytF6
         ndGYoWF51BgfR7gKtCChs++dBEzJca0ggjQ5r0Rmof3LnrOJL6gFp1v6E/FOmCRgnd7Y
         UpFTZ+XykfqY28wllv66mCdnQ6C3PhJ6F9yfBqaO6JmR2x4wXKxh/VtEsp4130VbEE1z
         2OrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEosK7amKSdXYdIWHuKM0uy8M2oPVJuaKsP1SLLrrcdmehV/lucJdRYBs++fTXf8w6Ger/XEM9Y5k8OMAiet1W@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oq3PMA9rbTZuXOqnIm3wlRgJInDXmuOi1t2g90agtzxlBGhzO
	MGWGMsokJvzva9m10mTXCatef04/2SYJwTkkvdohV4ol64F806fYbIo9ullK6XU3PmZWYeooiCl
	yY7UxZlU=
X-Gm-Gg: AYBFou1bCFioAc6wLGSXz145x3J5tuwjKYm+gXRpATOCnZydVYYEbvMcWzm/YPIZiVn
	ZBVqO1XOEdVFqU1AqdB5wuTXkgEIBGu4En1dr6+ExTd7/HpSidnWsjjbAO/3uQImzy+9DWbsvEH
	r2gaetuPUhf1rKMd9vdx0HxR1zTvY6vp1f+F6JIyQ6xJWUplJc7CEljQa+IaVhHOYJUOYqJNfc9
	e7CPmeXBkmC+QMhR/yHRI2Orc02BFO+nnvBHU1oRP6Y/K4362ktRfjfvy/BXbd464v1y7w03i6F
	+EGUekandtm3mkBXXoeuNrnlDEZ1mygq379qeXqOewNzPdEDAW1ksTSLTaaaR17arQvhY4MIq9h
	i4zVcQF8BT1pSZKLk8YN4+f4+rcg6TshIGIuxbLAEuKwtDKfMKNAn2BtS5pbRcdTgDxOA/W2s5e
	VogS7YrUM79V+JL7CnuCIVkQsADSTpHlEB4ollTGqNxTqWllDSLiAqhYp4yz8+ogKWhIU9MRrIq
	ER7yjJM7gWNo/cAEgzvKiwe0LQWwc0R4Gmv/rbOC7Poi9OEHpoRsGwSEVXVOrU+nzzxpbuH+2V3
	A1QP2VCzMVwkX5gA1korGKxGQg7HehjzSoM/n6r1X/Np0usXE8nz3lS5NTF2FHBW/caJYNQqCU/
	JmMegZI+TKoMEHDWE
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr436813095e9.13.1793880005590;
        Thu, 05 Nov 2026 04:00:05 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56fca22e1sm73091395e9.14.2026.11.05.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:04 -0800 (PST)
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
Subject: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu,  5 Nov 2026 12:59:51 +0100
Message-ID:  <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Z/fCIVp9RMJTrReXJyUJn6ua+y9sBVz+x0H7XlZvi4g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+5Gk4Q8ATYuAmIR9DTokmwc///VvCwal9RT 0Q+SzcLu66JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvuQAKCRCPgPtYfRL+ TnLPB/4nC79lPyLlqp10Q5F7ECcaSOk4HGB7s1h+upM72K8ZIRD4qE30eRuvw0eeyDwVqAIVE8p BAor5pNJ+SP4kvqA2oIUxtFqWsFQMOxAsHbfHs5DcCYjvyyrDc+f72Ax3/eiQg3x02Zbstqf61+ knGCo0cgViF8bSvnRkn7YdfeAdRWO06P7TUfGt6LakU0STGCVNz39MGsiVTdEqzYERqITokSStT zsuoA51dTkKAnw2B1nPeUAqItS9etWoDQCm9xeYoCPk+vXUuMUVleKV55rUOUBSljhUqx/CEgAy hb62FNMp4EmG3KK5vjaTGyiCyOvEyljj4nM+fDYQrz3yepib
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
 include/linux/remoteproc.h                 |  4 ++
 2 files changed, 41 insertions(+), 27 deletions(-)

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
index 00019b1895e6..e750a127cbc4 100644
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
@@ -99,6 +100,9 @@ struct rproc_ops {
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
2.47.3

