Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118341;
	b=CUX9kHlmVT5WxrUBlz6YA5uUlbdb2Ov7C4BLu7b/y3fMZG5wPKfgDhNEJd0LXM6RRQos
	 E/CpHRNzlYpPPA/v3tq49SIW934J1oCgUfUgEqqVb95Ju7q7O0A7sKnWPx23FzK0zd9XZ
	 F0a0kUfsRdZe8PvaK7ed3HgjOGFwaI1RG1Jovr1RHsVQ5ZmvmHpUrd/MKtr1etMQ6C/Vs
	 T2ipCn5GpLIqR6O+WeqT8Lxm/DlU9bGCNy4b9h10/UZd7tsW3ewsMDC1bUEfItoFuocWa
	 MZV2do/BnWM7qA8Afh0yaDpQr/mQ9lAHI9gd78oy29xSIDa8LBzWGDQ1ufmcewBhk7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
	b=tBMBjphALdr2eAxY6wtC0/iRbShGJ53+za+GML2Qtg6TNHovC2A7tkZPv7DF5TG0CQN5
	 QFL8sm0e7WKG8RNAZVZeXDey/lf/ERK2JJhN0FKwXFy51kNVKhvcmbfpNeGoMQYsluCS1
	 gKdcz2Vj0BdU8ZuzmBZ0uOzSJt0E3SL2Ow1VmhV20AO/IC32orsmRk4C3FSz33i0ro3CI
	 nfm/CKTy1XzF6gk0CdvVOwya+z8EvZQnKJnkyOvAabZBDc9XLZUr3f3RQsOG9GRZY2kU4
	 atTrHZeNYA1Bq2hQMpVFsTCMUizUdys6VWKQP+ohlAfJ8a1direDUIASVfRWusVHUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XntsE0df;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC167606A32A
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 16:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC167606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XntsE0df
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso163665e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118339; x=1793723139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=XntsE0df8iQ2Me6m2WjPwmxpXabuvZhErsiMC43GO9L9youYXmhEX/TmtMK4jS2RsI
         k0cto9MMji1ODg2IPb6MNHKQ3O8OKjcY8LXlXhlnUyhRRRXNXdlZ5saOldJmzBsSPk5h
         wrIkVK0Ll2uUac6zYA7iHO1+sG47pBiDNTypuokV6TsREDhCosz4kmBCCdiqkEW6a4y9
         yj5LJLRZD/P0WJ+9sKZJL8+rYKY1FmORlmCWOcTB3NJNY2W4KNjCyX0JtwJbOjtvua2o
         wdP0TsQTvHcwywI+S+69Bui6O7cEnFmKNleYrPFrVnQ6hiRg1o/vOWIrURe5WuHx8pXZ
         X46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118339; x=1793723139;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=dwzMdmnPbkQhnmM67ZXEWyJtxDMK+GjpWHnY35ztrwN1XqpGJYyqBezjfB63gw/X7q
         l32nkdCRR1onjAVUwKd5OkJN8AdzsCAUSGQ24NaHXgGd+hJATFzIWvuxnHCDZpp0f8QU
         aMxs3TZLhsJ3AjNtmeb2vGquXJnIrhrD5xT65wD6ZV4n49d6YCnO/YF6G+f/JNrH/we5
         z4EhgIYBNio6TBLPwR+w5QHxj8Q2lviu+r7rPnT0g0Z1CoQrPKaI3M8b0YdEyD9MSAC2
         f/Ss1ti4dE8B3m14cOLftESbnvv0GMaNa38mbRUKI2aepw7VgmYftR70KwhxBhatplB9
         A5Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxQ+9J6dtj2LiiRotrV/0SFPZY4NEKscsJ13xYhKsKHysBuXpojNo4VJWDSv+YvJ5bNtJAjAhy8q5iI8WkT0Sig@vger.kernel.org
X-Gm-Message-State: AFq9FYJznP/8JqS8dHmivsgayYqrsVnXznNkMI8mtgtg2WWqNNETpOSZ
	nkQZR5/QCS2I2jueUUMAxU8RzvRNXsLaXwUCMO976KTpHzV6sdesveFg7eLfWu69LNE=
X-Gm-Gg: AYBFou0/kXVfTsDVEjpECdP7OqkNtHxBqyHrZtKYUJi6AmAG9tLZMYCvic/OtCwsrlw
	9kBzChODnTh5+cAOXJrURDQRDSNYrRDFudVj7Kiicztv0bTZ2LdXxTl0MZee73glRFIpdgeNlJA
	9GFO1dKIDjv3sfri+PfIkd1aX1U1vlh/ThNbz6OMCUJCMCwHiBDYaay3oUzy/rruxtXp3jo4k7p
	kMCuqy8ObfVpenX2XDfBqbS0eN/SaIRbFIZF7VArvvm1UvZnWfMEAnz7N+C34lliahBd+Js08Du
	BIoX+UVzKDogWSdj6CF+AnVqswiaXOYdXHFAVbogCPJCznoqgmZnxGe9H8QM0xCfZ2GBl9OnQal
	Vrlbo5oHKnvTVimCmSEJbTUPcujWNxU6BRJITSLWfa5NwWt65IJJzXrPI/RwMt+qVrnU4opFgjM
	7BIfkB6vRNmW4DWptGnhS/SkQxFQvbAgstld+DPXVgecl6s/OBnv0z+jehz6kOi83/yyypJTLFi
	/umRVWa9/p0DvUeVmIEc4kNniSEodExxsKIVG3HfBUFdvetZzHUk/ovxHW8lrEVLMK/9WWH51Zu
	EK4/oY+WTmbT35n4iZMDe+GvqJt5zYDXdzIbB40mneqSnK74tlcyBjMz8n0d94Xa
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr206232885e9.24.1793118339017;
        Tue, 27 Oct 2026 09:25:39 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb8e0sm22996206f8f.29.2026.10.27.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:38 -0700 (PDT)
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
Subject: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Tue, 27 Oct 2026 17:25:20 +0100
Message-ID:  <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4592; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xVwXpYXWgABJZ9x21P2crTLydOse+u663MkGSpQhphM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NB0UKaEa77WgrPF9mWEd8jdnTucff0k56SvQ /7jqxppSbCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQdAAKCRCPgPtYfRL+ TmQRB/41RdBguIWrTGSuq3Br1wn3037QSqHgAqDnMnMeug563he8OY8v6f+CtVGPgXSx5QVz+iA AAq1nMA9eiM6vaqNfUMtAhSPOpvyFx95JPVD7XLogbKEFxB/TC/QRLOmzbrfadSBWZefgX4dEKe Sx6sL2irRsarkZcZnLdENK79iV81WsBzeqN7GynA3EJt7w9uCXsaEl+a22XMtcJHELNMuSfyyNk f9Kcon02OOS/Ia9yJQkXEQEL+rWybwPQNkGOZOuNn35OM1rpH/oY7dqIkiTMh7WyypOJvwUI2jb +9Cz47RoIu/eQrSdVio4Rx2d3oMxR10j9nrhGxt+2VMqMTYj
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

