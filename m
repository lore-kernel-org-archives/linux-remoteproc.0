Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118344;
	b=ac+usvbbd9rPDGgaXyqhbvBid0onkTlYtCo7nqFy2G1OFXUBiabah4HRYoMdf4fVgpk8
	 ZpArT9GJvvRAN/nUcqekICXdZGQmQbt3kyyfGnwpLf2lRdUsWRtGDjWh7z/uV6dJHeknJ
	 8PjkLCTytCVzOXD23KJEO5tZ9V6dQcvCbyHV8n/wPbjvnh+ZF0OLLpv5ZqVVWP1nzh3EK
	 zEBsVOszfEGFWbNtJRde9YMDBDVWaf8pjn6cRXPauexHjUEcpyWYrPjMwJM8tKtXRRyKi
	 ssyxTJ//ENjIwIlGIjkO/rzTq22LzvJDd7NzN3c/brnHDPxWmjw5vtjTgF+561trUrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
	b=xkdimcRti4p5dkl+JnU85zwwOkD/hccyDprgsiFGJAJChf+k0dtelQ73MkwzcFGk9w1f
	 O26M8migKQuXZtg1G7itBb3U11PnZfhK2P41aSj21c0f4k62/TlzCMmKqAPu2s7vMqZ4Q
	 TxB4ok55GbVLjWX5LSr4kwxkq9vNiJMAlkfIRNAL8K2xU8cW1THYD+gd3bL6CJ7qSI1FP
	 VVGCCD+lmHOfhV7VwOlJElcux6ms502AvOFlTN6By+FFFdVjCzJcGE+9m8wOT3T7Mp+Je
	 rHfmdHMXFLVIZQ22Mvpms1MPahe/NvPbnnv4pHvfBJS/vtrKl8phWHUl0D8dTd0TQrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G9EGb+C5;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08D5606A33D
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 16:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08D5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G9EGb+C5
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso113825e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118341; x=1793723141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=G9EGb+C5NP42kcoWOVWgpNJEG5Q7GcOrpQCaZJucb117xrAfPruC/9fRUoLNkQgiYS
         NTQsYg6gy31DPkwT6WMOmF3G4za+hpTXKTkfdDEiKfZew2X8A+xZAHBS8nq+SqVnb+C5
         RwQ2f8z6lFOx5ie0e1WJluCYsw0lwrFurob33XlgqgnftvJot12Qtf2JLaNbpb75GPKn
         hzxLBW1esKb3b3nBxUSoSJkxnuSwiTz4WZx17w+h2NUPi3EYIEhI0Mt1fPw6qeswjLa6
         o6s61WX4sbbF8A4FkimY4ACl+2Bf3YZm3yxmRl78JJkH0fgBtnjQQ30PmtMPg72L2Lu1
         QllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118341; x=1793723141;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=R3rrOGCxWokZKTawFAs2yZwzaRFj/C88W1jtYgcRlPEcrOKQ8VPvQxoUApchf1rbnS
         r+9yvqC2OP8pdUwQNku/iLLzZtFhT+S3y19yAwxR0W6QvP6k6HHFykHKGEF53SmgBFdF
         4Fie5LF1/U7MYSrHKdq0nOMs9vq5EgcQffMgF7l5G/yWz7VbmG5OH1486b88C2nGlmWH
         RFv3pB+gmwurgM6RbVJ4RBxXQmh047aur+ialAyjYoQYfTnWYKb9Gn0QhIoT78rZDVao
         qwCX9EUz3u2CUEl2gISXdfaocxacMZStIN+jsYl8Uf09ZfVKNFBOWGbGQX4WsOyTBP9w
         AXcQ==
X-Forwarded-Encrypted: i=1; AKwUvBykZvmmBv83/EUQpbekiXg2E2mgpx4gyzgkaqFoVhEyxSfym2vbj2clIwa6yuOkEs7Uf7wAPQulCnRaVwNZDcy5@vger.kernel.org
X-Gm-Message-State: AFq9FYKLFiKQNuEd3ceLMfAiaNG0wbtrMxw9bPJ0rVAVkTHa1xlnsHq2
	DoJ3Yh0wuS3lHMGIr4N81CLve4HljnIiaAzGT3V4Q+CSkaUoGu/qcNKoM0/1RaSVeic=
X-Gm-Gg: AYBFou23B91e13JmDa7ENc/ADYLJ8whJocWwmAI27sOmcjbQFezeD6t1V7EflRjxq7W
	wR8eiLlNc40+pK1zT8691yXRACU9eRNhWQrDaJ+d/zsz2XfHMTHxV5aRVBE6VMx5bymvhd8XGlc
	BJ+JNGEW7AJ0zbL78Y2mrwwv31NQ4C2R3GSl4GtEiN4+9EnQI5vNC43XwLHGkZPUxH7RKSyENuz
	njufxRmV3TzLibscF2Tl6I4C0j/biY/0cLp6pi/ET5QD+y5k6YOYfjoCaZgcYs7nRqYIdgu1kr9
	4U//7RzQnl83rXeb1KBz/fd/fnL0VU3Tr4eN7xMm9DTYSSsZdofbT8iuy0suU3SWuS+PiXgT+Kx
	zUG5w/mxMeJvlRieq4juHWef6paKfspPYT3m0GDjpvdHV7WhIljnSlp6JzP0WrcD/tGz21HowWB
	KwIY+9vDVZttcWLVJPSRP2sW2uhdjRKMueCGcpFfkxS9TpPof8XL6Nn2+TVp6ndgRtvG3nj3nIN
	YWZZd6A/huUnafEhOibzeuG6iK4Kfbio2LnXIHesgi1CqXqFLcwDksYgyAhWZdG/Qf4UyC6y4Z+
	0DgNQ2gDWE4DXNGdzLJgUeN9hxaywkiSpCnQBN4ZadO7
X-Received: by 2002:a05:600c:8708:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4a35aae70b1mr197677005e9.0.1793118341151;
        Tue, 27 Oct 2026 09:25:41 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd37f4sm27880521f8f.44.2026.10.27.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:40 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Tue, 27 Oct 2026 17:25:21 +0100
Message-ID:  <dc0e679eba5a0283b0d34e756c71db569583073c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zxEn3GKmjIkApottOw2da7a+5Ym3eFer8LHtbjoIoLM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NB4Y61sfaRi2UYlrmaLCQ3nunydMgUidzF3j s/XqaKg0N2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQeAAKCRCPgPtYfRL+ ToLAB/0aPuOObiuuIObcbkpH5A5QaaL4H3cXCd9/01L5Dh5K0yCQBGnI9uKXHZ1b2qeSP4TkJL+ W2NNHrkuYMlM+Prx/DYaYy4U694aG+lqt5lcHM+jH6T+lWzq8ee66w9k1P+8kT06/RFyKlGfR60 2NcgdzlKqrZNk2Sh5RbGERfBzxy9hnDgz9+XTdxQ6iCkLKIKeh0IBdxGnDWnUa1rztDoUHtbhXL cfXos9ahRqgGyXOnfMAwnHGgX9S8eDfISFJTdXDe5kuXX/7mqK4tmLQP+20PNtWy0OBT5xfC6gE jxveX618fTLZ1vq7f72HZkRmkxo2Tf0Yl4wQGaz9J+uSfE2Y
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

