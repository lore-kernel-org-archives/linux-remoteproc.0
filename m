Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A07800
	for <linux-remoteproc@vger.kernel.org>; Sun, 28 Jun 2026 00:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782605334; cv=none; b=Q2TGk7KszgQlhrQzKGOfPVn4iNkxXgSAsLpV3eLNdU3siSagfQuKRnd0wheQNdZ1wKatjXv01MFS/haGjqnUUYO1WUAYJfPFXdQM9R9/J9xYGFFdc5kHSKm78e8iQn9yAEoMRtXX/VoOBCNNZz3lN7OYFOHq5i4MIEmJLCOSCAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782605334; c=relaxed/simple;
	bh=hRDMVyoZ3Oh0p5/B0Z7HUihywhTABZ1lLI+im220JCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kULKLzRoreFPBcYTHeSS23eHHQeuUcQrdnjbCdAdkj71Xhi4rtbXJO2Lgdhm5tRKGSj4Ct6kC8RJmpX0YuRCTlahjt83iiGe999Yr+pHTvgXFqPhlrlp2E47uhFDrhyStx3+7jEcV/gVAm6J90ZnbPqJtoALm3KadDXQm9vSndo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJV3jf98; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJV3jf98"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so15502115e9.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 27 Jun 2026 17:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782605331; x=1783210131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHDS11R2ENx9UV29MOgGL85h0g2F6Fpg3oMzohOnnu4=;
        b=MJV3jf98Esggxqwa6VZF8B0CKEFAEoPUhbz0oWF8RILoZOUMPMkWUSCOHg4SFxR1f4
         2p9bp+mNstkBvrQjCmc9H/T/nQf2P3naQadLLBMOJcUbVgheVZZIpMEV8uJavVAzkW01
         pxHrOEKdg/n0H1zRRQ9fKo2s4HZlOYAZqw48JLKlrUfOBpiH8CTP5J9xq56mexIQQwX/
         usHBwFbShE2Yy/hSJ5whsV3614OtV/qxX1UpyV0SGBeLYmJ7jSFAuQjykAno7Ftn4bDo
         ki4c2r21ZRXpItmikmeJ5rSmYEolcCStkfNqYxleRfj1wEiKi3hjDbM9KKMZAH0dbmk2
         OjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782605331; x=1783210131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHDS11R2ENx9UV29MOgGL85h0g2F6Fpg3oMzohOnnu4=;
        b=ZHAGnmP1M/itPWj0vBSRt9SHh08MCKLib6jAjrrF53sTJGji+QpF9WY8Wq5JQ1mwEu
         DliyYZvjeMgR2R2HDuiZTbwRNMfdYPk7L6LGg2rydKLBirbGdT5KG4NL7MeO0F6rvzHs
         VTTZaTDFPYAQAujLl69zMFuDSngsjxJYOj5KDdt+qMRpUohKKIo24PgmbcuX1wpvjBug
         JDAhNjNeGy3yzLT99ZRVQz5JT7KLFCKphs4aKwBr4mfJDpWTocjGDsEnXC2/sF4hHE81
         5AmAP8SlhmZCB1uwJ4fBv34/AnXG7wjFj2tx486cdTUSkn6UeY+z3XG0IawsBGgZigyk
         O2Dw==
X-Gm-Message-State: AOJu0Yz/LVomn0W08gAfZrKXy+UN8fElDbMs1mr+t4WWJIseInKjFt/j
	KuHH1TzEd7j48Ch24i69rHvA6MNRVhZUGzUb1shfh3zC6VxcfU2u/Blw
X-Gm-Gg: AfdE7ck8HFfyFtMLVIvJ1IL5fOd2KnpggStZawE7W7wT+oZoCuPLYVnhtsKJg6SZkhf
	3dluq7nnQXnmY7bfRUGoqBRjdCElAWNkpQ/jYMsMa33xMsMm/TONop/XznCdB6Lin+g7TAfjuLH
	JWdk9nvVU9sc1aWyvx1M68TOi/81ORbLBC9Qcy8tBqIANPA2S3EfTbMR5ZmGx9Dm0D/q95ToOd0
	kqQm8JEamLSUrZi8TJasKPb7jzR4qplAox1Eawt75NvaFN5W4etFNgqwSAh3ma5rnEvqUq9ZXvE
	nBW6UeYN7GjW9uKoNiB0iaYoZ+9rJHPlt8cSQy6/prgYXP06cwkMyokYXZdSvSSBm7GnGl0Dh8r
	Uugj+0PAKO8MMp1eLCpxD2se/sq121OtVzGsUrLfWdr8TMdY5Tx+f1jFOgi7AoNG07Uv3Zom1Bk
	3khAhC0LVBKCQflXyflhi2ua7Caw==
