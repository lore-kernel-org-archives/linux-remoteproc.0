Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A12E400;
	Mon, 14 Oct 2024 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728884927; cv=none; b=KbEvw22FjpKhBipDjHhfk2i6AiaEIstaRjFFQOTYTDr0uMgE60JCA7KX9VeDKpLqQrq5FUJNUT/xw1edlLrtqDVTE2Xx2gLihFKUYzk1PQAS7bzVxmqoLPY3A1EuitcsMWa21pJDmLaIJRJjq7wbqOxuXbe7Q2t0YbciW1bpI2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728884927; c=relaxed/simple;
	bh=XYy8j8teW9WpdukgrSu9H5CamWWIe4Xv1SB//BFbc4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INFCPcydEtUNHMiSRMxx7o8P697+5s66onLpk1HRVfCAQ698RjFvXWes1jND5Gn4W1yupWYcnLy+8akAHIu0EThXhAT2N3Ul57EjniFg1qZhhGVGLtxktBR2ZZ1CBnmwN+uIw78twvpsOcjAkc/avRO7Oy7PZTMm2tlwgrPtcZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3V6x/ge; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3V6x/ge"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e5c89b013aso1606232b6e.1;
        Sun, 13 Oct 2024 22:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728884925; x=1729489725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCv6vU7A6h9RkD/lxoxKaWIWbfMS7uZxf/mwbAu4m6Q=;
        b=l3V6x/ge+smUMqjMsFn3NatX9tnFIwy6/QzBJ9nqhwqdjrpKsjQUhU47nxpt0SK4L6
         vhQ+n3v/cTUuCu+RD36epRft+OybhPCZqx3yjfrG2Xen1FBtUOIprAR3f8Do1yB3dRfQ
         u042mLC9AhJi8gRjI43C/D9AoAI1zItr22WydtGNXGWFjOiJuN+NwBMQQV/7QtOQ+ztj
         98kVU3Q0t55kaEonLIMFECfDf1mKVF+kvYF7+QlnqOcWqMUudZIs7lz47wc2UvPaecFZ
         zeTNWXGokn0qt9A8SJ73ZoYjpu2OWcfGOP0UC6ELjzrZBp6z5qDRbVZRBYggtsju+8is
         A8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728884925; x=1729489725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCv6vU7A6h9RkD/lxoxKaWIWbfMS7uZxf/mwbAu4m6Q=;
        b=lvAy5L1s3Y4G+Z8QqLXDQyjNZCjjf7MxVz7xF55YmrNFWBfOl5s3tioIxbAHgS4cTO
         aho/4Dlwbkfy8HD7kz5Xj0qecX5AggyLsivDLRlIg4BQPjCNL3gUA+dDgg1QNC3qHrGO
         3hHDJksmt+SxAjljiLpaC0HUEIx1A51x+TcaK4Czktp+dXUsVieasqYIhoaoVjwdgZub
         Z7u2uItvDn0WKZfBv5igGZmZ1Ag7bp13ddPINCt6DCunjfqd2AoV2a/cdeEV1Jn+GGOj
         LblDu1c5vpgqVQjTusrGJ5BxA4nsqDhXSLbh+13Ns9Imej/F1C/ixJR+8KIgZhuKOvlp
         Ncog==
X-Forwarded-Encrypted: i=1; AJvYcCWG3QnHdieaKM8SmHJMKkPSofnZvo+jxLcDsLs7Xk3s1CGjygt53nFp+dXkXRAkxmEkHlkKYoWW67TsPo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlr6naAk2JVNlqpFuI107CAlhU7zKpr8aiTsYk0VRv227u3snt
	/lC14IUcKI7BVpkXrDiHXSLuPUMHG8GUr+1uLyyZW9TaG+XmfLJL
X-Google-Smtp-Source: AGHT+IGDd28EBdGE/WqcxCl6IE22ZWclFvLAkpBnP4cU7DsaHgPVsCEtwV0nECO1vV4IhqIpj1lLyA==
X-Received: by 2002:a05:6808:1313:b0:3e5:df4c:c837 with SMTP id 5614622812f47-3e5df4ccb3cmr1602975b6e.22.1728884925154;
        Sun, 13 Oct 2024 22:48:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:3bdc:8c10:bc5e:6e5a:6a61:5557])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e5150230fdsm1861555b6e.48.2024.10.13.22.48.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Oct 2024 22:48:43 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH] remoteproc: elf_loader: redundant check remove
Date: Sun, 13 Oct 2024 22:48:20 -0700
Message-Id: <20241014054820.59860-1-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

offset will always be positive number and adding
and comparing to the same variable 'size' will
always result in check being false always.
Remove this superfluous check.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 94177e416047..c6d893e9c15e 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -278,7 +278,7 @@ find_table(struct device *dev, const struct firmware *fw)
 		table = (struct resource_table *)(elf_data + offset);
 
 		/* make sure we have the entire table */
-		if (offset + size > fw_size || offset + size < size) {
+		if (offset + size > fw_size) {
 			dev_err(dev, "resource table truncated\n");
 			return NULL;
 		}
-- 
2.39.3 (Apple Git-146)

