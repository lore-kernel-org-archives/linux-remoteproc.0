Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E115032C927
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567130; cv=none; b=mIN4pJWWl4gbWO9I1wKHAkKFCNaJDG+HYG0XvDiGENg7AGjyB7jwfohIAhyXki6PrtSnPHzMel298zcyhyNoslEDwcoL3/vc+/XXeriSTZJoNpYl1vfcA3hj1bd2VCEyYonEdK3BB9HwYksYbBlXtC8RQuAmaNLc7i/J8wkuR38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567130; c=relaxed/simple;
	bh=uHw2K4abduiDzGpZ4eX0j1eSGliuYPoG3xQUhEMZuY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MT2bIQJ1TxFMzIQovirxvaamuNKqt01EaMWIkN+s5/UGF1c0DA7g+6nSWrAfCZZWhmRxxfhdOOmm4DMY7BAEOULbVXrbRvY+tDMcPfVMQ+GRPeVQkyk8iG5RSdRe8udo46eows7VG3fhEWwf3tyZn06QoRXUu01DRRdNsKMrmdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POzM0FwJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POzM0FwJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so4789357f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567125; x=1764171925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3irtgR9V6ILkzi6aCmzqNOzM4wzsrVUTWgR/+hcFNWM=;
        b=POzM0FwJqd/SdL87jP2GMAUIGjXey4fOCpL7ccvdQFlLBGoh6TpPgeAOPAXKPy3rC6
         2f3BvlcDX4lGoOR84lem+RbdtLt8RPGa2tbgMBuPxaKNO9opaYqdf80cop3Q/VowQgGH
         YYkotKtpK0JABL5JcU1bH7o5RsJIPKV6mp4ED0W7ecl9GKcdZ79YCxbL0muGEPLcKqMz
         V6THVAxGDvUJThgal+ibL1TYjlGAVALilt5bF29kE3NJAqCBjI75PkcU1CeyuwyN4uq4
         O4kcmlKLnYIOJl89JsWU9g848fXyvYpsKSEPvVHwlzHnJpQY5MTIgruFA6oe0bBx7Hqs
         kNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567125; x=1764171925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3irtgR9V6ILkzi6aCmzqNOzM4wzsrVUTWgR/+hcFNWM=;
        b=gMQAMatP94xbAgGzvcl59Zdu2OzYxIGxxbUD6DESlZ/Ep8ljBoVlvHFyxRY2XhzeGw
         IeQKMsYKFaoHSMpjKyV+6JCAsOHUIVopD3Lpjl6CuoWC2z12K76ZW4+esTe9pIFcUecr
         6g39x35mCASKPBk3faTDJfynRMCZ0moJsocU9/Q9ZDJ9LCMFJCDs3Tfo2aQ5R7J4RJl0
         OH/7PkcDw0UJvMWItdx8GVuKI0fB7PnBixS/K1cCtNisQRT4pFM7dXGUb8QEDQ84nfa7
         aMv6tZuQet6yJgyWVjTbjuKTbkJQ6WB9g142cGkUk08b4nVz6BWpw4oGmjg/q29T6MjU
         1Jpg==
X-Forwarded-Encrypted: i=1; AJvYcCXNpw0+NzGJ+mF123EOF0tUVjuX4GcGtpS6GQgeVB3T5x45YqTmCsAASeu/P4YbAChFt7u1p9w8FWxFdhb2wQgG@vger.kernel.org
X-Gm-Message-State: AOJu0YzET/l99sDMkVaDFvNBuJcThLvQxOYKu3WdKHdnqhUw3RIx6Q07
	4f7Byv8cp8pLOo1lBCohZiJ9rjLG6ueGduojmLBScSoiySMS91Zkj2A3lCIPJrZhweo=
X-Gm-Gg: ASbGnctpDvbSY+BoFeGioIGrth1Et9uSpktnRwwpHgFALjbMjMwBhOzRH42t+JvFnUE
	FTI3YZTo5SlNM15CfgTH8rkJmkjKRbe+fiffcD8cwvE9EatzcXGcAsdp9Ci/TRdly1Ib0wsX3TN
	zA8bChMTUtgtYcVQsgD3tZI36P3UWgafhUayJMRnsroj7KSjsaxl8RRRPMLKTUg1hQGUZzc6QZW
	EosiOa8bex47PgyoYQtUILwiii36qxJvAmfs7DmJ8nolTFSob+CblDkcV6aGtUd1d1R8Pjgdb8U
	g/QqZu7CklrKhduh4zLeSmNJqv3+Id9HwOp5ZRqE6dEMuDGbshO4ipgBXd3E1q3MCxfHE+SSDAS
	s0ewOektyJH9KuMfQzV0pXyH/vKwK9EvWAgHiVe2/RzIGhnT2mC0MWa72FJqJ3L1Zs59OPm4Qc3
	SUFVgFJPJ3QJyfSCSC1Ntyu8sAEFjFYg==
X-Google-Smtp-Source: AGHT+IH7OiMHuWdKqmUscjGj0hpAhy0+8U72IgAGXn7ATooehRTT7HxTJk0qp9VlE6dzqjBsHdcltA==
X-Received: by 2002:a05:6000:2901:b0:42b:3e60:18cd with SMTP id ffacd0b85a97d-42b5933dfdemr19022522f8f.11.1763567125510;
        Wed, 19 Nov 2025 07:45:25 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:25 -0800 (PST)
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
Subject: [PATCH 05/26] genirq/irqdesc: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:06 +0200
Message-ID: <20251119154427.1033475-6-eugen.hristev@linaro.org>
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
 - nr_irqs

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index db714d3014b5..89538324a95a 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
 #include <linux/string_choices.h>
+#include <linux/meminspect.h>
 
 #include "internals.h"
 
@@ -140,6 +141,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 static unsigned int nr_irqs = NR_IRQS;
+MEMINSPECT_SIMPLE_ENTRY(nr_irqs);
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0

