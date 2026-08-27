Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A635AC05
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815665; cv=none; b=b8rb+qzV0kTUmZqqMzNsI0zQXIPk813RZa9muhZvoBrRWfmeMC61nDI11r2uxpOQtVxK2bIQNHFk9pADqI9LIf7WCeJ5W3FDI7cmZUA6F1evE7pTjzMu9pVcYeYddQVuXH9pOvptCdU7VdTG8HAJUMXxg+MUmABWPdPANbngX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815665; c=relaxed/simple;
	bh=RW+2FLygnkT7VKSaO3nDahuHx/wOKYtQk2ensP7S75Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L6+aaqZnUNdhcR4RqBbG5tX+Go5Bks7M+YmF5JV5GzKZpBDJKSlHN/R3NKgpuiX7DdhM5iYw7ponbCvBodx2PkMERn0XQhLM7o6NJBBKIZ/TTZdVBnLgADTgTevFQsKrNu2/U4r3LxnHRQT16kVDcoMCdGWHI1xs/Zme8MwBo4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4KA730I; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4KA730I"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so9587875ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815663; x=1788420463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhgeScSczCiBwmHIIxWPTFb5OADckPp/7bxTknyDE6w=;
        b=H4KA730IG6fHs1R2p4nUSj+Hpok6dD6Zd8Ij3DbHqbsvjqCXkquc4CLaaGRtSA5tYb
         ddcYs9ZEaJ4h7TQ1C9iQq+/yn+XlLgKIGX/Ia2ZAF6/45jsFTj5f4kL5Z8EEX5x0q1Hf
         fYqyu7ipVheyDM9e1sAODuAAdIZeB9a58kVlGgeah9GiJs851R4c1tNylJb8ZaFWWgdd
         GQIzG0bUYapTzerdza2VUEH5t5Qum5s6PE9SqXITOkObM60r9S2i9UNMgW1MuNfJGDXv
         9u0BDbZ7dn2oLGDJTCiM/ZrrzQdJfH7eE58kKhxqosk0nBCZU8n1+j4q+IuuOfZ6RT6u
         NVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815663; x=1788420463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhgeScSczCiBwmHIIxWPTFb5OADckPp/7bxTknyDE6w=;
        b=mMAofCAgrWyiST6htGaDrODeerh/1TkJn5w3qR8kPTcL2MV4R3xmDchKiUGIsjNmOf
         xgpjrZMlp3HH/X2dma02IT+lmc7eMgORqWOxWcYEoa1/3w+wH1GwBCKhMemLxiNZVKDF
         +XIb9fEkP4fzQG7kjK3DgeIWKgpi0Rww2oihULKLCTRLsTe7A6GbRkxMgktYTdz9yx52
         6ETsq5i58al4b8hIhtmXP19/Sn8Ml55yz/lQrtSvBf/qEz/Hr+wq+cjzB+xZ7c/0cYmh
         TfANaaenJSVkBL6KgQxkDFgMXgsrsQeWY9gTYDj2Wpg/DMbvO9TqLrTQoX2XnlLaCRRg
         HUkw==
X-Forwarded-Encrypted: i=1; AHgh+RoXqLBWdmlwfXBf0GKraT7uso9rH1isaFlR+qIou2s0kWVu7w6cGTyptryJNizPGDi4AHCsdLp4Dr6HN/VNGQwo@vger.kernel.org
X-Gm-Message-State: AFuF++lxIPoRYvDf0zMbYVDQrSzNwuTiXv2be2E47OFka4QX4tLxVXHJ
	638PMC1+AY8jx+SftQAltLc24v4+HOCrQ1Ypc3PFUJ8FYzUyfW/PWgNR1NzvhtaekWBiJzqJ
X-Gm-Gg: AR+sD10V9OBI1OzXTLfxsfcCEMTMfv5bLh7SX6e+pRebY8B2KIl8hI1LR3brXQCDuEh
	PMCZ3a+08CdeUMwdeQVs/49IvHS3F5/lwIOnOWOLPcDRr2KqJsvzRX2530k8vj2P3QsRKDQYo8Y
	CDWMcJrmvD6ThoFvEtXCVS24RGaqNAKiikeguDojczSGb7/GS4e9sd9Gs7gVba3F/IF6kKmVaLE
	86XAdsNr0GMRN50K0HgBLN7gNFYDH/ecyAlINwDXfi1oG2ygYl5ergfUuGGEVNcomRpg8Rps6kX
	3K5PPon9tXxpcACA7CTNobmxoihQ2MK6NVdL2jaH400QwVtQyXrC/u9Sf157BpSs5EzZZJQTaGW
	ytRf0b5bN+SteQEMcHhHs5b98qDBZjw8RuZNEeTjIOhUYdwQ7BtQdKtFIB46jI4BdGjcwZBFj3Q
	EajtC17jVSyHt+fqrjUv/q786p+XfzY668bP+GqntxFS/Mkh4BuD4sEzYgIHgL9YSGDjqmdLQV6
	QrzK5vrAkNQRAPQMDv9ki6lvZXestjlb+lq6A==
X-Received: by 2002:a17:90b:4c8e:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3966d44daf1mr21255453a91.14.1787815663140;
        Thu, 27 Aug 2026 00:27:43 -0700 (PDT)
Received: from urmom.192.168.1.1 ([14.170.170.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396705f6106sm1791052a91.0.2026.08.27.00.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:27:42 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss: Fix error check after devm_ioremap_wc() switch
Date: Thu, 27 Aug 2026 14:27:33 +0700
Message-ID: <20260827072735.2262888-1-lucas.sproule.42@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
- if (IS_ERR(wcnss->mem_region)) {
+ if (!wcnss->mem_region) {
    dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-   return PTR_ERR(wcnss->mem_region);
+   return -ENOMEM;
  }
 
  return 0;
-- 
2.53.0

