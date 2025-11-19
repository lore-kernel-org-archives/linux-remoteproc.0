Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC33C366DC2
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567141; cv=none; b=MHAfsKPZVv32IW2f9i5vR6kNt1tWDuQ3OtO0rvxmnq2PlzBZrvnKx1jt0s4mQBB49PUFWtlMKK3E6CwjFNWU2Jr6gqT1YMtnEN3VYcuLXt6BuGNir3G0PKqrmL9myxVmehAZLLVd0e1kUfoc0ylagqII/QrX8HGxrWB/ibf5S7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567141; c=relaxed/simple;
	bh=+VK7KRl6+Lq6c3QG0QoLNUfpAYwW2X9fA09G/NfS6uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlmaIfwB5tulSXuh4ouSwY196zwRbdnZUhk/x+kpxxZv9fNbtkbOO4fZ601Mkkxf9qtGoFuQmQNZr/2G9cEVQIQow7J2abOgcgYZglA7GunQyJ7ctY+LndSqvmOEZpt/GLkrqzrpFHcBPBy0lC1Y1zATlQIKwA+tpXWqPEFBwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j6sLEfh9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j6sLEfh9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c48e05aeso712915f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567134; x=1764171934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuFAdi/dQ7TYcP6kPKC/D+o7MTxWjWW8Ku2RD10GvbQ=;
        b=j6sLEfh9uv7+dsvFnDqDQa6anzRkocsy8dt+OoGqRNipZTLpbhM0kN8gp+hG0HbaBs
         MMBo7xYfGVPH43vHvKGRCgch64x3w+5gOHyhKTn6HQ+sYqIorf4m52B2SrG4bBRx89Ci
         k7s7HPQsG+hLYQe0dBWwwYUE3j83EEMt+amQKWLX6AugMw0fo3ZbbVB5M+piJ6Meo17+
         DvU/V8qk2/79vb7SU4ODsNiDcw+a5f4qtSc80/uGNdJXinhamtY1cOT2Gtifllx8JCIq
         7cY4R9Y0192OrEL58Af8mu4tpPfVY0/Be+sl7rGwPj7IfS35Td5zUv2USdiF44V8DV8K
         PVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567134; x=1764171934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AuFAdi/dQ7TYcP6kPKC/D+o7MTxWjWW8Ku2RD10GvbQ=;
        b=ckdzKyLJGMwDPC3YZgpQOdE3yLsAPCU0i64AXTKgiIJd44Kp1EU9/VwS0UcbD+JksB
         Dfp96ZLNzrNm1TRpmD0OmltCGsI52wMb/XbXgQtJ0RQNg4Z4zodIBDak8r86mFRe88S4
         JmX0yBxQI3nzp87caTFlFhm49Jxk8D9h5LcyXG3zAC8K0MsZxZPpNxLbHHVrpcL0tX+s
         qmmhijEHNXv+TKgETJkB4a9WbsZAQiQbvPgcYoq/Rn3i6AhPXCstyk1KdpWGiqvDDWbZ
         W4r1NuuzOwUMXgBB6R9af9nNk+SglK0qgCDmTlvBwJd40UpPz33GUt4Sny6IHTMkD/AA
         m0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUwVydVa3i6FpUJd7m5aIk88JmlAFlOye/PLGu9OrALaGTiRctm3owORCnevypDzVgkiasAsgdjArOdYzhETCRN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/DQkUJRgnEC5fhXXMOqry+Lg5eJNLqf8KI1798X3dzNn7qM9
	x6TOw0xK0BcaoeRi1KLPVWrAqfeqfTziA8fqdxZvbYeWb9BOquvuOe8buAgRiKO9fjU=
X-Gm-Gg: ASbGncubc4QSM0peYbTTT9tbwsgkLbn3Yd0cMbuwIaN2aydf7ipkzPOWNU19/9N8e/R
	xOLLNxxZQMCXipyfIpLEr8B929PNmHubxKP15oivEHK3+LrOyw31hOCrZrZJ4HTJKqQd7f8z1JB
	2Nxzt/cwasRGWo5uigvclsDiMcW8QIvdzUC6lafAYR1LVrZynuOAcdrXi44pLx8I1QhM/RELaDi
	JYCR/3ifVpU2KXcG9jJoHLS8Lld/ckhpI5EnrCQqU0x2gizK6khd5x6EvUck0zrBNfv8g7hBECW
	8xffMhBj7Q4yEEGKQCKYTGJu5ybQd5i1wkRYZnb+OAdGROIJ9ef/iecMFjuJTtS6wrcPT63qgCe
	KZQWyysGBDl8ysvXWIhWvOGnccpiwxHYVFcNY/VGC7iP6fGD2uwcFyyTOE6h/TlwzQHtaj9dI5l
	cQAkvBtY1H1f+cPyCW/YbF+5wfnCjtMw==
X-Google-Smtp-Source: AGHT+IEEW1UNe8+i9pRkQXcVi1K6qHmkkggtbzPn6ocK+c8Bp9XYSPJPKkUMg9h5XQagLem1rvsEdA==
X-Received: by 2002:a05:6000:26d0:b0:429:eb80:11f5 with SMTP id ffacd0b85a97d-42cb20e4a02mr3468125f8f.26.1763567134112;
        Wed, 19 Nov 2025 07:45:34 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:33 -0800 (PST)
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
Subject: [PATCH 10/26] mm/swapfile: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:11 +0200
Message-ID: <20251119154427.1033475-11-eugen.hristev@linaro.org>
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
 - nr_swapfiles

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 10760240a3a2..ee677be19041 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
@@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
 
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0

