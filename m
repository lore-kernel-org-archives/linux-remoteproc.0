Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6736A029
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567150; cv=none; b=XT+z8i7hXUqFmizue2RW4jeE8OU6U3AFJs7pQktoBsKVferjIIVGQMAQZg8+WI8ezgWgJK32iul5rsls/hAgjl8bWQoD6zvhb1dl833q9PP3z6YN3l3L6AE384Te1lDKHEvtpqa83n3PIE4DisLaoJl+Vdqpz0dSINpVx11OTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567150; c=relaxed/simple;
	bh=b7ZOQzNfYMyF79i/MOcMgt4XB6zny2khgQb+AuAIOw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBRrl/px4SLsK8Bd6g4AlYOD3SEFIvP5E0FeqyTmV10JTTyWJSfgWOPG5LFuGAfnXOtJTmJp4dL6vSdUAs0RGKcB6C9TijL8r243Mj/QAX0DmCeTHHH1T4ouD97eq7x4kdNsYvbcX1Zp7M49/R7a045+pVSOulZXhoDQpsBZsZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XeaDF8kX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XeaDF8kX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429c8632fcbso4851368f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567143; x=1764171943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=XeaDF8kX7ZMHl7X8ve6YNTs6euc7cDzNwMF9/a96PZftfKYfkZ/jXE/thXL/LIiIaQ
         Q02MWmIB0O+JZ4GbrTxisOUMxALtAyHyz7jTCadkeqf2n22P1NIagu441f3tgFfM7QcK
         dPVYhDfsgeVsAh6mkKLn7q2BI2RpjPAWudhIFGd5mliSmMThEjsoxYZzUd8k5X7CyRsw
         sHUf1zcJWaopAFbyIAHxwLNqAwpL2GPHXcCGTngCCzojxG1y0pFkuHuu7f41aalfT3XU
         P6RMp8UgCgz+zFoKCmXIQRXYYotpvNuXYRt/Q/hWzlmcyHHgx4Vpn62xuszXtlAhNHlv
         FbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567143; x=1764171943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=g8nXfawdOS8ppWQftN0FaTzJPqnzO1xFKu+nEPdoln6GSM2Rsiif27C+XpxUwKay8N
         U2vn7N1E7dCMgpZid8ET6FiGk0P3DKGTVPtKKx41H1jd0k7jNngyABAkyL5jZMuvp1nY
         XftmTl7hYqXNGjcQbadSR2/OxbqElDRBC4r5suODL9isO4PmruqM+fWaof89539gZ4/X
         PcZwnh3UD2AeYZVxk86KlspurYBb0ReLb9o5N0VSulGIkx1HW+XpdoymSTjImKUA4u7r
         aleTu5jZakfg2OwaqaZmp0vsR2Q10PfAlnt2+dL9w0XM3YbtJLiGLF6VHEWKC/gN4ewT
         ZBvw==
X-Forwarded-Encrypted: i=1; AJvYcCUNuoffAI/M4jL8714KQ+r0LyvvxkRsASfb8TqebhEtWNMVvcTuzNj9sIs1EEmRmnPPE/gqanLYcQKGE1SxqAJG@vger.kernel.org
X-Gm-Message-State: AOJu0YxAhF9n0ovIi+Yj6yick0cSA9/h727wz8b/5uSRf01GonXjpBe/
	L1DdpLn2765vx7lD+gKbEHJcOwOIYZKbO8vwg3ioxga+4ezkj4ihqL5aWzT/pVLdbSw=
X-Gm-Gg: ASbGnctgx0QxkMlPZ0mNGfFxw2KO5M6UngX5yyStiRuzwq0CnqN7qqypwJlJBc93NHs
	I9oN0JPRiLIfJ158CfcI8uzU12g7ZOPxEoLyVpMuRlkMaNA6biE5BeaYi6qUKC7HQy38LJf/8wY
	BIWopBdN87vmtPsA0zuc6lHnnJ7WOkZ5UbikAVNwStnLCc7za7r+0Ukm2P7rIXEEVq6h1++fRzo
	Qv+wMeZkQDtYVFZdDRkW3sVQFHO9M1H5pMimeuHv0w/xw35uHCaHvrEOYX0r9yYbNbMrhuFKIt5
	CsZbggCg/26hfImZqH/0zv349hNmVRPjfuGdvCs9jyqAHiXMqxmgsOQuFeKIeh5EJYoJXq45D4k
	wv+iD3KHfKgX9NpaRpSVB1ajK4fjfj2jBpqmX179wda3jApQhXQSamPoWUYilW43SQdwddtAt+A
	J2Q6jqCxRQngilrMXrUYDyv++jyGysfQ==
X-Google-Smtp-Source: AGHT+IEZRkUZWC9WWo9OX6jj9I/ZWQe6urgV7WqPXknOd3CwNTmQvHOBkmKtLsoZT2TI4A/OTOkOYg==
X-Received: by 2002:a05:6000:200f:b0:42b:3806:2ba6 with SMTP id ffacd0b85a97d-42b593394b4mr21022814f8f.25.1763567142926;
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
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
Subject: [PATCH 15/26] kallsyms: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:16 +0200
Message-ID: <20251119154427.1033475-16-eugen.hristev@linaro.org>
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
 - kallsysms_num_syms
 - kallsyms_relative_base
 - kallsysms_offsets
 - kallsysms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored into inspection table.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/kallsyms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1e7635864124..06a77a09088a 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,19 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/meminspect.h>
 
 #include "kallsyms_internal.h"
 
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_num_syms);
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_relative_base);
+MEMINSPECT_AREA_ENTRY(kallsyms_offsets, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_names, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_table, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_index, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_markers, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_seqs_of_names, sizeof(void *));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
-- 
2.43.0

