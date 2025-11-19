Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C26366DD4
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567140; cv=none; b=N2YAVtgj5clA81UGMBACBHt6OhBi16/1BRpq1+CU/QIz/zVdPhIuTzrE+uDcOxIWF6ZBb6p0qSOPOVA2B5889KCe/AaYP6QvZpWVcvSyRGOn+JuiZdkRbqG1JLFMaTQgRnUHa72ZNQnKXF5EECPKdIZhsNCrSM7SorCv1hkDCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567140; c=relaxed/simple;
	bh=TD1by0OTaP880US48xY3+1tAtbimE4nLFyenW4Dl/t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP5tLoPREFZOP5y7aHswO10EpTEUhDFlMwS3QmUq6s7e0lBxgcX9mtA4WqQeYUzoG3En7Gu9WYJbdvrJZA2rh9FIe1BarsCtrz2OouOHJqPJ5YiG4SXt//wKHMzmPW/7rEtkM7ir19HOyYAydw2rqApkECOTJmkh4UcjCuB1QPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kmDHNoQu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kmDHNoQu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso5589218f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567132; x=1764171932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=;
        b=kmDHNoQu64HbmUGpkc9vYVbHScLy0U0K3t13WEAzv2EDq8a8uPl0d4aWu6NxEH4N1t
         DYYE8ac89yB69Gol4kY2PYMld6Mj6ywoy/rzvjIZJaK5HRAdqiRUeyuEFTVsLejLbh6W
         3TJ/neVjVhIoqjX30M95snlbaU209rNFQn27MGf9j4vlM2WJL/UQ+DElN6BeNUSNt0m9
         MtOlEDObIPHZ8AQoxYJFwIPUr/dgA/ysyug1orn6TqhN4UiVORtBU+5OYM511Gy710PF
         t+B5gphP+SGCjRgl3wzXRoSe9gTtaPOY3qj52wB5VXVOyBK1swi0MrDrAiE86iSXtahV
         SpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567132; x=1764171932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=;
        b=OHqzOyK3z7JMrA8TvMOibo0iW7q7XqbklhlB7WzHWhrCjFgqBzaFmTwcQv8eBXtF8z
         MS+ySTJ7vMFEQ8nihlJTDTgXXxRS/RgSmevYUIIhqyjvZQeU0xIGsAjQn88zJLmF3VXQ
         W7ragwez66uMIKSgAyg0SjU+AAJK0Ug5n0dWi1RwvOSrCGT46/8Xjf6aQ6wQiscKN+Li
         3TY31qyORO3poeiRqq3VuuC9AZZGHNYm0lunup52guTbpszJLhAITUR+bjhQ9ewB2L3C
         I/g6bZ7cAH5TWYNzIQIsqE1KAMJMXTcNWF6G1gjX2xgnYRQPP1c4dIiVDv34VzboeXrO
         ZkkA==
X-Forwarded-Encrypted: i=1; AJvYcCUaFzfnFXWAdAAk2fj+58dvNcwYAvWy3Brlm8HlAVxyNI5QfKPm7EGiGvhSg4HLLdkekIZ2lI/Y70GWEjTqT8U0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZUHyQkmoggl9Fq9CUVuTyogGNgS8fdtA8x20wYp9Nq82oh2r
	lxs4WbvrxOyMlVAcXkjVhWgzkkBhi53G9u7lt0Y09hOqzdkIEv/yX5ZHvV6FnC4Uj5A=
X-Gm-Gg: ASbGnctl8u4igH96JGNyVW3sQejw3HgEKAuO7buyMIQc5kAM6wE6nd1wZRR8Wt36RZO
	mtDYhvne1LU/POekaWGjWE1e4vkQ1jFUyqJ/XN6SP1I1jVmkzWoZh3f8LM8YqZ+/6ByTClVQWEc
	Pjb4d3D+IECqmlDgoO+a9HCul9SHLVAP/F1z3cqn+p9laXHdRgVztOgxFkOCuXjA6OTFDKXfYR8
	ppDmrqK63C47Mv/1Nfu3TcfJGhGvoB4JlXA/iAmGruUhE++wDOJUeKXO8nRSJmo36Aqy8cUn71B
	UfdGD9R1xFKfh3Wi2J5oxWgeIP+XShUT72a3+2/hQR9Aqnlfy3kZejzgbMwaRd42SReFDo96fOj
	MG/44zlTpc2usuWNwYMtmFoF1MRVQ9rWLjYBk2BwMLjtdAIn1LSz8xuKmVZRM8sLYIh1KmnH3TL
	XEJBFavYBSudejReOPtf9ka4FmZZZFCg==
X-Google-Smtp-Source: AGHT+IFM/SLutYeAmIo2p7oRt8B5TNnuLzBZ4qt+3E18Kli5wgQjVTHlMxDsxZxKW/tnJD9yRmbxGA==
X-Received: by 2002:a05:6000:2a0a:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42ca449da11mr9102186f8f.30.1763567132399;
        Wed, 19 Nov 2025 07:45:32 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:32 -0800 (PST)
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
Subject: [PATCH 09/26] mm/show_mem: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:10 +0200
Message-ID: <20251119154427.1033475-10-eugen.hristev@linaro.org>
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
 - _totalram_pages

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index 3a4b5207635d..be9cded4acdb 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,12 +14,14 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 
-- 
2.43.0

