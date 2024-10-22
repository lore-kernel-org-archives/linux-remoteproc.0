Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C134200B97;
	Tue, 22 Oct 2024 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729632928; cv=none; b=WjZJTMq7f2R2uxKaEKA9bU3b/bIIJ4qSYNBbwika49tTPa8jO3URk934crQZhZtKD09hrbAT50KmK45rPkDSz6cAbN176oD6gBaGEhasNN5S5YjL3+cZyBPIpb+kqheiiSgfTy4tMm0893XH+zpnhwyErerApZdDkv8VBGdkpL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729632928; c=relaxed/simple;
	bh=ckaECOYXQ3oUgnFFA+gq4+c9Cv7Jamy9SW3zoT2xSZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g0gbWNpoN6afJe0nQShsc/MnSfLMCf61+AnSBnzZUjQV8yOfemSNC8TNXMSmd6pSXssuMqXy0fqsHG3ZP79ZucltNVP5pqmeKHNfQAG4P5e0yngiND64lT/HgFVITr3UD29gzqdE0ZxzQLQ6nDY/iMoFjcNTkynu5b5IWdz3EEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDPi0605; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDPi0605"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so4461802a91.3;
        Tue, 22 Oct 2024 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729632927; x=1730237727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0NGNJR4A85YquAcYDyAC3sQJGb8NuTCy8V8jRDMofU=;
        b=CDPi0605ETqOZV3vN5RhCsL6dUigJojq1hKwM5s3ZoSEsO8ItwKBWBiNfB65wkDUfE
         esbapZk+q1JotLKKfvRd1pdXOLCSZlwKvJ3WTBow+23IXvuP8CjPuv4OGEd1EU4ADjdL
         TYEpEYX4ap+b2+ZQ2pOPk0wDEPEMnhA8fFONeDYtaA0bJy7gctD2VFL9xqhAJDQM3X9F
         6lgCoBqxXq2f9lN0etZOWG0AQg481kc1ss70ncqBu5GoCmpONQRrCRNu0wmkuZBTM5jq
         yDdrI/QyLhmhGeEM4SMcBYUeuaj0KhmbhXGho59O5Elb9DAoonHO8RAQNJZUfN8H4nax
         219g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729632927; x=1730237727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0NGNJR4A85YquAcYDyAC3sQJGb8NuTCy8V8jRDMofU=;
        b=YWL8PPIes6Xnm2XWk0lrYv2DfsTkyzl08qLYexS2ioSVVBqBkquJZN2UOIR0TlrARG
         Q0OFaDIdUb6WOMyuhwUHxFH7/RSxvDNXVK/Tm8UH94lP9Gh/cDkmWw3lHZXLxoIMrzje
         xxdgo9wJCibdGLgr3yZ/64GWvHMAJRv72WB3sXoMyXgiiIkGTLczAMVlgK/WjtvDagzj
         8Eq767HJ/FNK/VVmFnLo0adO7m93lN5/6dwrRKA5nsTl42YparSZAhJ23iLKjGzY4wA/
         hDcdVz/D7D8smHdMxVYayR05Oav6fVZ9DpadtNJDSjDlStF8zKF1EJLYq3Grhe3sp3nx
         4AKA==
X-Forwarded-Encrypted: i=1; AJvYcCUuDpD+KjsxqxRIgwOV9vkxAcDUeQPULXfUgLknw1YCdW8WxM32AQb8G1pipXM6UJbYOYc2KLXT4Nnt0n72@vger.kernel.org, AJvYcCV++mfNC3dSgWxa+ZZtZC1QdSzvwvmSpKAz8+vMN51LFhTUt4eEWlBjxu7IVmpp/HzG5R3p6TVtfzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsdVYuw0qUXDgki7CZRq3zNCRhd6GUrmIPTL9W8VldS+4DSB8
	dRLUD9jYd3JKbnfxDfq4odZDMPgZ+GwLaPCz9377sEvsMCU6DOoZ
X-Google-Smtp-Source: AGHT+IH2jGAJliuhOFOsK9yk/TtpPhYaclrQc7NxH0+t7mZlt694l0PvRq9jNXMbg8iRO2UvfvwXXg==
X-Received: by 2002:a17:90a:6888:b0:2e2:8c75:b45 with SMTP id 98e67ed59e1d1-2e76b5e6406mr384799a91.11.1729632926633;
        Tue, 22 Oct 2024 14:35:26 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed73fsm6726369a91.44.2024.10.22.14.35.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 14:35:25 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 3/7] Remoteproc: Documentation: add the main index
Date: Tue, 22 Oct 2024 14:35:12 -0700
Message-Id: <20241022213516.1756-4-yesanishhere@gmail.com>
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

Add index file so that readthedocs.io pick this file
up and properly build the documentation site.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/remoteproc/index.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/remoteproc/index.rst

diff --git a/Documentation/remoteproc/index.rst b/Documentation/remoteproc/index.rst
new file mode 100644
index 000000000000..af3573123ee4
--- /dev/null
+++ b/Documentation/remoteproc/index.rst
@@ -0,0 +1,25 @@
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
+.. toctree::
+   :maxdepth: 1
+
+   remoteproc
+
+Mailing List
+------------
+To post a message, send an email to
+linux-remoteproc@vger.kernel.org
-- 
2.39.3 (Apple Git-146)