X-Received: by 2002:a05:600c:3b0f:b0:492:70f4:8d1e with SMTP id 5b1f17b1804b1-49270f48e87mr67565385e9.11.1782605330905;
        Sat, 27 Jun 2026 17:08:50 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a8409578sm2377135e9.1.2026.06.27.17.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 17:08:49 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] remoteproc: reject overflowing coredump layouts
Date: Sun, 28 Jun 2026 02:08:12 +0200
Message-ID: <20260628000812.19690-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remoteproc coredump segment sizes can originate in firmware ELF headers or
remote processor minidump tables. The coredump code adds those sizes to a
single allocation without checking for size_t overflow, then copies every
segment at the unwrapped offsets. A wrapped allocation therefore leads to
out-of-bounds writes while building a buffered dump.

The section-based format also stores its section count in e_shnum without
implementing ELF extended numbering. Once the count reaches the reserved
range, the truncated header count makes the string-table and section
offsets diverge from the allocated layout.

Reject unrepresentable aggregate sizes and counts that require ELF extended
numbering before allocating the dump buffer.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/remoteproc/remoteproc_coredump.c | 39 +++++++++++++++++++-----
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index ceff380228c7..17a084f34445 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -9,6 +9,7 @@
 #include <linux/devcoredump.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/overflow.h>
 #include <linux/remoteproc.h>
 #include "remoteproc_internal.h"
 #include "remoteproc_elf_helpers.h"
@@ -256,14 +257,23 @@ void rproc_coredump(struct rproc *rproc)
 
 	data_size = elf_size_of_hdr(class);
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		if (phnum >= PN_XNUM - 1) {
+			dev_err(&rproc->dev, "too many segments for coredump\n");
+			return;
+		}
+
 		/*
 		 * For default configuration buffer includes headers & segments.
 		 * For inline dump buffer just includes headers as segments are
 		 * directly read from device memory.
 		 */
-		data_size += elf_size_of_phdr(class);
-		if (dump_conf == RPROC_COREDUMP_ENABLED)
-			data_size += segment->size;
+		if (check_add_overflow(data_size, elf_size_of_phdr(class),
+				       &data_size) ||
+		    (dump_conf == RPROC_COREDUMP_ENABLED &&
+		     check_add_overflow(data_size, segment->size, &data_size))) {
+			dev_err(&rproc->dev, "coredump size overflow\n");
+			return;
+		}
 
 		phnum++;
 	}
@@ -379,14 +389,27 @@ void rproc_coredump_using_sections(struct rproc *rproc)
 	strtbl_size += strlen(str_tbl) + 2;
 
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		data_size += elf_size_of_shdr(class);
-		strtbl_size += strlen(segment->priv) + 1;
-		if (dump_conf == RPROC_COREDUMP_ENABLED)
-			data_size += segment->size;
+		if (shnum >= SHN_LORESERVE - 1) {
+			dev_err(&rproc->dev, "too many sections for coredump\n");
+			return;
+		}
+
+		if (check_add_overflow(data_size, elf_size_of_shdr(class),
+				       &data_size) ||
+		    check_add_overflow(strtbl_size, strlen(segment->priv) + 1,
+				       &strtbl_size) ||
+		    (dump_conf == RPROC_COREDUMP_ENABLED &&
+		     check_add_overflow(data_size, segment->size, &data_size))) {
+			dev_err(&rproc->dev, "coredump size overflow\n");
+			return;
+		}
 		shnum++;
 	}
 
-	data_size += strtbl_size;
+	if (check_add_overflow(data_size, strtbl_size, &data_size)) {
+		dev_err(&rproc->dev, "coredump size overflow\n");
+		return;
+	}
 
 	data = vmalloc(data_size);
 	if (!data)
-- 
2.54.0

