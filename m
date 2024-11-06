Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A588191494;
	Wed,  6 Nov 2024 05:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730869826; cv=none; b=Nuo8+l9GgHfN9n+pdAUzn23nsJVsJ7jtITn3oFMaEsHqFWWbXa9vN9bKgN/KxN9crRidHFsSfrGb9ACLJB2ffAt758TEZm5AzFs3LQEjdYpTStvdgxyGPDvKCH+auntHfvr9bhK7BPzPDxt5qufO5E6QN3vNS3YZ6WZEQj3N4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730869826; c=relaxed/simple;
	bh=uVhGRI+i5I4igu+9rTGQnM/4QlKhCZQJX+qGW6NeK2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lCmqpLDY2FVbQ9JVBK8yu22XcOtQr/kp4FfLYJqJlGOBnlxHdSrwCd5tqYD5E+wuJZZv4YCSmEz+FaafHCkJ9KUTKcnXT2oHlf4bkrfJwbZ4QbMQeFX6IEhxpLODeRlVhp0b29rSXI8Af9XvwqG74WEWOvYeMxzwGYBEDKj9n4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwAKrJi2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwAKrJi2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c8c50fdd9so3504565ad.0;
        Tue, 05 Nov 2024 21:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730869825; x=1731474625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyDcOUxJGr8liC+ojBmJrjmCA3eFLmNZPnuaZfrVqY8=;
        b=KwAKrJi2QldKV529nkpCdjNffYQFHZTz2UCEIIfI4umKyldYzALzhwN0k1HygsevRJ
         ZDze3LFE7+eFzBF3Opy4pe6N1xP7+vkkXf15qsZG53tggtQ/0OCAtiR53SZkOHxqLkGX
         M7t0vcc/O2HakV4RmVL+EqNdzsQ9I85p6X9+Nmsy5fsSroTWNroQRzT7v+8RP4HTPqS3
         JEbxZ5Mag2HgPtaSXIobPxF64mq2s9r7o+JzE6+n5fXl+czK2DDtXCgrgF8qB6MJCmg6
         V2x0EiZY68TUoypMfNxnMpmkhAiYh9lWliy671ntt9ksNlNSa2DCiLIZz4gDorOHrPRO
         mOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730869825; x=1731474625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyDcOUxJGr8liC+ojBmJrjmCA3eFLmNZPnuaZfrVqY8=;
        b=W4fTkXMYWwoXn9D9js3oG/DAKLXYBjxsFCrfw9c42Bx1d3JSY/qy4G6n+aWEC/erqJ
         /PxNs2IZQz+UbGZpnq2VhKQ9lVR8qJi2mYSTMYmvYtbcFjTY3fKzSrEFdoC5hktGKThX
         7xyMdA4ERlw9BkTJRkpXqBg0Cx0vmsv4f52xyalwOc0FwPaIGtk8cEb3eOx/x5NxD7Az
         dX0IbtHctOb6cF19BDUtI5azMaZzc4xcolEOxU5Qi5jVPnzneXx9IUhkdDmhIpqe6tga
         JHZS6rsgQSYRd6A13ZyC8ZiNzjhFDhUV5R4fAzKTsTWM6zTnDJY448W+Gomgo+OSxh3j
         qM8w==
X-Forwarded-Encrypted: i=1; AJvYcCVrBvIpx6f3aSGRV3VN9gK13Q9J8fRl1UvPW83L+dx4qDEPeuTYon2MdKV7JjkA4Kab5+YBttqeVAggkXJmRURwRg==@vger.kernel.org, AJvYcCXKiNfYwfZ4hI+d38h+npjD9wEOWAXLD3OTuFwcar8gef0YskvCSDmD2RtnWrlpFjLKt58ABy1HbTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YypfYM6ocjkymmKv20ZpPIyXR0f427fem++V/vGJ4UdCs+AJFDP
	Z/R1dnXpn+giDnMeAGbdnfgis2x+fmIHf+rxVQGtltorj5zZcc3X
X-Google-Smtp-Source: AGHT+IE3YvjN8X4Yecy3f7wm5WAbZD0itj0NSKVcXGwbs88PqaG/iGQ5LzeZEwjAYWxgdYlHXADSOw==
X-Received: by 2002:a17:902:c40b:b0:20c:7e99:3df2 with SMTP id d9443c01a7336-2116c9c8508mr22386415ad.23.1730869824605;
        Tue, 05 Nov 2024 21:10:24 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:f510:c8a3:8415:793d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0825sm86266055ad.207.2024.11.05.21.10.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 Nov 2024 21:10:23 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [RESEND PATCH V6 1/3] Documentation: remoteproc: update introduction section
Date: Tue,  5 Nov 2024 21:10:14 -0800
Message-Id: <20241106051016.89113-2-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241106051016.89113-1-yesanishhere@gmail.com>
References: <20241106051016.89113-1-yesanishhere@gmail.com>
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

