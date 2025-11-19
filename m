Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D982E7F1D
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567130; cv=none; b=FO7HOgXjfyo6hnyeJc+Ympmfch5Kv9dC5G39emp1nD519de42R/Tq3R64utrpFizMp9zSnjGurGtEaglMi/bVBBPNRH32eE367sf+mVSFWgeCh6z8IBz/nzI5P2CGurc2YgGVm658fCLoJ6FoNTxSDDTdV4oNUbch0z/emSmzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567130; c=relaxed/simple;
	bh=T6SjDhmcY0qxcuyqrC2MrBGCJa3hOQc9OYm2K6gInfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldptB0MgVxbyMvLs8RnSQHSeu28L/B/g+5cC/SPDkCJLqNlg03Y1jj3p1WbultQpMGx2gmVRYxhSvsvEYtkCsEYSJk5mAGAUtd6DgfJAI3Naxo11YibZ/D1AdPZsAxShT1zldqcgsFYpOnUbc2awITo65LOeGAmx/kPMbJVTOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FslOMpT0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FslOMpT0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b566859ecso5396825f8f.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567124; x=1764171924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=FslOMpT0D6lQ2kcCfXCiK0uWzCKjdNJ+AScQFNAM8TZvG3xEM7hVRVsKm91uZMaTvz
         4ob7Vilx6or0EGs2w+NmOwSkxBsRgfBYuD4SXQ1WbbhJKL95YIWP18GQZJrCJn4gXokf
         tudwNkwtKWBIJqQsMpTYbscsCy2OJigihpRNBGv+IyyKzjhSkKhfzVARu4Qyx6Hkq0mm
         1I86zQNM4dXOBcXvNdoMUynBcD7yv7L6gKD5o1nmiPzDy6GzgNzrtWtBJYAKSrgDIaK6
         pRjDKWJeLrjp7UAQu+Ih0+8lSAKK0ipcr5Lla6ZRc+MOkqYY/bqS7qUUjRISp7uAjz90
         dUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567124; x=1764171924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=m7/4HWbAxPiolGKCrht9Hs80w4ja3e52+AWSqn0TlbTW/0cFkYR1IO6TmpPySYTMIW
         qHY+GbNn8pSQg63GnwPLiKZTmdSahfMexaROWqd9lj+CzcJVYSlgVB6kAs5A/kIq5bm2
         NJrcJfFXBWOBHo62MEjZBqH0LlCcJXkpuhyP92QZUlW+l3flyFWgfxNhnXseV47HWW/H
         mZzNUwjlyrApkjhuSq5pkRNndphTo8iiuMQctuED4jCSGbk2KGhqPRjkQ98NlXTPZsas
         fn3TXvKTdLEbvq8mhRsepQK7HaceicmV6scyKuJnvzS24fPmfm+vEBKZYxEycLjF3ZWl
         LmJg==
X-Forwarded-Encrypted: i=1; AJvYcCXEjFWSPUdFApeBZaHOksBGZhmBc8i+oKCfflOBq6c4qXFzVBUNBua6PxxiQunaRmdUoZQqS7h1OD7L0kHmf6hK@vger.kernel.org
X-Gm-Message-State: AOJu0YwZaNmfhK+Crp1WHUMJF8UdeYf76iAmJ6Ja8CmufF+HdBxvRuLl
	d9CQ+9CJAArmU9HWzhwDfQKD/DOYfjH8R5SOB5gHOt3IllbNf4XeVla9oV9OXvM/W+g=
X-Gm-Gg: ASbGncuLChHMqpWYuOjZa3qmTAbzih4lt3lqb6j0EFR/iAIh4P51lIJ/G9WyE5VYOIO
	TOu3Aec+PbWE2xWjhwJfkCkVCbdOMW8iK78puDENrzKkrs3rr/AIBgLIURRZsYkOT3MDjr0nzZC
	t1HQHGxpBIjFifjOaJzTrBuFQ+mQZiJYI8kl/wDF+eZ3SyNV/OwK4ozh6q0nKQyu9A5ugFtmmWe
	StWTldauTB2KsOlgqcm5oivL56siVpa6dWeZXagigXktDuyZDixPc8RlKihgRwhy2EP4lHiblQu
	jU8YeKL/mWVEnb8x8gUCaraaAEcHpf6dHUinmkRkbmrSk/QEcWnSsylb8G8IA3VFzZJYDxq3EJO
	yy5ggXrHDyUdsgA92RoBpa+1ktfwqUpsVydguiBB9x8pgnWReYD91POohp56m0fHjdaAeWTqcmo
	1Mn+mSABLOl0xVIwGNV1MYKUxYnYAK5A==
X-Google-Smtp-Source: AGHT+IFVCfX9pNo5qLPfR5wjMBWTLaRukJCHurtJsWmWrjGoOxpQq2PCC7itN5NhSfJZMSf9UOyBtQ==
X-Received: by 2002:a05:6000:1ace:b0:42b:3366:632a with SMTP id ffacd0b85a97d-42b59386ademr21562007f8f.39.1763567123749;
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
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
Subject: [PATCH 04/26] cpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:05 +0200
Message-ID: <20251119154427.1033475-5-eugen.hristev@linaro.org>
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
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index db9f6c539b28..1f2df5a5b9ab 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -38,6 +38,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/meminspect.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3089,18 +3090,22 @@ struct cpumask __cpu_possible_mask __ro_after_init
 struct cpumask __cpu_possible_mask __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_possible_mask);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_online_mask);
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_present_mask);
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_active_mask);
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
-- 
2.43.0

