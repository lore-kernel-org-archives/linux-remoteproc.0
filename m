Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7942022FE;
	Tue, 22 Oct 2024 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729632934; cv=none; b=eXwhXKbwpvKzlYtqc+xeHcrsZEu2ri4fYbo9xB/Z5wc18MNzu9+6ct0SQjwpZHKdgS87sp6K9wJXlWqvgvtYnFUixD0Fx3B0a/ziOCfOK5TvtTh232iczgJxFsGURbdDLG5i4heSfSqaCvoBEimBFORZEbnGT8Ci8zlPLx3rCjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729632934; c=relaxed/simple;
	bh=JG/YDm/5RZeVRWl9eZ3sDAgg1bpmLA+CzqXOtqPSzb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SEoTNRlNOYGC9g6Z0ti4M6yhKNsJ1HwPcmMlMmBsrr2O8zY1o/YW1QZNL+l5VF3fYfiy6sWxPd/ibBJAUUpj09cdguC0IQIDCZV8qePSj7QoPGkDPPeNGytenNMsSsWYeMtSd5r05C95H3alUWrl7KEkvRMErkiRapXyQXsdtxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdvEzluO; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdvEzluO"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so4955084a12.1;
        Tue, 22 Oct 2024 14:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729632932; x=1730237732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExRxCgggPFAmIkz7VqayS6sIh76VaH0SrIaHrrXD0Ec=;
        b=UdvEzluO+fwxD2ZKj/qkTojRUnLkGiHAFKuUeiJF0y/WbVUdnsai3KiBHFUnad2HnI
         sOd27e6sppxBkslYQgOuLikC/zMoOqrCNnWSJbfRFtAR9KSsBJyDzhi6PKapPx62tnIt
         Wjq4BB/CsKMo0nGS3xZl9eyi2XgEPxxub9bv55qnYI4T3rODHvk+vSZ9FPSgdi3emqRq
         j6kFfnDEszks0A7FkWAZrp4YoIEXxgPWgRIcxltpi7vu9qbmNvahrzhiAEjgfiGxDWzl
         7HsisRrXp9HNwyy1YetsYkpmjMbBcmLyw/cXywRKcuSKAiCLNosNg4A6p9t/nCOq8+RX
         HKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729632932; x=1730237732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExRxCgggPFAmIkz7VqayS6sIh76VaH0SrIaHrrXD0Ec=;
        b=iHvDtc49LPlhWAXeAc+I7R6OFfxLE9TUHd5Y0pIb1GfTc3B/fhzZYnCY+3Hi86li3S
         TMwZNb7Rig7xiIDRbTwLc0ZfRBX35bH36a3S8n9RlGJ5vAZNGRg31Dm588pQL9uNeDIa
         kqaHZ1MBThEw0gR7cfm7Vfualxg4tv+c9/axHa7q+Myw3WqE1xYLmhbP99n5piPXaDwF
         E3Z1+Zxn3NFhfwQbQ2n0AE4SLYUHxfByWVflOQ7E1QWI6r4kOfm9RbEcGlCTGkcDfyPp
         BuOPkuSxucLhTZpgp8Qp5O7rJ4BN9wfK7UGm8wu2LIk7FvAcXWaoMsgZEYcMOrsMBAQF
         h9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXtXFoEDqrC4bTf59lDnFeAFIOVK79/nJoIDMgAJ+aBvUCajzlBsWCRT0qttb4gCFmtRWEXVkE6QOw=@vger.kernel.org, AJvYcCXyAlQFzp6RDjWB7NDqQfu0EHqrogWNz8ebqTtKURwSLFo3/O57bGmMQDoDGpnuRfqKiUqPvnrSbaiqMw+I@vger.kernel.org
X-Gm-Message-State: AOJu0YzEnCETZ9Uy5V/xJoW0+NIbbU/Zhl1j2Zu37yM4kpskoHLVuRDg
	ykZMjOn7epnB1vQjIY0e3jyiT5+87ZKbbBJiVfCikinYTsg9LkzA
X-Google-Smtp-Source: AGHT+IF8JpU0xXJrGf2MiesA/O7dXMJtGuVfnM7Z4/bSrugCDEGvc9uuk6DoVFqHeV0JJhj5l/Jwtg==
X-Received: by 2002:a17:90b:4f82:b0:2e2:d434:854c with SMTP id 98e67ed59e1d1-2e76b5b6a35mr386797a91.2.1729632932387;
        Tue, 22 Oct 2024 14:35:32 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed73fsm6726369a91.44.2024.10.22.14.35.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 14:35:31 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 6/7] MAINTAINERS: remoteproc documentation path update
Date: Tue, 22 Oct 2024 14:35:15 -0700
Message-Id: <20241022213516.1756-7-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241022213516.1756-1-yesanishhere@gmail.com>
References: <20241022213516.1756-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As remoteproc documentation moved from staging,
update the same in this file.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..bcece98ef32c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15907,7 +15907,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rproc-next
 F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/devicetree/bindings/remoteproc/
-F:	Documentation/staging/remoteproc.rst
+F:	Documentation/remoteproc/
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
 F:	include/linux/remoteproc/
-- 
2.39.3 (Apple Git-146)

