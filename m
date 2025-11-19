Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B132ED53
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567148; cv=none; b=l4oUni0w+UXWO2N7n90nnyAEe030XjaF2OOsqhJ+IjXrWXUZ8i40HUskvCw2vUHFFM0JofEVMmJOzMicFBT2G1ERC+CoSWQZXfKAeRJNbtQk2aALB/w5+90ycmcscEFalpVD/utJs9rSPv0xc7XbaIdmyck8ODz92v0wqCc4Ykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567148; c=relaxed/simple;
	bh=oxMJ7nEx298nSQNAUvIm+RfzZDeUkq7JnffHAGnHY2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZlFCgT7A6fgLGXbvXmi0nNKn/bqAgSqkA9Z9EFJJNHqObeAQ9W+VyukRMsOvLGoMjYtRKWtQmc91O6Uk3cHu8ETKWycX18DBwfq09T2xY3JaJ9xFxUQy9/752h3eV8sSuSjyMCgZ++fXMOQ9Wj6+5iqyCnNpQPnjvo7hjhX/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FsCbIJad; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FsCbIJad"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so33446755e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567141; x=1764171941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERGSngcgAQCpMTKH+vT5ZfmIUQiWuwubvJ1CKsgHOkU=;
        b=FsCbIJadiUYCr6ejMirqwdULle+dFIB303mznY92UxGov8aRpXM1+QZ0YZAJZUD4WL
         dEklnlMCpvxXLYdxfYsOMAAtdJ7Y89yogdYrFJamQiRz30daYx5LMFbN32HWiJubddSV
         yKSmzvQbxm0kZ9/kKiXGX8ElkghkgmgldHj7ofdE/8tU2HEt33UbAYAY1F3di2i4/P0U
         23nzNwXa9vf8tpAXj4yyp7i95O+QXZpgrtz3n/IVl1PCKWqIBOzKJ876OYZYt+aiyuMe
         u+98CAqWIInRKYI88txn1aq/8lAHBVFah13SAXvoapuq9p6LywhU7eCXy7B7xaClvy7C
         x/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567141; x=1764171941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERGSngcgAQCpMTKH+vT5ZfmIUQiWuwubvJ1CKsgHOkU=;
        b=qNkuEJfsprrlL78cNK45vRp5dUUeFLKGtFbkZz5EBaUS6StVF+g0Dkix5Wi/yhhaEr
         XHU1gtWjEgybvu9g9VVw0bVsLOEm/mi9rbQXMcxYA6HOUGDI1B7s3+p4QFOIQbjUvBfn
         fqgre5t6KE9IjpYAcw2pqv2kDvj0dQYOoAgvtR5FAkpSDTj0skFjM2bYXS0ybpybmPRm
         GGpo8mZwliB1j7XfJ16TlFRMMLZ/jFSzSjN2pporUlHe1vs++mFMPU+TKKx6YA7DowAn
         K5bk3kn2/8mZnxssDUKNpZsgumJCspKeG1L61vWXwGZcDddiw3oYKZlNFNGpIMvUxaJw
         rjOg==
X-Forwarded-Encrypted: i=1; AJvYcCW+gGz9Tv+l4wB4PgUlN9lMtpehGxq4QsN6fF3/sccPyPP1aw1IXQaM44aTQB3B8slu387CNgseBff6RtD/+688@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6QLFCeefdS2C4J6SPANOIqQgzN4LUjBl20/vjGUpCyO9xM83e
	YSKYD1rjPPLHRsswgbqA3ANAzgDSRsV8XFtwmp5qlDttM25opm7NJueJn8OIEBSYurQ=
X-Gm-Gg: ASbGncsZYwNh2ECWA5gpHY0Sv2MYihdHBm3QL3uhTaf42s2rgMCO8lONQCN3J+iyHPx
	ASwXCSDueZQ8QfpINbnLazMu5g4GNJ43lZrgXpM0QRtbviV6rH99OSrlX9jIHFWT7rdMJ77lERa
	7Md2nOhyBYS0dcX/ypBwAuf0tPTamcgWo+awGRr8SmNUfyNvV7rZVseQeuYRYkyNoTN2JRDzzAh
	Sh1pJifb0VEZ+CbL3tprR4vUUP5H+/w/zmH0eQ9xwIT8+ObaHmDdmYRC9sTdar9JXMPatd8pJjX
	5gZlWwqp0kLRk6hvZVSOLrb+5Jxo4ZdgebBVACUyjrJ27GfPvQIp1u6KrW+41AS3ULVZsWkGr7x
	Y9JjhTF++apLRleGyCT2QQVjO9WziF25btNPQdkvO7IbUuCTlEzvgsZGwoMowqCiFrNothnqg/Y
	UB59Lc0Kp0wwPtzCoBYbotAcetoMDMzA==
X-Google-Smtp-Source: AGHT+IGbRbXBdWPtS8s2pezZSC/ny/HyWuyG8gk1o+dQWRtSU7DtMYRlEtgHBlikDrn4myL+c90Kfw==
X-Received: by 2002:a05:6000:2410:b0:42b:3978:158e with SMTP id ffacd0b85a97d-42cb1f9e99amr2655929f8f.30.1763567141134;
        Wed, 19 Nov 2025 07:45:41 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:40 -0800 (PST)
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
Subject: [PATCH 14/26] panic: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:15 +0200
Message-ID: <20251119154427.1033475-15-eugen.hristev@linaro.org>
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
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 24cc3eec1805..e99539e18054 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -37,6 +37,7 @@
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
 #include <linux/sys_info.h>
+#include <linux/meminspect.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 
@@ -56,6 +57,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = IS_ENABLED(CONFIG_PANIC_ON_OOPS);
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+MEMINSPECT_SIMPLE_ENTRY(tainted_mask);
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -662,6 +664,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' ', true),
 };
 
+MEMINSPECT_SIMPLE_ENTRY(taint_flags);
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)
-- 
2.43.0

