Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E60E35E53D
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567143; cv=none; b=MG+wOHfrPEMM6zR8mRdq4exQZEOAUYpYT6zBFvm6r+9B7gTmojKz5ZVJniUuJnX3OO+j091BUeKthmLH4k5a8LWUVvdyUl6GYksVjlD/kAno5NpXIIiH71sFYZbQCTGsp8tFy7hWSD4moWsNtLbQdDYg7YJt/L74nYh2F4s30es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567143; c=relaxed/simple;
	bh=3D6cMAtJFcH0eGhpLiRPBCAWIwBu4/DIokVo2lKhkeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPB7AesTnTwxTeQDAf0YXlOYLdFfYmY6oQcKCjYxc17MOi6fNwohz4BKGwZPRSez7siKKFuBDtQrRQjRrCO78p7T+jxDXJS5iIW8RDfIKKsgQegLyp6TkL0NTmoBts3/KewAgNF+7+6YE4PHEfDuhufIssd/omKpbkIGtNGjvec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYLbNjJI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYLbNjJI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso3464148f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567136; x=1764171936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=pYLbNjJIY4xqxEIuEns8uXjvZ7F9isi/7jugo5Qj7mhP9MDL/QpwdMISZcJdNL9qP/
         y9ZVXz8oEfwgevPWLkpZcPeLF47jsOb/XLf6/K0XXuPwugKhs+phJYcFTU6ZYG5E4S/r
         o+Gp6z+r3MWbQ861Bcu8Uuld23esVOU+yE3rs15fEovLoc4dr+ngBE2HsPuDyaaBMk7k
         PRsZEYjW7PPvzzPVl2RzcO++pOHfy+eUzYEjW15SHSG2mnuw9/5gHaT85gJU5KvJyeWx
         dle+WOQC/9zPb3r7giPWeiI3kW7J2GODRp8Myf5WewGW6sR4l53Vhkhm3IGgtNkPpyaU
         tTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567136; x=1764171936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=deJTHUAPmHB9Y8Dz0hwearvhp+s1Mq6yVoA7up7PJVxI1Ub4W01xi1VJ8vU0uFY+C5
         4ekY8XbvFsWwMd9s+Dr/WbYcEyMV6vkfngTUw8eyuRF5ENR7m5YeKf7vCBy5rdxea0v8
         UuEshBeVR4Muz21BlJkOAA5VVsVRwdApMLwnRTZBsFGLGkfYewzYIejYGiYEMeW6POUz
         4frFWvokPr8JHYHLndLnkvfhAyzzqlyubpP7VNZyN11VlLZEXpaC8bpaJO7oB63wvYja
         U6kFZvl7nibKIg8jxuetp+yCr+qDp0PYdumPGs+l6oSjdYCtI7FJQVfVCY5ZSS/grBI1
         MN2A==
X-Forwarded-Encrypted: i=1; AJvYcCUbx5AaaGJHz4ygVRt6238fskoj7m4oTyor6vSXpyIu3zoKU+4wijJqTcr/zeSysjlW46h/L4PddaNlztHvJb9q@vger.kernel.org
X-Gm-Message-State: AOJu0YyxgHujkGRPHVsoyOFPfdWCT/UupgeCMQso9Pd6u4GdHkmhRvAB
	hVnqFqbECDPNzHyhqxXxFYZWkdVLw6hH6/5yixfnCBAuwX39t/95Afquzuo4xLGRBdw=
X-Gm-Gg: ASbGncvH6F676M9NNHm9HQg8v1lGZV6L5yW1Qm8wSLDNiued3F1FvN+BcTlSvOBzrzm
	tlQ58hSgHn0UELAnl8upxsk2zz+tUdvqaRhX3qsk9Hj+irO1C3EtL+2EPm5tQU1lt22Kj9AKPGn
	YdO6YbdqkpFL0Jl7lfhM1Ilh5W7ZyP2AOVbKgOPW2HuH5yK2hPyCBvEAHu5axlU8NHydyu904V0
	PA/6S7jTFEHVV4Sk8qhdSJMAItOctgeBGmiGQ//P0c+GmH4q+hM+rnS249O1zRP8wlozWUBqryG
	i+XpUYSV3bzRMik8Qbb0BUJVGNFisHxajkIiLy5w8HLJwi4hfg9wo4fUxStPi+KcdIok/tiMn3m
	gyzxX/jlSYpk/ohNJOOK3/6sdpsYPq6pHQux6VbJYWwnxxJlPQgK0b2uWCxBNVkQQNB5AIHOedd
	snymSdEE8Kar+TkLeAVD4y94IfLqf99A==
X-Google-Smtp-Source: AGHT+IGKFFWZ+AqolHJ3imLY6SMDSF30b2mMpFX+Q/YU64RzAj2P3ofwp9AZZn8blv/guB2oFBfRQw==
X-Received: by 2002:a5d:5f93:0:b0:42b:43cc:982e with SMTP id ffacd0b85a97d-42b595a497fmr21650580f8f.36.1763567135863;
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
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
Subject: [PATCH 11/26] kernel/vmcore_info: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:12 +0200
Message-ID: <20251119154427.1033475-12-eugen.hristev@linaro.org>
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

Register vmcoreinfo information into inspection table.
Because the size of the info is computed after all entries are being
added, there is no point in registering the whole page, rather, call
the inspection registration once everything is in place with the right size.
A second reason is that the vmcoreinfo is added as a region inside
the ELF coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f8..6a9658d6ec9a 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -227,6 +228,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				  (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 
-- 
2.43.0

