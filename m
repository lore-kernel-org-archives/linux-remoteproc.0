Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E836A364
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 02:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784861625; cv=none; b=Yw/gfPHPtUyVoYK+/GxtRQ45H3YLEJo9Dsi4w5eMWyOhbS5EFPcM6D1cT9sBMD8fj9IqwGV8uAJMcNnYgto46xrwM4APEJUdUYpENN1B40MTUw2d4Smx5RWrghcDZSuifDWqPFkadjlj5/hb2vsuvDlwFE6BRH+XZ1T6RnXCPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784861625; c=relaxed/simple;
	bh=DGOO1mcvNX0DhX+uMlETQcvcFQk+ownCZdf4bRPZ0hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcHlumli7/8LV8gzivCFFw4lRWvhOEBMF/Gk/92N5NNFNMqXjV/N4j3Rr4Ane8/n7D+ByKFIiFdcXvrmwiP09vnsQfFbAI/FhbrGVVsid+OggIO11AdcqLlfDNkFuT05hxyIraBW0RvLjqPGaLOJxwd6RVmJ2oyqbkvBJ3P6r/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoVzfG6C; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoVzfG6C"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caea3f742bso17140005ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 19:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784861620; x=1785466420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5g65N8OjtzmKwoPoPbEZAl8O7MsJ2czZFXaJNHfPiY=;
        b=SoVzfG6CZCTvGU6m3GScPch0etDo3sztCdog0JHccW9CWfVkWz1Jv4SfnfXDQQgwAE
         EXoWMLk3kE5bgr9dWd/MTw82uA/XSGfDlT3Z2+7GUMvHjCkZxgsZq7Zy2l8coQtxg/PR
         N1f2Gk6gIroCMFPPjZ2sULjJ6lUHlJMnxlMggH9537Fe5G/ORfOqpPpJin3ukj868Bqz
         a2Df5KdaslniwzAsm+SOobmo0bjnlm9jMFG8ZKT1RNLnMRPqKLmRlYwQKgLSyMaWmV1R
         7xmNfNFbcUWZHRYeuQ21KA0hMdcrutOSmNAozrux1zPT5q9+VTkLzFnKzx2pEgPYJiAB
         0uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784861620; x=1785466420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5g65N8OjtzmKwoPoPbEZAl8O7MsJ2czZFXaJNHfPiY=;
        b=ZWcMDa95KETNbFLCoXKQhq5ntdsyjqGmFlC2F57QxeGrbbri6ePzG3yFN92pd4P0Jt
         ToVqVq6A2lrJh6KO/0hyOqNWn/dw5TZachAEsdH36ZEkST+hLSAXK6HAIrYFm2/ha2l8
         N86jghRbBrJO7phttasHuWUh3JJPs2q8a0AVgMTlldT9T8L5oR9YTjQbOI8cMwy8QRjg
         zFYnSNyrlWLL+LRHzLKwXmy3HW+nYl+e2NStrg778+ixzNlrrwTBFIRA7anZO7bxJf3G
         rW7LvsAMOq7Rxne54F8Gvocr1SXmu51Sfmal6qs8MFIhYn8YqZGPs6wbScDLLbVeymPn
         7R2g==
X-Gm-Message-State: AOJu0YzIWjl8e5AOOqV4/+2SoNHo0ay/mKweyVdPIbfKczcyqJdortUq
	Ryzp5ctcGYrl7E//oXexcWTY/KxZDGd4jbevXD4iQ16NLuqm+eNZ+LTi
X-Gm-Gg: AR+sD11j+sR9QrWCHj9jRnBoczLkshDfSoi6mxV9Fhsu3SkOJ2OGFe3mI61Cb0CKPEF
	uFvDBeHvOTmI0xxRLTA6afyZGKc965WIChjht1d5134uv9t0D+dUWLD3CEVoGbwmvg6TE08szrD
	wMGssA9ONQTXHmWP4wZlah5SFO90cERr4UUogYP7ePuyj0I4Y4nvuyxEQK4dKaF3kgttroTNYNn
	v3nv8HELYxdYS/R6ymttX4rl1gBdor7sxDeyusH+FHJsNMtXtMTN0FpSgN/QhVcKafpLfoKIWkJ
	BoiOYSsHzL7LIIANARRWoyPBiW1oQ5ZujsGSAtkxJy4h5rzX6gTRqiEeABh+R6MCuW/N3yD3if2
	sfDyaZRqzkvvY2j2DHy+06R9PriWf2Jog5KvRrMaAf3Vrtw32Bl7w/CMSN7BHv3MnitMgp62Deo
	plw4egau0qXsJmAtsXaqR72NQjp+RyVPCdV32tHFHGbfWJIwsPYFcozkyDeYBoZk0942M=
X-Received: by 2002:a17:903:3847:b0:2cf:b68a:2050 with SMTP id d9443c01a7336-2cfb68a395bmr38478795ad.15.1784861619575;
        Thu, 23 Jul 2026 19:53:39 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efae5aesm42664585ad.15.2026.07.23.19.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:53:39 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] remoteproc: elf_loader: bound the section header table
Date: Fri, 24 Jul 2026 11:53:22 +0900
Message-ID: <20260724025322.2341205-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rproc_elf_sanity_check() only checks the image is big enough to hold
one section header. But find_table() walks e_shnum of them, and first
dereferences the header at e_shstrndx to locate the section name table.
Both fields are u16 and both come from the image, so an e_shstrndx of
65535 reads about 4 MB past the buffer.

The commit 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read
past the ELF header") added the same check to the MDT loader, and says
the header "is sanitized beforehand" under remoteproc. That is what this
patch makes true.

Check e_shoff against the image size first, so the two bounds can use
size_add() without an e_shoff above SIZE_MAX wrapping on 32-bit. The
bounds are separate because e_shnum may be zero while find_table() still
reads the e_shstrndx header.

Fixes: 400e64df6b23 ("remoteproc: add framework for controlling remote processors")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 94177e416047..da3cddbe7d4c 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -46,8 +46,9 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 	struct elf32_hdr *ehdr;
 	u32 elf_shdr_get_size;
 	u64 phoff, shoff;
+	size_t shend;
 	char class;
-	u16 phnum;
+	u16 phnum, shnum, shstrndx;
 
 	if (!fw) {
 		dev_err(dev, "failed to load %s\n", name);
@@ -90,9 +91,27 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 	phoff = elf_hdr_get_e_phoff(class, fw->data);
 	shoff = elf_hdr_get_e_shoff(class, fw->data);
 	phnum =  elf_hdr_get_e_phnum(class, fw->data);
+	shnum = elf_hdr_get_e_shnum(class, fw->data);
+	shstrndx = elf_hdr_get_e_shstrndx(class, fw->data);
 	elf_shdr_get_size = elf_size_of_shdr(class);
 
-	if (fw->size < shoff + elf_shdr_get_size) {
+	/* keeps shoff in size_t range for the two bounds below */
+	if (shoff > fw->size) {
+		dev_err(dev, "Section header table is out of bounds\n");
+		return -EINVAL;
+	}
+
+	if (shnum) {
+		shend = size_add(size_mul(elf_shdr_get_size, shnum), shoff);
+		if (shend > fw->size) {
+			dev_err(dev, "Section headers are out of bounds\n");
+			return -EINVAL;
+		}
+	}
+
+	/* find_table() reads the header at shstrndx even with no sections */
+	shend = size_add(size_mul(elf_shdr_get_size, (size_t)shstrndx + 1), shoff);
+	if (shend > fw->size) {
 		dev_err(dev, "Image is too small\n");
 		return -EINVAL;
 	}
-- 
2.43.0

