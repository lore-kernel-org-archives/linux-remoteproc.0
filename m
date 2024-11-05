Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6336182C5;
	Tue,  5 Nov 2024 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767681; cv=none; b=olEK27ZpqqJt01CmrSSF2o/ig1mJFI9hDScukyJH6TLrxkjWKR9ZATRbpUgpsrLJUHLCiCc1k5WGoHLKDCxtrmrd4tflGT+U/nXPO6CQ6C7DjY+3TuuWUu06m6Y6z5Jh4DmBb66RlWOmL6SA/o2DjnC0nFSIXEacRSnXxfR0E0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767681; c=relaxed/simple;
	bh=uVhGRI+i5I4igu+9rTGQnM/4QlKhCZQJX+qGW6NeK2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kq+fCAyei4QdBGCbnbu3s7TyLUeqxPEBpdR5lAJK8q3kBqtkrK9utgyKfpD+BVAuvPCcpb3ap+MLjSjipSVVshGMyHBE0EqhQyrK+T//g9AhwV6Bdd7Uidfk5JtBmLXcHg2C2IHQitv/9HhVJBS3Y+OVWOD7XrKLlQjr9wHIejY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=griiRZ+b; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="griiRZ+b"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e604425aa0so2638674b6e.0;
        Mon, 04 Nov 2024 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730767679; x=1731372479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyDcOUxJGr8liC+ojBmJrjmCA3eFLmNZPnuaZfrVqY8=;
        b=griiRZ+bYw16UF5JN0ZC5Kouz/6k6lg2Mw3bA5MWN749IXRisbaplsUJuMIhkThSaV
         httId5lO/Haq060j40IXUnm9X9F+/TNJUj8tIWTvj5Etek27rEjH3xKpECIgfcBC29yp
         u3BJ+EMfzyhQWZm5AYbc3VtfVY/OLjjTgb9HULyLvDwDJuYJDprJjBh4ZZhW0Oot3PMf
         n8n1pxbU/Jo6R4xFuP5DnsEvzliF0S+afHq5TfEDGlLsTEKkY1dc3CshPNNeBbLqCeFE
         JRoH9XB+ihemLGK0qkRTO0InazEU/XaHbJwiK3j1BZ9ornnc/bAt6sgi1N90gYaYw3bf
         Xlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730767679; x=1731372479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyDcOUxJGr8liC+ojBmJrjmCA3eFLmNZPnuaZfrVqY8=;
        b=vUglnsC2uJKm1xGGFW/9aLIC+mKqSx9mnxQsi6dmRNG9FERF4n+2/qY1Zf7U+W+7bq
         m48/OWpmDYDfabEoK7vlCv/KdPdAsqbfaDCfpDUWDknsASS2StHWX2+JtRkJgw1eHwqf
         4Ots8qnvwLdZKOGuEDEv8+xF3+m6nu6ueO8cotQZuXh0DuRRZHTdK4miJ0lU+qMWcq67
         PhsjT8lVSaY7f97dwGASJFQWQSGQsGqfNWEk66rb9ILbI0KYOv9LBCxytzHEgt++rrvh
         sZf8iBhQClz6eDXycUxo+BoSWQPwDTxeNX5UAdZITVf5pANgl82LjebISX1Pmpx4ijm8
         WbYg==
X-Forwarded-Encrypted: i=1; AJvYcCVQr/cvj5vvrY8L6O5uF9UD4s8N+wYZnm7+DbBo6oJ9z5EilFWLljBFtBJrR4Us+RbblZ6pQMzLDUE=@vger.kernel.org, AJvYcCVUkEJoD1aFA8SMrpdV/ubRZKMXR40kFk2zw7GaMSLdCb65vjVD3jUp1TI2epBfCzXKLHNRWfzmFj+HSJJ0b7Za8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYDZJzJPGHum6Ui4bLk2rfDPqYT/aOYfczWrwu855ygVbjBshp
	hlDeuoZZCR0k73jI9hedmfN7Ji05I6pnYUXYEHpGGZuLrFTJJG2R
X-Google-Smtp-Source: AGHT+IHLBw5PGHmqItDQoY4R7LjhSOcCTKyOPpaDANw6t9aZOxUK2Oube+fsSxE6vBlO1JDCJZTW8w==
X-Received: by 2002:a05:6808:14c2:b0:3e6:4f5b:afd1 with SMTP id 5614622812f47-3e64f5bb238mr23114625b6e.6.1730767678781;
        Mon, 04 Nov 2024 16:47:58 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:d414:4f86:7740:65e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e661190d07sm2317994b6e.11.2024.11.04.16.47.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 Nov 2024 16:47:58 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 1/3] Documentation: remoteproc: update introduction section
Date: Mon,  4 Nov 2024 16:47:47 -0800
Message-Id: <20241105004749.83424-2-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241105004749.83424-1-yesanishhere@gmail.com>
References: <20241105004749.83424-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the intrduction section to add key components
provided by remote processor framework.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/staging/remoteproc.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index 348ee7e508ac..eeebbeca71de 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -29,6 +29,23 @@ remoteproc will add those devices. This makes it possible to reuse the
 existing virtio drivers with remote processor backends at a minimal development
 cost.
 
+The primary purpose of the remoteproc framework is to download firmware
+for remote processors and manage their lifecycle. The framework consists
+of several key components:
+
+- **Character Driver**: Provides userspace access to control the remote
+  processor.
+- **ELF Utility**: Offers functions for handling ELF files and managing
+  resources requested by the remote processor.
+- **Remoteproc Core**: Manages firmware downloads and recovery actions
+  in case of a remote processor crash.
+- **Coredump**: Provides facilities for coredumping and tracing from
+  the remote processor in the event of a crash.
+- **Userspace Interaction**: Uses sysfs and debugfs to manage the
+  lifecycle and status of the remote processor.
+- **Virtio Support**: Facilitates interaction with the virtio and
+  rpmsg bus.
+
 User API
 ========
 
-- 
2.39.3 (Apple Git-146)

