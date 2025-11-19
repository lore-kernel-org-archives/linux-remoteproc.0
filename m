Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AC82EB859
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567138; cv=none; b=NI9TGjnUsLgKqLdo9JIQvCbVHV23TxA0Nn2f0zM7CB4bxOuFmCch1dgK6nbTVGK5yfVPzOwLkRuVRv4uhq2ZdNxX984Is6ugjfijMnnicDnM1aod8ZD08Wow1Nj8SCV5JaFSdl1A6I21R3PWdOmdxjnYpX17/Luos/pBZn195XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567138; c=relaxed/simple;
	bh=E0xWWAAtZ+sb1tFoy69j+X8UfYdpBq6LQ0ZttxzoUlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLhdXTNqrTJ0ugEQpO0zKSSog8Juf3sRltMscp1oxzDbA4cFwtWErc+i7wYYWHyMA3gXNViGBVsu+1rPIn71BE0VbAh66qJlDNEaUdnyW1lz9sZrZKLI01phZ8SRfhBwNs+3jGJnUcwcOLbDcN77cHWxCqVD7W5msaPu5hQiMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFLOD1dQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFLOD1dQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47755de027eso46924725e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567131; x=1764171931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93DS/ScHi6FgD35ajGLpv/dHTyNaaklJOjylE6wX7jU=;
        b=bFLOD1dQC0Q4Eym89MV7724Zm5/qYdVd2/MyrMm0XvxbrzU2lDJ7f3Hv1VBREo0swI
         VNOqEN4cIlEgl+4RG3ftwarzTx6ULTRfRqQECW4NCGOea5bakUcUwadftn+o9l5qcuQr
         GqOhGsYig2eyjmviFGaWge0Ow+AucMs/GddQ7Kvm24vYmAkB9N2JvTJG65NJ/KsZPbV2
         WLjgsvnPwFwpu+sLHn5AI3lW/12WVyHGZzzBopJ60S7mOvi8gmM7wjOlCW9IqzOHKDLp
         paCwK/zQhMrhsuME+ta7z/kdBso55S8pQQVjvaunWcA3poAn3wdp0V295gegBTryfFZD
         wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567131; x=1764171931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93DS/ScHi6FgD35ajGLpv/dHTyNaaklJOjylE6wX7jU=;
        b=T66hvCdvuCNEyfQa4uOvtSSeMInomgnlNbkXnANOenWrC8uTEdkYkddN+r1ZNAudfn
         bLZEzEcJnreO/IFasy/cDA0jMrb51tmT/kPdwGE70c8tgywxgQswI3A2pIcxPxwN/Jaq
         iCKpAgcYRq6I1myUb7rM3eJr8YmRwRL/PU9rCiHeNbWXS8W/z9bxOB15HGbcsWKT6hDq
         +FWoPIqds4HubFjEwt7YnC/ru4V5hdzYcB/fsz5dSDiV9CIA9Rr4/bK1F/KSmJEwPXzQ
         VpdCUEvA7+NeA+ffOKwx222ySR9euIJFrwNWROwDjBmkrF5ZAwWwC1w+1FJreD/IwwmR
         jlwg==
X-Forwarded-Encrypted: i=1; AJvYcCUG9PUmdKQtAU4PmVtMhWmHz+j/4Gpp5fqWQEejECIXI3XmpVJAA3o5AQW8J7nYzceDXXQ/AhsjPbUNCHbf7mgu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxppf08qyy3YdV2/GyiGEDkdEZlhaTCCOBTEGE2gx0XHh/QqY+w
	a8sxDmGas0LhHmhIAM6ofQDlwSBuVaNyK6Q+4vh5rU4Mt2rLwt/O+qbPHcdTN/SD53A=
X-Gm-Gg: ASbGncsyshCNTZZk2WIeeB9aFuJVVT05cq8LBjZTL0s4nugcqk8Rw8GkGgo4oNTvXQz
	jucfAPyoHpZrbZ04Br21bTWT9pfhlhTRjGueogsfOoZa+aMiNQaM/fBNWWxJfS8ioxDblg7t2CI
	w3971GodOicNZVt9H3IoRDxnklIAZ0Ly7lDz9uGeZjIVnIZDN2HwFhqqtOFE0QlB4oyKfTMKF7q
	fYoEJxdXxR1BmU/rxUoJBeu1Aa4di2KspiZCm5fBhOBGoRvujDHQ4T72NGEMrTnTkJJgb3cuKID
	Nf9D/05DVn0Jh1ueNLCLYVWQbnp7ZcGM0vI1tz2gKtpmiJBn96fyjRX1nsIsMAo8VGCZEsshJeQ
	S2ahCxV5rl3ypTGChcJjEx2FfNBK2tVcPL7Q2ugKx/dAp9dWgLI1Z4MFVOr46p17xQmKaX0HU59
	UA/YlS64Au2vXB66hFNgCJniEkDCUCvMe3OO+erSnL
X-Google-Smtp-Source: AGHT+IFTd+L8MIsFVmd5+4R/tV4nej4oyMMzTvyobs7oRMR9eeDnvkZRxA29k7Ua9rj2plkllb3d8g==
X-Received: by 2002:a05:600c:c48f:b0:477:7b16:5f80 with SMTP id 5b1f17b1804b1-4778fe49c0bmr204044185e9.10.1763567130586;
        Wed, 19 Nov 2025 07:45:30 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:30 -0800 (PST)
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
Subject: [PATCH 08/26] mm/page_alloc: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:09 +0200
Message-ID: <20251119154427.1033475-9-eugen.hristev@linaro.org>
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
 - node_states

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 600d9e981c23..323521489907 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -55,6 +55,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/meminspect.h>
 #include <asm/div64.h>
 #include "internal.h"
 #include "shuffle.h"
@@ -207,6 +208,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+MEMINSPECT_SIMPLE_ENTRY(node_states);
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 
-- 
2.43.0

