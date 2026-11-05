Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880010;
	b=0MGk1Ds1O8JXW1x6TdZZ9Hb0w4gva3VEjz54HwujmQytqXvLHJ4WrDw5cpW0HqC5oWQU
	 kzVhqd/hrXet7q8iIGnmDhBTrwA82bbeCv+QkGDzb6C/pauQIvxYa3TXb0ZhLD78SQEpD
	 viPchj1QnFxEoYXcHAIBFOxfCGS9h9M4IHwX1BqbGgkywAMyh5QMsvkLnzjbw3y3T/TnU
	 NoOvJpty9KrcRMjyDP+uoRc73MES1IpXi+HJsZ65ipY+B8cNepwpxNmh5h+YCae98/jEi
	 7BFOy3w+MHW2XW0DqY5W4rBrZ8qRoLVIIxUHVFWgxKpHiSN6Q7EL6nU9sSEbWYd4vig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
	b=ET5TzMc0ejB3Lf9OzFIv/dsyWQ3KJVun1WWCpsSheIiQRyjp7XilQJdooB3d6mJaUrtN
	 /qvSaS9l23/cS3VZ/KQn2yrkI74WOD22SukqmZZdE9Eai4/c9dF6xcIccriSc8M26xOKk
	 wW38U9CxZBOvPBURpyvx+t1yQ/uZ2Huwr42K32b45mnQ6s58WdYOSTlfM87nPO05HLIcd
	 y+rG9m7X0jFzPJcoIURUettpiJEXdZUUlfx01yuB2Sjg1SqjxSnA2sgjwwNDcnNA97WyS
	 O8ea91woJJKCmIb72g769N7cezXF9UicHFKuRMcviCHKRXDdBBmFz78SdZ1PjtJ3wRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="jvY/SLVh";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A415606D81B
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 12:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A415606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jvY/SLVh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so20986105e9.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 04:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880008; x=1794484808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=jvY/SLVhKgd3DBgBniC6Bqx6sY4lsKOUGenPF/zq/ltlSGmnxcG5KNIfny1uzseiMC
         YztkY1o4+i5iw0Uv54ksTjrJq4P9mbMz9F/JtUuOueAYpFPl/omX0/RAoUTERi03DEDq
         4CpyjSTb8EdayAF0hRSixBjsrxfETgA2phpKs8367oXTnXHogjbCo/D3Gur/4EGuA6J/
         10FkPz2RJfIGKrCA8DU0GUOJKxX4XgSzQEjn4ftJaLEN3sqVgMwZazQ/M0SV0xZSwmR5
         7mECUybUAgrMpiA+G4GrTtPiKijjy8ensEBov3fDmUErhNDTdn40a0os0hoENS66b1H5
         nSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880008; x=1794484808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=bzqavAPscteL+R0Dx3BjmZiNJVgfMFuOyzZBbU7vWSiG6w7CBFkUFnc+QZXl9a8iiA
         pi+PS17txdW/BBSof/UeZPFRkKvkWTs5fF2V1apzkdxhSo9+t+o6+WhCU8zwUVF7ZAT4
         3dzULWeBMGJFMVLnmKY7AECB+4Hx2rRWyMrVseT6qYV9j1JlUCOvrWm5tgcHvFIa112q
         L+3Qe+p8Qr9oo0D0zkz2zy/CEHRcVSxsRHqtYudpsmQYHU29p2sDo3MgDx0O8ZTKk6LT
         aAbnJbvYON0By7f7JQy2uH3p87K+syMfe8rFtZGfkJXahR41SoPukEJOoAHr3Dxz+rKs
         VkOA==
X-Forwarded-Encrypted: i=1; AKwUvBzNv20psnxAO5aRvUG9zi0kU6H3kqNbhTYRbjMC+fDStyC/Yt14hayjVNEkHEHYUjS7B67xMx15mC5zqVM+JbyE@vger.kernel.org
X-Gm-Message-State: APuU4Z9ovOmZVLEODiifPWGg1pW6dotQnYuOhkZyJgRQwUgtusTx+yO2
	A6FgJXPqsqnh9F29q+1jQ/8jb4lfGfwdz6xTV2JGpCsXZLjYOfzjhZk9/dxIiXSWfmo=
