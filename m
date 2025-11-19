Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93E936A03E
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567154; cv=none; b=sCyZ0lGEGE0x8eqqRF0//nCC8TQ8rlSzoSGSgN/V0mZedt345s4SJUdFiEWDGFzWWXbNN1TVRn6FyC7CMPEjPUbYiPH9pLv9H/+VLpjPO7e86UzOoBHLwKPnfnCblYNUy25mXeYA+1r6vD7N6DSoT1YnaCRDD72bsK34VXgpAbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567154; c=relaxed/simple;
	bh=1fpsqew6FkRmrcxog8da4NhZ+AALs5Fn4Z4m4DLttGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhAe8rXJixwFZTBlsOAZlIMmXWTScFXKh0b8xI0ECsi2siz71oCRLhdoONfEa88ZrpBWWcQOVljTypvPiGuiK6Q0xPiGuOZhQJLS6nThRBGC5DCD03SxzcBsn6SRoF7rsozh9dbNPn9wJvtl1dm+x1wRkvxGrQ5G1/uenfoeMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDFZ1Lau; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDFZ1Lau"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso9457065e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567145; x=1764171945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf0q06JpGKFVTNkejD0yb20CFvUyN2OLH5ZYFwRjaWU=;
        b=TDFZ1Lau6WPw6tyZUAI40mJfoARSjm8gLGa8hZEvOVsTVCAvvEoljNzjcqBTO3a1h9
         UX3wEiFW6HWi3GXSZ7R7C/wR9O0fSPFtMH1z8YTC6poYITj+PkCAMn2Uxa8k1QP9IEZg
         ZT3mUC3nibavdyK8E1rX5NRrHwzyeBVoWusZ8P1ljTrYjPJxQoBpdiQ9aW/xIQ7zdBfl
         lURYj6pwWn0cfxS5Fv226Pjg+zV/5OcnYIJN+UrO37SelHg2c+odhEiQCb4xNHL5/wh1
         2AzQ6Z/LAR1mF/VSx3U8b0YZ7wWAXgFO6Bw6877BgJDcul1GYRjqMQGMkLv8OYLKigZv
         TsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567145; x=1764171945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qf0q06JpGKFVTNkejD0yb20CFvUyN2OLH5ZYFwRjaWU=;
        b=bHBn8X7rGcCD+kkJGBoRC5H2QFrAJxDd6c9RPfHiwwC45rXjAZ9wwDsjEbVxqz2Oc/
         PKitkCR/t6MvpJZJAgqwyWNoS/fEr5DgATzD/vbW7yI9U4JiciOkjsh+Psz4h195AlWf
         B8X75Hn/CPEScDbfLsOZx1jKrew/CcX57l0Q5EQ7kLHnWc9ZoxERK7bCu3kET5KsgUgL
         jLO3T5tajSHTD3CnelOQcrVRcMbzkixOpKE0fvMr0ETEmHNHpBdB6xVqvkxOQQBnExjb
         Hz426ZubtVpdgUURowGPYzGtf/4nkHPqJ9y29iq+beMc/Ux4ubkm52lD6CDr79DqYybd
         +hyA==
X-Forwarded-Encrypted: i=1; AJvYcCW/cUF0eQvgnzQkMt+3ACHFyYQVEegiLysyF+EMxt0iCa/wJbCd+PwwX19MlvxCbWcvGeZo4YXvvbm0fS/ER2ev@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbw0vAJsKn9BjfFi/0itr8yZgf9xV1KlUUxaGy5ScJah3ERyp/
	mzM7W7YqlvRhwblpSQVBxoCrYDQY47CSSNsePsgFl+lS62wp0kSJDsYPstdpNz8ytms=
X-Gm-Gg: ASbGncuu9yS6BgYe7sCT7DslNDwSSyiTuBANrQfR0ZSXV3Qi2fkKqH8CLbfcOLdpDxo
	+UoM7xv6sYdXJfkZKa1XKugl4ztGgJaUDMYfH0ls5AIRph4dLqUGyWbbZ0bGMk54VdeSWKj6QtP
	y9CvEtbfFP81uUWkpx39TD+Z6J/WqWJ+uHBvOH1md7D+cdhBqwFlqJVmFup4n2xgk72MVfID8r3
	Ic/W5EAz2ApXA0K5bhlxCe6bjY/T69elTP3ESQVRaROAlbm3smuAkW8VEmt56xKcT3oWIgYfbet
	SevEsZ0NVB0fYJih9EtwbNfn3jarG7KC9JKESx/YRkpGbrB5jPuqQuctyc2m0svcEQTzhstZE+x
	LiivgR3d5d/dCE2vmkkUquGxcOACXUlJAsjo4HyCTIHnV0S8uNqgjYw5qjedxGwFL5/ctgtqyZ5
	JnJzczybs57xt0DSJ/2oUUgwYodK7x3g==
X-Google-Smtp-Source: AGHT+IG9WtxjjgmkiAX9yQZlIznike3yBomBYuHSDjoJXaquW6OMMeXhxlHfzRespLZJBzb+ERriSg==
X-Received: by 2002:a05:600c:2313:b0:471:793:e795 with SMTP id 5b1f17b1804b1-477b1787bafmr21362035e9.0.1763567144657;
        Wed, 19 Nov 2025 07:45:44 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:44 -0800 (PST)
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
Subject: [PATCH 16/26] mm/mm_init: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:17 +0200
Message-ID: <20251119154427.1033475-17-eugen.hristev@linaro.org>
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
 - high_memory

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3db2dea7db4c..c31062a3ff47 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -52,6 +53,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
-- 
2.43.0

