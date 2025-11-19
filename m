Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08DF329C60
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567135; cv=none; b=G2LwmK16KkEn33cGfZfq7d+ptEcEayk3M+AFLn73lntYnavZRc2Nesg9W9nSdNh3qFliNeQdi3Qyq/HNiPLcHKSQkoY1Zttl02UBF7MsYKRBw3tzQDzilSEsTxY5IUBccWTLahIyx0KrD1aW6t6qNAz42E3JcK/W98vVdc7nSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567135; c=relaxed/simple;
	bh=o6BmMGmoTbTaL/NtdpUUmzGGU5vJ7cVEMCY9+Mbhsuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiFAGZNqcpvyGYIWrHaQSUsdZY2ksQjGWCtrdihd0grX7QvCtGdl0tcXU6tTEzWq9zVnBgJb4RsT/Gdhw0g2R7Z8l8Bc6GwtFFV8qQxdPRYA1+8TnPAeXbVvZAi5b6UAZGiMKMKMoDGP6GHopWfAG3uCgBd396I+MOjn8sdMYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N97gHFJI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N97gHFJI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a219db05so25822595e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567129; x=1764171929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgfZoRmCPzcZDOEfTe8kWXd16fGbdAbRWXioprv0N44=;
        b=N97gHFJInsFrGAqWXSOC/t/ip/ZFunAGSLYV+sKzWA5YLMvcNzF4HcIjkZQ30w+/8l
         b2NEkLl+5wQZEeu2dyGiiYvoGvRCs9uxQGYtRFf2HU7fxvjIk4olW8WnAVRi8eVxFZx1
         UlSE+dC4+lWgzhgCrkKaUvADoNcSRGotpAoValiwpGmbEaFUryttt3FwhmktPXVdic/A
         vsUycPOVgkU2YZZgl4vqzYcWvwH/bfSrTDwhlAI/HbZ3WDsvUwLkf+NrIuto02BJ/h0d
         eIzrHPrz8EVcC6kjiBrbDOdboOa8zfoPHPFQMvNaobGZfCEACLBLqBnUpMX2REFiOVt4
         D1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567129; x=1764171929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgfZoRmCPzcZDOEfTe8kWXd16fGbdAbRWXioprv0N44=;
        b=FOt6NBHwd9fa7AEkoi6uubHEse5OoFVjkPsB38zZcJnNvu4r0XVzu7B6MZ+inNkiSr
         tx6QAQmbyMzxp9lRZik0bQZ4/rKzQxOmws7My2YWRpd4jgfEzeaEYEDFDWiZUuxMClV2
         K8tpeuMqUIy4L6EHEl/d8m7G6jzRm1kgpGj5lZLZ+W24isrYI/TvLytPUb1+SAt/gxrw
         7wE0EibooRYyjBZ7Qzig1rlXdlKDaCfvR7tca2diXmLMHPypAzNmyeKkDQ8vO2RwEwDi
         ls9KN31qG474yrMfe55jULq7os8jh/SzdAf/mYWXlJGxv829s0PuCbB2PeMUgGQo1xQr
         utdA==
X-Forwarded-Encrypted: i=1; AJvYcCVMyFCyA1UZezmI5Zg6dUCKcdBgS/dqy6TmjEmYSU4PhqtZ+jQRPDWkWX5pvEMjqwFgwShm7hdPWUaDmONotWfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqkq1pfNar6r1IGm5yppBDdtbkjqCqLeQnSHPKUlhYu/Fz/IlW
	un1JPOkXIJayw7IO5MM5XFbrcSAWfwOSIYSjBggaqwDHqz9XqGkQVL287gJgM6/lACo=
X-Gm-Gg: ASbGnctG3OMgDAj90kMTV06PRboswA1GLboFA2Gcx4Zu/OgHz4HMrFTAKZ7X4pyPzi9
	/WmpRPpA3aqDdvfjEoSdWt1GO8KFxJt63ZYnV8BGj3MEIK47q935/oDToK3MlGaqMplbXygugC9
	MypYWuXMHYhpulN2e5xQsCQoo3ZtrnrbPJtDCtGEffwWtO57q9f4P4HnzrDaQ+yy8vjwyINudn/
	XrC5ua1OgJkuG0yh85JIOPzqSKDArH3qfnDHlNOg4PI/9Mu/SqAH2rSP+vRlxZ03C8jHbjHRrzD
	Fr+8ppqI8u7Z6R3VZ1B0yNIS6TAZhppJh7sIWS7dn0OtYdV8IYU1a+d+I8QPXvTKM5IDdcO3xJw
	bUxR+FKSW5pRhGHWqVFNKfuQ9x9AklJfS5W9xhhU1gGC12DLBXL3JWBuHvFFJ+AOQ5HmsagcH+y
	g4loiyF6mnbiW/+1cUN4Wf89JhCm+pcQ==
X-Google-Smtp-Source: AGHT+IEsAcddfcsUUvEjJGVD9iD03mMaqDkbeYnd/gOudjAAgUoPc2H5D0xayvELD1uec3MJtxxFcg==
X-Received: by 2002:a05:600c:4585:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4778fe59a0bmr205474775e9.2.1763567128896;
        Wed, 19 Nov 2025 07:45:28 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:28 -0800 (PST)
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
Subject: [PATCH 07/26] kernel/fork: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:08 +0200
Message-ID: <20251119154427.1033475-8-eugen.hristev@linaro.org>
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
 - nr_threads

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/fork.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 3da0f08615a9..c85948804aa7 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -106,6 +106,7 @@
 #include <linux/pidfs.h>
 #include <linux/tick.h>
 #include <linux/unwind_deferred.h>
+#include <linux/meminspect.h>
 
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
@@ -138,6 +139,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+MEMINSPECT_SIMPLE_ENTRY(nr_threads);
 
 static int max_threads;		/* tunable limit on nr_threads */
 
-- 
2.43.0