X-Gm-Gg: AYBFou21ieS3RMzpFp6jMHNhZplyehJN0zSgP1BNBbihbAOl+pQazd6wQlwEZF7nnRb
	MqU5W3Uq7uJlmX/DNLvDAcvBnaldkNsTf/ewvgzZ0PsGcNz5JO1iJzX5prhXdSOxTJ9U8gWxy5f
	LLBi3RbFDtAkmA845sv4yM+qyffjjT14upF2hbDw8B9n+TrfTmW2ljusfT6gPk9XX1MZrDb6OG6
	fEKILcS7muzN5CWdI0Stz55Pq5Rdg9yBYzbUgVdhT8NNqZ0yoVxaF6/s8KvKGXIcsUFNY0gtrkR
	K3ilVkdKUE/scdp7rH15oDzLh4+BmILndFXxWLtCjMbIy8bOK7Aqgb4iaCYyJFyZzE5ZN+WlFCf
	nOhsXq34GhuVqCX1rGzr4r53rLf+s5GMKFkyB7qTHWf53fQnwlHxqHDAK/XlU7eFSkrajL1uIMm
	zmZUguB3s7sq8zYsVJqZHBAXZaEk8KFoQofw9QWcaxG3PWbNKdSYDaaHN+DYTcreMgk8/dvIpHw
	yhAmjlph5U7EtuwaDFdx3w8lWHdUrc1XIpNqbtdrSp3fUIfrxHYaf0MM3iuIVCAzQUgiVCs5O0O
	vANcZTBR4D0NmmxJ7+NimG57IABLho43nERzM6nxoL2QHMGfFuwf9qWKaKLxAzB/tkmSX+SORGi
	g2G9uslcOa5gOVjTg
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr439771995e9.9.1793880007587;
        Thu, 05 Nov 2026 04:00:07 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b572bba207sm57515205e9.10.2026.11.05.04.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:06 -0800 (PST)
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
Subject: [PATCH v3 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Thu,  5 Nov 2026 12:59:52 +0100
Message-ID:  <5e187f338148963ab46454f367551aab8209c3c4.1793879714.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zxEn3GKmjIkApottOw2da7a+5Ym3eFer8LHtbjoIoLM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+7DhnDwRRIC8qtXfVeHqm4pTsPOGhHrwGyK IdEPSeorwmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvuwAKCRCPgPtYfRL+ TjXBB/wNMNXXTvWrrWPBibs4j3OlIMqcZVQ19fZYj8o76ykEh9/YhJfVtNSsaRnc6GF483NVwwH kzY+UoSVFv12D9Zj9anjy2qrzG5EhQMNwUSC+VXgMmssVLYNj0dsq7cppE08gx7Q0qDGqmDebMB IV66y0m7uifq3HOpcxlVI447ZR0jT330UVNWsHnULm7Ji5PbnMFCXicR3EAvIRgg0ylcXQ6GXX2 S5v+Q5Yr+uKRCLNRLmMez32Ltl2FtVcFxGXmcDbhDXt+g/DXc/ss6MHD754CbOmuLQRGi6urIGw VbImt9FKYfcOLqKB5BIZ1k/zwKYD2BriV38Ql+K27vJZj3HZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This callback allows to use the core's rproc_elf_load_segments()
function instead of reimplementing it for very minor changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 120 ++++++++---------------------
 1 file changed, 30 insertions(+), 90 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..324c10f18507 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -864,97 +864,41 @@ static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 	return 0;
 }
 
-/*
- * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
- * @rproc: remote processor which will be booted using these fw segments
- * @fw: the ELF firmware image
- *
- * This function loads the firmware segments to memory, where the remote
- * processor expects them.
- *
- * Return: 0 on success and an appropriate error code otherwise
- */
-static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
+static int imx_dsp_rproc_memcpy_tova(struct rproc *rproc, u64 da, const void *src,
+				     size_t filesz, size_t memsz)
 {
 	struct device *dev = &rproc->dev;
-	const void *ehdr, *phdr;
-	int i, ret = 0;
-	u16 phnum;
-	const u8 *elf_data = fw->data;
-	u8 class = fw_elf_get_class(fw);
-	u32 elf_phdr_get_size = elf_size_of_phdr(class);
+	void *ptr;
+	int ret;
 
-	ehdr = elf_data;
-	phnum = elf_hdr_get_e_phnum(class, ehdr);
-	phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
+	/* grab the kernel address for this device address */
+	ptr = rproc_da_to_va(rproc, da, memsz, NULL);
+	if (!ptr) {
+		dev_err(dev, "bad phdr da 0x%llx mem 0x%zx\n", da, memsz);
+		return -EINVAL;
+	}
 
-	/* go through the available ELF segments */
-	for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
-		u64 da = elf_phdr_get_p_paddr(class, phdr);
-		u64 memsz = elf_phdr_get_p_memsz(class, phdr);
-		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
-		u64 offset = elf_phdr_get_p_offset(class, phdr);
-		u32 type = elf_phdr_get_p_type(class, phdr);
-		void *ptr;
-
-		if (type != PT_LOAD || !memsz)
-			continue;
-
-		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
-			type, da, memsz, filesz);
-
-		if (filesz > memsz) {
-			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
-				filesz, memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (offset + filesz > fw->size) {
-			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
-				offset + filesz, fw->size);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (!rproc_u64_fit_in_size_t(memsz)) {
-			dev_err(dev, "size (%llx) does not fit in size_t type\n",
-				memsz);
-			ret = -EOVERFLOW;
-			break;
-		}
-
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, NULL);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			ret = imx_dsp_rproc_memcpy(ptr, elf_data + offset, filesz);
-			if (ret) {
-				dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
-		}
-
-		/* zero out remaining memory for this segment */
-		if (memsz > filesz) {
-			ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
-			if (ret) {
-				dev_err(dev, "memset failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
+	/* put the segment where the remote processor expects it */
+	if (filesz) {
+		ret = imx_dsp_rproc_memcpy(ptr, src, filesz);
+		if (ret) {
+			dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
 		}
 	}
 
-	return ret;
+	/* zero out remaining memory for this segment */
+	if (memsz > filesz) {
+		ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
+		if (ret) {
+			dev_err(dev, "memset failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -969,7 +913,6 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	struct imx_dsp_rproc *priv = rproc->priv;
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	struct rproc_mem_entry *carveout;
-	int ret;
 
 	/* Reset DSP if needed */
 	if (dsp_dcfg->reset)
@@ -985,11 +928,7 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 		}
 	}
 
-	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rproc_elf_load_segments(rproc, fw);
 }
 
 static const struct rproc_ops imx_dsp_rproc_ops = {
@@ -998,6 +937,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
+	.memcpy_tova	= imx_dsp_rproc_memcpy_tova,
 	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
-- 
2.47.3

