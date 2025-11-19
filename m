Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717A13587C6
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567133; cv=none; b=knz8yRJUqzKNvOLksbdiMKkI1/ARNobqWDzNnKWMYB+FfHSM2wZeP7T2lpAXvSzGrPS2SoVvECjCYu/2Oy7saQFIPCU86m5EdaRH0ldQMRebx4jazP9e4ITI/hYKmRU5Zv61OK0zpi46yfcJQzGRzyKE1hCGQzoecDKcBCpe46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567133; c=relaxed/simple;
	bh=VU47rRSEpIhBbnpqxo3Mzoi4kyXh9HmEgVPJi/PKKQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOZ69klYB780YuyBSFn2mZQabjBbs/Y7FHvIkU4oFVTBAr6R02EuXakD7KXDEOSera7T2kCJKfhualAsEkxndJHQyg4JMbp2BopsNLNVIeLw1YphSrzIKbTZco2kmYBPywf8MYAo/VBAImxtLKexHMrv56pqsrzNnwEv/N2l7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZ/ijRdZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZ/ijRdZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3866123f8f.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567127; x=1764171927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjfIjN6LzAYPexJPKxlzOegJPOplIDmw8UmBc2QBBmw=;
        b=XZ/ijRdZu5x0OvTVmkMq1wPbsmeKFbLQbYrPafVtvHT+ZqFCKf2Qcp9C1tVp2N/J0D
         knNKJXhbr9JziRTGWFdIQncXLZViZHEaisM6DwHPeG9AVVqt8e5GgvS/eZ6W3CQ/wgNE
         eUAxxuNkPdWWUIiLOxyTbNxpAEDi0zbJRjyi0M/skuHii8wzYx9Fd2XFdKA55bwmURB0
         E/GzFp+ssYwIxqtSwO6ujSuf9arYgXH7dCM0Qa9fwXjuXaTftH8SAdowmnTn83UEVeRo
         Dr6xOSIAlKga7MCQloURP4hs/LnWJvAeIdLWYMQ+WB3ui+rujTltgYm6XmZue5TsfJXv
         q+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567127; x=1764171927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjfIjN6LzAYPexJPKxlzOegJPOplIDmw8UmBc2QBBmw=;
        b=JQYtSqd3fVAdawXxdFvc1tr+uZIkzqb7cc1eek+ICXa+ut42u78xC/3uXWNWzaihXO
         jziFctWOPAjjvqVFT5B1vJy3kgWS9cEhzzs4TcffX6Pcf1RhnPIl/+j3F4SiyAahVu64
         Gh2v74Pz6tXe5xKgs1Bc3koA4bCHYNhZ2MlzJ0iUWCi0mk7xV8vWAmJcCfdhVkuayV8H
         2a/ffOXk6hpyIrM0+QYuOrIdfj39OodPcM6idnpAv84RcrD/a0hgE3/6y0m4gW5NNSyr
         ONYLpvw/bP4OiMVpV6ZdentGTyL8MpjvdK7EGkuSgM7PolppkyikZlMl9N805i9+H2if
         GPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUQWbH6Cs1T1L+KUsRKMp9tifwaI6ynqQmmzmqlMdlt+qNy51YA54NVgC3weoQ9qw81nE22HLnjC3LiYBWZA2N@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFXUfX+0pb0WbcLOFRUSOfvG2MINin0e9oZLm9qwSFONZmw9h
	r/xbIPNErGLW7P+vn14rJjUkqV2iI+mX4SGWZp3SLOqxrwLGU8YQNy4i4EAZqZTw58w=
X-Gm-Gg: ASbGncuU1cAeklqbbRCKp8FntwWI4f9/xxRhKUWUP3g3DmD13EGbSuhV7mBXpNsOQWL
	sg8zwzjmapTeBvpj68isgKJtGmGre3G9vnnRy3AuavLNDEu11T4jq3r2i4udgCO826KtDKQSlPk
	YaXCSWDqvXqvmzmpLBQOVrsyk6c4mNJqqnuWwoYwq+GF3HDhDldkN888NSigzbk9m0fUx/5xhvp
	SUrHqoEc38SFbMbLBATiMycQMWKcczTI4/KvEL4RbSnz1aLWuYlrf+XRHMFnkltt/SrKdSVdIIx
	Q54ZgF2kYjwz2EjRdWGOV4j+IKLbrEF0/9h6la1LWW6R0RhmaxIlbCS259IIHCeym59AejmLV5J
	1uxsMhI5hS5W966Hevl7o5ltMK+juPL02BCo7XlwtwII/wWiPxFWkHXxF6KWxHItqDLBl6Bhjrp
	j330i5yuDPNKX7hTT+MHsWDO3SJOPNHg==
X-Google-Smtp-Source: AGHT+IEfh56DkbcMOsGMiLrQQwNoxfW0lTNMGX96p1i+gi2+G5lC/DiQdo+bbBRy4PiX1VmL8kOK2Q==
X-Received: by 2002:a05:6000:2a0e:b0:42c:a506:9dbf with SMTP id ffacd0b85a97d-42ca506a058mr10726960f8f.39.1763567127227;
        Wed, 19 Nov 2025 07:45:27 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:26 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 06/26] timers: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:07 +0200
Message-ID: <20251119154427.1033475-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 553fa469d7cc..c6adea734b93 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of
-- 
2.43.0

