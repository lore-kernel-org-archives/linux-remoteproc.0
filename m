Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457CD334C30
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567160; cv=none; b=pAVl7svL/58kQZi1q22wro30jcLKYA9aiIU/1EPGL997Poo3a3TWsOxDIfg3g1JIxzlJMPGq4twIOy3We5AViRyCNjrT8a/3qZBuF9IFHMtKkWLN6eW3Opw0bB0sJY0nQsqZe0A1EFN09k7tZO4AMP/45sPYsy6C+BFfkDgU+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567160; c=relaxed/simple;
	bh=f3/jMwmnVv3mI87uodqbEJ5zmLRyilWaBRh2oB7xeIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyHThII6DgGyC9bnkOtRK2iL+2DPjQ+9Ss0ySDUdmyrZru8YHqPxDU1ysi19nUprMp+h0ZAYFajVvwn6qisRjORlkYOXvnUN6aYb9UDuTahxBD+zgfYyr4NWOCVhteUBPd73G/uXsSdCaSfjmCN2XPbpUjla7ztIQ5K6jAWU94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXrmnSHa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXrmnSHa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477549b3082so56842855e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567150; x=1764171950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=XXrmnSHaTf1vf6uqqllPUT0sMUElMq1GY66Her4KbnbRi5e+DUU+M+SWXGUt2CZ6yi
         Fcfg1D6NcZVjy26O1mHYrbiVIPaAlLBA2GBqvpgLMBXyymHP7sB69YUN84ZdMxEQx29S
         DToilDeS7YIqZBRpQLn/r+GmhRa5gNuXE+wcynhuswMQIYn0NsTWAoMVNaNDtskjuf6d
         eua2UlS0Q7BEVBAS9dnTmdA56yZpIwU8XFShysHoYhbEidZl0ofZ+gQZPlTrTx3l7IgY
         d2eNag3MWaOS0TVX4RMZONoYBqxONt/LCOMwvGtHCkIwtA0Jveoa88lEMBckYQCQjlIx
         QEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567150; x=1764171950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=HDdgvMEfahiXxoYLu0NGRuwR6eSWGrdS8I7sJurb6kTK4BIyf4S8ES9+aWH5AUfGL6
         DWEry3dgT4aD6dz8bLOrj/QmZ9AlzE/3zwZveLr+A7xywawAae/Oa2dTD2b21FKutrrB
         qmhg1JgHaOWCaWomPMCjfysDUEP0IVWLbhoIwTbfhXdzJzcbl0xo76c64qdAU8PPumBU
         0uqpBNN9K/zdp4M2m0xM/0qzrCVquhhJcqBxXI8vZMBCqUrfdcizSt9UNwbwdbG9rbMI
         cK85fky6SrW81qbPGargyJdd0tcX5xnc+DkTdK2w2ASBo0IsHF75x+21PTfy0gCEUSFn
         zKSA==
X-Forwarded-Encrypted: i=1; AJvYcCUjgakkAIyDRzUKSFb58/p4/kRw4qPwwsWGKM9gadWN2qGeJ8X1V4xzwtBMqurgody/2Ca8o+RBbRz3fbX+EC8Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHkXb1VJzAIvzfkFkofTgIwzogiksCgGOEeJ34zwxEBsM8NmR
	1nJpck0RfE31HDpnd2iopVI8KKp+WPjyu/oOlthY5ZRl6Ks9oD10FPqRCePJmNbxVqY=
X-Gm-Gg: ASbGncs+ITzQRItzuUde2kau7ZbtUZEwXKr1GqeorU8c5OgHTwURaA/S/H3khK/aejP
	HXZqRlJtuqmWGXc6LS58bnAUzE7qNqpsXuu9VbUXgSvOiFxHapJHKq9HXqmfm0Qst9qNpZp/bY1
	LIbER/fM62f9WtLYv6SyWxzazamBbdfyMPxP71kl0akeX7u2Z7z/MeVnAV8Q9z8dtA+FauGpQxQ
	IqoDfbvU+x2Bpo4N2Dr1k2nypj5rwZhCd10q48+o4Dd7M+vXWZcniexBJkuQyM6kyLrUfRi6Iig
	nMx7Ex0FLHpcXEZN3ioAMnhk28Yrau7pHZnsbFqhL56FYxKxjHOYaIaXoKagCkgnWZdK7SWB++g
	jl3d1xw98wTeaB04AzG0Q8aRzwbQ7eLAMATSdJcOwSX9V7+VOfGrqKVBzfU8U1pxBu13ZdoYH0/
	Cj7fOFWq9VZ0uq02+iI1lqxg83yRn/RA==
X-Google-Smtp-Source: AGHT+IHArpVzpD3LO0mA1+dNKflLF3LKgYCdBzRW5r7OQjPk30YRri90746lAxdaW694nNfBsFGkIg==
X-Received: by 2002:a05:600c:a05:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-4778fea881fmr202472465e9.34.1763567149948;
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
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
Subject: [PATCH 19/26] mm/numa: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:20 +0200
Message-ID: <20251119154427.1033475-20-eugen.hristev@linaro.org>
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

Register dynamic information into meminspect:
 - dynamic node data for each node

This information is being allocated for each node, as physical address,
so call memblock_mark_inspect that will mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..379065dd633e 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	memblock_mark_inspect(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
-- 
2.43.0

