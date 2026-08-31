Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B50D46E017
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190106; cv=none; b=Zp0xQbGBQTsWY8PULvT7JYTegteCaqxaZ9KCzsj34lx5LdqoZHMlxtHrtCHUKv2n3S6GD6mES17oukLNuILEW6c/Kxepy2/4qatGAIKriIz/7mDc7gj3DT+Ge7ko1QyXbbwNCQjepTnngJE1rIiGwOiS8qoxsbbi5ZC8Woo9Dv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190106; c=relaxed/simple;
	bh=UVaSnAntsnidTQyQIAWkdDSWDG/mfhc9FkANFMl71lU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dD9gf6MDIjfRS4Ak6sbEkHB9iVC+V3p0DFDqzCfpu972V6bxHc15u3lV77uJlE6fOUSIxjZGNuTHOsBYIdei2OstGPXBVa2uAXwk/TYqlm9+xrcCnyxK9FWJmZb1VerKSTdSeRy1ZzCvCSdJ9gXNZp2+i9DzPLwYAY+coQ5lOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv+VGBAV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv+VGBAV"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso1817246a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788190104; x=1788794904; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LzXEuTigiTiPkrsvsB4lTws1Gv1eiCRXL/HMjZW3pgA=;
        b=Dv+VGBAV+xNPvTURXvUpAquidUdVTNnjzTCKqfdp3UJJpd65cXNMzBLMld+TUnvsvl
         3M0/jI5cJ0vlK0OvYcMcdMIhufAk84ePXu3TYpWsJznaP8cEVyf/WClCnPigPZaM5Any
         0URwA8aZgD0LzdsRTDDZY16Za0XcuJ86s2Pcq6NjV417uBgzHnSy1OuSmZ9qa5uru/xc
         B/Q+vXyk63e1558Jw8yUDgBGShTXpJKa0bXGhJx1zzL2Thn+AVwkePtfltOxY7D/+/g2
         6p1j2xjRt/20Be9q2YeElAx8j5H0+HiUJ21ImopC0ZJA5WRP1EIF4cAyxhdL5XmR7JQm
         yvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190104; x=1788794904;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LzXEuTigiTiPkrsvsB4lTws1Gv1eiCRXL/HMjZW3pgA=;
        b=gKtZKpECHhJnYkovMhYHTD/bkHKTzJ9lka57o3zUI1ZVebkT1AlXOgXHg9c2KFkLkR
         qYQ5sI+NWedcoRlfBXQ8RwADn1Ij3XnbXn39a+QUmnRWY+oYGAtFL1it/5O44WCasKWV
         /a+u6rPpsTMSsUmVQ8CeyPPmvpu8LlvNRynkay5CeCF6Dq7xgAnYJW6SeSNchCumoTo9
         uLgPMtjDhYbG8vlIxYCKJRAN1ZK5wFrnN0sbmeQq4HP4sAqUgaZ/rnVa8lEqa9MbcZuA
         VSN1dCglEF19vFQzgkZzGNfikC+jteo65bTdA19kg5NgbAsZnh2MzpAoGom4yBU2022p
         rW/w==
X-Forwarded-Encrypted: i=1; AKwUvBwPUmRc47npzdP9vUeAC1iML2Xw4oo5GfzsD3x213XACOHC8Bj/N73cyqld/kG7+v5guKHMg69Yeiph4yv2l8TD@vger.kernel.org
X-Gm-Message-State: AFuF++mi1vZ/os+QkEQqZxj+JxXEHV7KntMH51eklSO2OJQpxJ6x/3Rs
	u2wAVpF9sze9M6YA8TkE2N3svC/Imfh3Q/7/+2Oi/kGmxxymmTH2gkPu
X-Gm-Gg: AYBFou2cVY1nI7ltwo/Ow5dBoClBqDtFZu9S4La9bQS9VtrQ2VgjOth5rxpP1PXOtvN
	VQmGEVxq1cWcQKurQuHG+wqhkF+Ah2FFhOI1SgBmsk1I5K/tFE+WZPV2r/jHaDMlJCu8xCIU3Nf
	Zij5BixNBgJ0epw+L8AkcHJGEAmxfv6rEblgAU81Qd6541K3tWTloGAUb+de88xNxzwU3liODBI
	7NXbzL6wop0yMY1iCB/+nKNw3O57LUmjCkdEvemHN/SVnSrq5iuLfebffgIRZAiJStCUuSDB02L
	PAaK6jygHcywTMYUP7dK+Vg0rxydhHKvWQu8becmZtmH46keFEmOqC2AUGv2abvCQ5t8NGABFao
	gKP0Y9OXdXf3LL5XrlUrir+FViv5bA6p9NN29n+EiFCV++AxKRGf30vQt112xU9pzhRIP9oRejY
	JLNV2OgWLXCIsDBkyYMa1PC9i4Q3S79MnF/DS4IVJguXs1Li0slDSKJBrVViw9MIOnIewWrN/p7
	8+GFAU7feNETR4qsrJTMtZVhU4vzQ==
X-Received: by 2002:a17:90b:2551:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-396d0fe384cmr47180926a91.9.1788190103615;
        Mon, 31 Aug 2026 08:28:23 -0700 (PDT)
Received: from urmom.urmom ([14.170.170.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf7ca7sm8891a91.4.2026.08.31.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:28:23 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
Date: Mon, 31 Aug 2026 22:28:08 +0700
Subject: [PATCH v2] remoteproc: qcom_wcnss: Fix error check after
 devm_ioremap_wc() switch
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CQAyE4VchPdMEligur0I8QB21HlbTqpAQ3
 p0Vj98k8y/kMIVTVyxk+KrrM2WEsiC5D+kG1ks2hSocq1NT8yTJndUZZnzVmdsQJdZAbA9C+fY
 y5HlP9ue//TM+IO9fh9Z1AzHfXE90AAAA
X-Change-ID: 20260831-wcnss-is-err-fix-729c91ee975c
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Lucas Sproule <lucas.sproule.42@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Commit f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region
mapping failure") switched back from devm_ioremap_resource_wc() to
devm_ioremap_wc(), but kept the IS_ERR() check that had been added to
match the resource variant.

devm_ioremap_wc() returns NULL on failure rather than an error pointer,
so IS_ERR() never fires and wcnss_alloc_memory_region() returns success
with wcnss->mem_region left NULL.  Probe completes, and every subsequent
firmware boot then fails with a bare -EINVAL from qcom_mdt_load_no_init(),
masking the real mapping failure.

Check for NULL instead, and return -ENOMEM to match the other remoteproc
drivers.

Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
Cc: stable@vger.kernel.org # v7.0+
Signed-off-by: Lucas Sproule <lucas.sproule.42@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Collect Konrad's Reviewed-by.
- Resend using b4; v1 was whitespace-damaged in transit.
---
 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..90747af237f7 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -542,9 +542,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
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

---
base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
change-id: 20260831-wcnss-is-err-fix-729c91ee975c

Best regards,
--  
Lucas Sproule <lucas.sproule.42@gmail.com>

