Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63A1448DF;
	Wed, 23 Oct 2024 05:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661646; cv=none; b=GjIjr46Pi7so5/SFZ0+kPoj7zeV/pHkXv8mGJkRdfh18JMcSv7Fg2rdXjVbEob3YzlBHjOTCha61CRBkC1YOsQKBOom3pExeZy7fjXIYBOp5qBbI1ro8ouOwqn70CjBnvVUICHocypL03aNTY7PXqLE2yUxVdNU9cL+JWIKdyLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661646; c=relaxed/simple;
	bh=zJEvpa9INE9yXtYQiz3469DzQraDqTRRxFPVZ6a8zxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FkhqBR009DzkW6+Bz72SQ2GM8lWitEPpOi4ARmp7OYgBX76AqIMAu+phBPrak7pel4h2z4qsnBUXw56yS+kqblETD5+UdRWKMskscUwu4Tr1qjV7sdAlr/p5dO3YR9fWXUnc6arFkN30Y1Q+OJQi5olQj06ZlwqDXAieEiiTq60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBORMLOh; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBORMLOh"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so4177551a12.3;
        Tue, 22 Oct 2024 22:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661644; x=1730266444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76j18HLREuq6z2ueP2pra56wnYMu3LZ3kaThEHsixtw=;
        b=PBORMLOhM4b5SiPo2mpASFANR072bTG+MM5yzK32D+DjxItYdK9Jod6jFDI+mtTpQt
         hDKJmEDbegQaWVapVNEzexzRnTnoTjdmFpPjTbDiEDK7OUlAXIUCRb0tGVfnu7IXEoA7
         fs2yl/D5f1B8vmOI/c1e6Bd6K8I0YKtV4BK5x8LjBXKfunXYvMF36cAfCg8AMItknqDX
         SAIyJzgeJdz3KcQ7vdVEcF8DwQFDplM+A61M08z8pHNdhrQ7OI25khN1rawQiT3NVuIf
         RI4qpqsfqpal29qO0pbmN7TXGYYUzkepkUcaY8EY61rK487zQKw3aZNdhKqoI55jF/MW
         gD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661644; x=1730266444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76j18HLREuq6z2ueP2pra56wnYMu3LZ3kaThEHsixtw=;
        b=cL17SDAEUgAdFhU83tZjKNR40JNwwHPP7fdUoPUHI0b4ytVYJq120eOQ387AaCmAQJ
         +EEsVC3+p4eVEA/P2B5jPxatYiKz56VRZU0E7HO6p3wut1KHfrsRwa1sNVQkPC0LXJp1
         TIYKmJ7TL4aPI2UqgeQKCZGUMQO7gzRYyBw6FawW5APwaz/1tU6E8F4gR/pxqtTLBcgx
         2cyfIytv42srdtZ4KKBq2FQqyb43Pbid5LWdiGsT8HIMAq/TGxGPQZu8FWhRdJU14fVS
         kjzlrxyQm8IbaCgDvGuKL7fSqUhVKHYhNOvp8IF6PMkFH6k5LgL+9g2GInm7/O9RU6/f
         Kq6w==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ot35jtFxl+VB/npJxVmEYebhmLYSbidQLjwW0DpN9WM7rXNPi8NLjclJRWSvX0Wq48wrs+NUQDs=@vger.kernel.org, AJvYcCVqG1BNpTQkdueo2F6yuMqgn7uTL+EOL0R6cFd1mLaHNuFHoS/QsuaVjTLsj/TUGy758nqyCN5Uw7GCCybE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Z3qke9s7ZeIcqqvECIWFxoa/A0OChc7NkC0nYs8/Aq+u9bXi
	k+3aBh/HWPSfqNOQ/dpO7gRqxtjmeW0DI8K9iHBB6+N4w0C/21D0
X-Google-Smtp-Source: AGHT+IGdw4eXSwqHJ23qEQRaHPAi+TZFQJoJ4sh7IaI1ZrE0an07kAb8bFiyDgKdfpXKcq6kyzRB4A==
X-Received: by 2002:a05:6a21:9208:b0:1d8:a49b:ee71 with SMTP id adf61e73a8af0-1d978b32745mr1696241637.29.1729661644438;
        Tue, 22 Oct 2024 22:34:04 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm428695a91.54.2024.10.22.22.34.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 22:34:03 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH V4 1/7] Remoteproc: Documentation: add the main index
Date: Tue, 22 Oct 2024 22:33:51 -0700
Message-Id: <20241023053357.5261-2-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241023053357.5261-1-yesanishhere@gmail.com>
References: <20241023053357.5261-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In prepration of moving the remoteproc documentation
from staging to mainline and also for enhancing
the documentation.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/driver-api/index.rst            |  1 +
 Documentation/driver-api/remoteproc/index.rst | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/driver-api/remoteproc/index.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index c57c609ad2eb..ec9d669b92e5 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -30,6 +30,7 @@ available subsections can be seen below.
    frame-buffer
    regulator
    reset
+   remoteproc/index
    iio/index
    input
    usb/index
diff --git a/Documentation/driver-api/remoteproc/index.rst b/Documentation/driver-api/remoteproc/index.rst
new file mode 100644
index 000000000000..8b8c8f512e2b
--- /dev/null
+++ b/Documentation/driver-api/remoteproc/index.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================================================
+remoteproc - remote processor subsystem in Linux(TM) kernel
+========================================================================
+
+Authors:
+	- anish kumar  <yesanishhere@gmail.com>
+
+   remote processor subsystem is a way to manage the lifecycle of
+   a subsytem that is external to the Linux. The remoteproc framework
+   allows different platforms/architectures to control (power on,
+   load firmware, power off) those remote processors while abstracting
+   the hardware differences, so the entire driver doesn't need to be
+   duplicated.
+
+Mailing List
+------------
+To post a message, send an email to
+linux-remoteproc@vger.kernel.org
-- 
2.39.3 (Apple Git-146)

