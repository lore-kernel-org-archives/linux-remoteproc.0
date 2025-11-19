Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ADD2E6CA9
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567127; cv=none; b=D+VWE+lA9k/kCdytjFjAHESyQ8c27sUQ+enagYxKdBRHHiPOPs5PhaexqDimjuFBmL2oZgfQR6GO/Os+yskRk0RRSAFInfTXNTZ1uJjN+NFSAhpVBKIHYQ5iQWT3W8zQkRrmlrV/0IH8fb3qg1H4lA40HoBa5Qy+dtNumP9dWLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567127; c=relaxed/simple;
	bh=xVX5vMoWLhUppTQAzGqUyciUL0HvTWD+fRU1g1HFtlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WprGu+mg2NqImJnR7i0GoVHkbXsuaSgMR4iLq+s7raNgabbMv5cUdGqXAPLX7CkAgaxhb5b7rZ4+k7xOHeHu6f1MVjgke7UCt/jobHjuumvzZmC/VyjDDRVfX6LNDZ5UgHEXOtUC00/NffGjTjtMqsIJ0ecQm1RXPSn537OAaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s77ePi5V; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s77ePi5V"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso38459445e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567122; x=1764171922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=s77ePi5VwhAc5RdCjyAb302P4Ka1p3s03BC0V2FspdVUm4i7WYiQ2/MLytX6QDfaGN
         kK0mUXAjWAWky+BcR4OpUoRFi0GuLC8Jj5SFvNrkKqqTO0fWekjRVtmOv5IQvQfdHEQK
         TgXteXNfAy3vUVfU4mt5qaDa2qJFDh+l7TG550TjqEsNBBo3aCcHsKC73Ycok+9pbhk4
         4qiYo9F/ku0uKX/a+S6dfpVvgv0UCLbmIZ6q2Z3sPsILWyDBj5OUEh6kQHBhCPh7EmVD
         hwar1tExtLfqrIQdYXQl1vj4KnszoQmpLBQ0hyx18qnEvaC6g0olZ5w+plmslpAGCUNT
         kFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567122; x=1764171922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=T5vOO2gJrMbbH2TUCO7hlkqxTGtelGqg8kjxIAFBto+U/iBbVuMX5FB0RuQsU3PEbg
         2l2gJn8jv06KmaN6qdBQ3iYAnPqUL9RzP2cgiJgOrYGeEFQOnAfL8MWZaFoGiyytG7me
         jnMhvqT7IV73ZrcMApM9ETCzfEt/yGz1u1iHgFK+epBABbvW2d0dzWMFJ7J1Q46Z/OxW
         QLPZcW595FA6CQS5DGz4shOiTrb8/AADM2XJ5iO2F+F6Gz0ukmWuR/T7lYilFKuaUcx1
         CAMVuj/Unx3ZFY8D2M7OpcvxV1YtK7892hPfjhXrIiDav1rbs19GuBW0wPDpk7bubcg3
         YAwA==
X-Forwarded-Encrypted: i=1; AJvYcCUPGM2Zwd7/kFb+XlSBXCxA6v0EBz0FOJR9VbU/ZHvDZnrnnksLiuau1+HkczsquDDik7tqJ1v6yygmnY5l5F7u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4+lEVv2RJePMUBttxcTRSJ7N56z41OrNInHiQzVKNKEH2Qxgy
	f29rpGT8K61MJ4wMFnxiAvnzfn3ymqY9GSiCqwlg51o4rK9dyAjc9lOSELgazfQ5SYI=
X-Gm-Gg: ASbGncvyFIaHbgkZZXfMLvaeq/KW3Uf4ERIN5Z4tWu7ZnzzWFgntSVKg1A2QPl7E6p1
	J0ugX+bfEpzwUS4SaAmUCNjfWX6sDoKePpLk2bPzztKJxzPNs+ABeboV/F2X7cLJM1Ucf6WPT7o
	7wrzQSTmQxsqPoqODZBYAD/nCxPgfE3H5DIz4E22nCh5Pxs+1lVywmWnXtUeBSsl3QqbPyblaXc
	t6vJoLgau37sZPor7iiMEDlHjVb1Z2YMfjs4Eb5sRyETNf8zZAqBx5eTYYbs38jdCnUMaOUC6rD
	cv9N5PDCrc2bJIgVSHE/hX/k+qIgMGcO3WMiiYm6FAgKPEIC8UMeMcFlxG6fC8cPH9yH0z8rpiW
	7PQojDD0aYtLPYAAaFbM8M9cCmETu3BesjnWhcYLSI/1xfvjgBKn0T2a5ErN0GTFZ5fErELL7GV
	uHqU+PK9nI7Jyn1A6jFrM=
X-Google-Smtp-Source: AGHT+IEf0A8SfCPAIU5Y+01ECXL2jbadglpozgNAZPe+3fJhQYPBk8r7h45IbtadEb3Wt583O3k4NA==
X-Received: by 2002:a05:600c:3587:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-4778fe522f3mr209598755e9.5.1763567121930;
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
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
Subject: [PATCH 03/26] mm/percpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:04 +0200
Message-ID: <20251119154427.1033475-4-eugen.hristev@linaro.org>
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

Annotate vital static information into meminspect:
 - __per_cpu_offset

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/percpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index 81462ce5866e..cdc5b30f6a99 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3346,6 +3347,7 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *
-- 
2.43.0

