Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009391;
	b=s31L/exacY8w8+M3fhyCPieAXQZfOOI7HKpff0gV5k23M/umk9abG2Bj0po5wOjSAlhR
	 EjCdqCYKAoA2pTqaG1NK5uuWk1s2XvXzQTMzEg+HIjUEWmzi9U7IoKxcVYPUugW+/0eRw
	 0etUhL4glPU7vuFi3yL5QelE575aJdL/cYdrZpN7aL4K1b/nr+Upgt/gatX40fBKRZR2F
	 oYfipY760uB7o/gxBv3bFMB907dJgvo/vwB6HubZeqrNB2VTTL+lA9LAbr26GjYdA4dkI
	 1FtiPONCqzQGuUl8JZBDSKh1XpJPaE1IlbyVcTUXeerr/pnd7o1MKMf3/n/rr21vVAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
	b=fxvKdsZePl/On/UhjzxTvxJ+yjYyR0kZaXdYW+UvU7bhLznY8ok97aR/95SIcvJSuB7Z
	 F0gNmYEXIV1EVUza+uuu51Ya0s+GCXTwNdlmSYmhe5mp/sFInqoBFvpSLtDhIdHm0yBYL
	 iuClIVX14+AYgRQh05sPNC+82v8U5VsFnesJ8RUNlUY9yHgmTJ4Gbbe92y47TvYr668U/
	 0hmki/7YEvR87/5jyGc/tMnlcIICy1pxR6sk6G9mXpiPIasvo4HqP2Dx+nQEysmWd2I3Z
	 YpB/XGnVRDEJ+lngRAba8vE9bQDzIhDxQpD88fXRemLSWyltghQfoYIvFZv7k8edBiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D9PtB5qb;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A1606A33E
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 10:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E08A1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D9PtB5qb
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so20913915e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009389; x=1793614189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=D9PtB5qbDk4URdXJa/HNbUTeISRSVAHwmfhTQTd2HQ6EG9XmpNM0QXO0S65wblAG0H
         QmHS19foZY9FbfPFdGBYz2p+BsRT686JyLEy3sXc/LZd1/UUURsJYWy9qHhJJbu6fjED
         X6DZzwILjAMqDdTaHu08nPX0ZbDh410++mWMMeIOzk5UXqrSnzF5U1AfyjiooNcSIjKg
         Vbq+EzF87Z7Le3vpI74TkXtC+qpgCc2YzbwAiqrn70L3cmMaIYbvKRNIu4FeVxltudon
         6TPtPYsUj4whdbjkNvV3e5/lTMaAwX0Hmk59noS0WUcQUWYLQDciOTFvu8QMuSVVV+oi
         Ahyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009389; x=1793614189;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=nFIicr1NuuEPCqCEWqGIsknxT2lPyWj0azjdgj5ebcn5b9hBdEk2FSKy2WilOo2Tx3
         WJf2kFXlHcFUpOUIrRn8Kh7LVSlD6CZ2EWhEkNEWAKWaiAl4yXiOs2WZw+0KfTmJsIW4
         35a9omdDXlaQUuPnmeJCGywWoOwV+xdHpsFNJsDnlp8jpAzO4H0D4HnF+0zU8vfSPcQ5
         1cLF7rPSgaMoh9BrKA9JyDYGBQV0ow2rOJvmjxmFvZaCJIxh+j744jEugaY1Y247u88X
         EF+nbNMvbv6t6aroBO6tdkrJU3SwiplLI+ANuYsjhk6Ow+I7TmxfXfeLvXsPDI8ZskpV
         FFsg==
X-Forwarded-Encrypted: i=1; AKwUvBzsxwkTAIIl0w/JBlSLtGf/qkNDF5rVoJHlO76cp+b04Uzu4VDsBOVB2uvkl+nvdgzdhIyT90tKJPl0spN81y3x@vger.kernel.org
X-Gm-Message-State: AFq9FYJOKeF48yY/+JbdUkkocHKYEoY0ciyGPzHauLwQ8fbXTQL6DX8H
	thhYFOWQgudxgD3hN8fJTaJ1WVAbgIRpgUg/xVr6qiwjUcbxR+sUXUU7L7/5wS4zVlY=
X-Gm-Gg: AYBFou2p8XVxDomAiB/8XNqnZiPBrbLMRNLPvjEBrImNn78tDz6jUgdycMSFiVHDnin
	joSB8c5LMmHqJTI2pD8lC7RQqDiM0NGwvnP3CymcWwsinbD1dwwGpxviNdChgHkcWisizBlegpV
	WEaz8+PQIEinfBtT07nvxXjE1SjwGgnoKg7/M8XShb3QGoQgb/ZcNjDsBrfTiooAR9v42K8PqJd
	DeAVkqBB8T7ufppcl4so2Ss3RG752nB76Qt2pdElR9vGY7shexraId3imdmnYM5E5WuFL0RXypL
	jN0kNkH/9WHtFjXcocMy3c0xILYMb9Vg3dVh6Ev0wmvBtZwrrx3yT7lD06FFY8K9raRqTA8Bneu
	TNEvppDmyOVX7oyEjt1JR00+1WJISG1ZVJq3Q+G/mCNBYFPzy8Rhq9Yt1quYbley/WxzP0I4wKh
	eFlL4Y4PZy6f1GI/MUaInHvI/ZN0iURN/dm2AwbsMqKGDCImw58IZ90CEPgoEGIewUqHqVok6A3
	tlsYKDXDTIfwCo2XsbyRoAb2g991Bx408dATOTLIUGFhHafCOYeKXS2nBu41uWJ8H0UkU9ixezF
	wE0/LabDABkZVSQg0pn/m5iltGrWtlGHEmvc8yWOokzY2Q88fxfoJ/E8lbVvSgll
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr105329285e9.2.1793009389330;
        Mon, 26 Oct 2026 03:09:49 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3bdbsm12723417f8f.19.2026.10.26.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
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
Subject: [PATCH 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Mon, 26 Oct 2026 11:09:31 +0100
Message-ID:  <951ff0c2bad8709b77b5ac7086b70cc7d37ce51c.1793008847.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5255; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hxruU5Qpi7r2EJrNeBqarI1YguCnlDks2WjPOZVNhtc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybhCmBylIiFeQF6JYkVphxgdtR4trriGdeKV WyMVHE5hfGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m4QAKCRCPgPtYfRL+ TqZQB/469uqHF0RQ3p1EtU5kkJhZgfZbqHOiHj9dcj/QjmbMJRgCsw+/wIgRYW0IRiO/++pMNVX 2sQYzZnumvdt3pS9qoAvqTO+EdxGaFirLJxoABx1CDduUP1JpAsbpKaYNyEoJqt+5lQh3TMQcMq DlM1PL/u9DAx7b54WXxvPhB6vOWX0eptEk7qYWjz8vQ9Q4g2gmHL2RQKwWGE0GZ1yweUJQmCn+K qyD+Vbdi7el6bO9pv5+VP2gX9rLg+BFoCH2h2iQxTfeaCOXBqThL5xuza0JA19i0j+J+li58Fr7 TlwpNM4Dn/jozhd/xBFmZTToNdVIK2FJRuURwqTWCZtgSzTh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This callback allows to use the core's rproc_elf_load_segments()
function instead of reimplementing it for very minor changes.

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

