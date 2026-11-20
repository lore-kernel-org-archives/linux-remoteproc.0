Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202454;
	b=IFNaBI2SJsqOe+WD7V2i2lgovBNWYJjIQ0MkqS2htjlNdoR4gWvCzTqbDNAljf1sGhiU
	 zK9ICDv9z/naWPE4LM4QnnY+NIH5igmukEhX/+nvGFbE1q35wml89M5KViGC2axqu7e7C
	 iBoD2eiSCSvZCtUJ0pozkre2TKCcZp1yy0NX2v/E99gm7S0DHSwynwyHUWfP6GzCGuDAd
	 KlOHYyPnUmhcSgZnroT6E0JO5tm/ZOaB6CcFvWCQ3F2u9gznM413CQAs0+KeGQzPuEMgV
	 PxPhc/v8EAdOwykm9xPVMeD++nK/PBrWLcbK9nPmrxChoS/CXFumyxlYumADr1reIPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
	b=dcoy1CUUicsfJbBMcs2+yTSzO9n3aZ18yo0FlXHEJvMpnowBDKDYtSdsuDLOoaBpq0N/
	 95JdR6dRa0bDn3Wl6aplGzRIE0+nUbVbzlb3MYf0SV0LyAij6Ht1VD54XC/nDxflDg6lg
	 j+pZ1GplSXGh8lNFNzZTL4nBa7ibHSa4fQIRbP6vnUoz1DfDy85MvFk0i7wf5WZL65up/
	 xyHDTvOVsEkecsKbXlCwkI5AHdu7sPWnnDW+8ydN9+B/TCHRPE4yFVmJ6tr+LN2qA+0Dy
	 ADQd7Vm01M1/nTu25pDjPDNflapy6ba3TFSSHazPilQOIB+hT9UFbaVl9/E+lfw9ykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="PNy/163a";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A316606A6E5
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 19:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A316606A6E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PNy/163a
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so1198168c88.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 11:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202450; x=1795807250; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
        b=PNy/163a2x9s3/pEbAqCm7CJck1+HdSY0I7HZUvlgOri0fLeEge0Y4GcA2rtgjhdF5
         g0HvR6bOrMu2uL6AJ/vM9D9IGQgS+6bbgYDwoEAzWyUOsnyDgmw/NKredxhQ/i6/lvOE
         lOOl/19rSLFVDfE9pJp1Sm6FhnqyXLV55l0Ok2pxoRz/B1QHr+I6IIN9dsW7JNOHLL7Z
         ki3wmDQQLHjL89Trta2nksg0+Mp8eWXvT98YZaRBRnaiuH4F5LziGDFpr2SX1MTaDlYa
         ua8kOqFv92Gl0PlBWJzHxaRKr/CyNVsDeAGtHyOIGozHTqdoM456tCeKozeY33RVARLe
         2ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202450; x=1795807250;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
        b=PhVkw4jXIanfwa2u9hijocwhMFRDeacoymcFb67k8PnhUuWgPRabjVHjMawnfXb+S5
         gvl1Am5ETh/t/c2htmdIHmbWsM0LPLYcTMVpZ6VdmIPhB4hUawo2fW72jUevm7LLo+Iu
         R46/CobQC1K7NdqRZXeoxWJ6O9viAvM826JWcbIZkG6xJoH40+eSCDjJnmxGNASz19jR
         PWDYAMTcH3YeOSf1lJbXQv60FbnHIy2ulT6GZ1eM49Kzpy5p6j4Te7UvSRyT/rRa4HhW
         YkuaUROnyHtHBNpPE5EhStzoLsy4RD4kJpvwUCT5RkXV9L+dCP6sVBJXmadr9HzlKphD
         p5DQ==
X-Forwarded-Encrypted: i=1; AL+hErEykn1Ip+D8P3WsXjosztAXFYU+gUiOncifcKl32RcTLO7krd+uj6cU8oatECLoHLq8Wv0svslZ47U8sE1ZrfXu@vger.kernel.org
X-Gm-Message-State: APuU4Z9xVepAf0cs8enlWuo2CYjeL+e61ecmeyZuVT3eqpDAbGPgU01O
	YGDIg17tPJFmTmGouVHMCLZHe+3iqmPMCUK1Ho6D1acc2RBni5bB1tSXyZdvbjPYh/beUsVnC33
	dOQ==
X-Received: from dldz14-n1.prod.google.com ([2002:a05:701b:418e:10b0:1a1:ce17:436b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:8457:20b0:1b2:42e3:e5f0
 with SMTP id a92af1059eb24-1b55689edb4mr3489816c88.12.1795202450046; Fri, 20
 Nov 2026 11:20:50 -0800 (PST)
Date: Fri, 20 Nov 2026 19:20:31 +0000
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192031.2868216-1-elkin@google.com>
Subject: [PATCH] remoteproc: qcom_wcnss: fix NULL check on devm_ioremap_wc()
From: Elkin Cruz <elkin@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

devm_ioremap_wc() returns NULL on mapping failure rather than an
ERR_PTR(). Checking IS_ERR(wcnss->mem_region) lets NULL slip through as
success and would return 0 via PTR_ERR(NULL) even if triggered.

Check !wcnss->mem_region and return -ENOMEM on failure.

Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..abe0ab320d03 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -541,9 +541,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 	wcnss->mem_phys = wcnss->mem_reloc = res.start;
 	wcnss->mem_size = resource_size(&res);
 	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
-	if (IS_ERR(wcnss->mem_region)) {
+	if (!wcnss->mem_region) {
 		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(wcnss->mem_region);
+		return -ENOMEM;
 	}
 
 	return 0;
-- 
2.56.1.750.gf70dc682cf-goog

