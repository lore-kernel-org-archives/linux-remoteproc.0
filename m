Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9C32F744
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567155; cv=none; b=G4PnWOyhv/QvH2SrWvJG7YS+7YrG0qeQgWg/KuduYOFuoiUEL702ChyDHDedYPM3HlTmfcca1/c+0DdixCH8WDnPxlK3BbUPurs5dRA3oQwJVV80ANjK/keOw5kPBBbBd3cr1M/7uf0V+78uGEZ88EzdczrkNJswdhPqmQqdE4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567155; c=relaxed/simple;
	bh=puCNsUx1cqEsVIIsTQXC2Zu04afcvVugn2nqwtYBNCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uskhqrlIlBrtnNRO84H8J7VWHn1p2dMFwshhAh0SwOBxRZ7TPft8SQZ8nEQXREO//u9MPPLicTnIaQ2kWQ9uZNnJnkFWbtwa3uK/JbzNxfod768PfwCsE+qY7yLeXATj3rknpkdvqUWWVlLN4MpJifKUiWIeEWMCLLl22Ria4eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2cvfbXn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2cvfbXn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3747825f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567146; x=1764171946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=u2cvfbXnHZX8S86mhbmVlDKoHQ2qZIBOHUToZr3q51jGLlJFmHxxQcU/fm1uw3dr/L
         ryR8SU3D5iO0H6+339AdAvKpGNAn1CK6/oOlstGHI4cd4xG6+/w44Ge5Or0ybjFmHaS3
         TmyiHTUji9gaHk7uex4IBqSQYtfvzqDF4k1l4LfR1824PbZuKmIt9zwUJc4RzpmuIicf
         FnV8EwOu8LdVRf/aAcAWgL+Gv4kc4rnhvuoRDiBZpPwDdKCtUw0xPkaSpKH5yXwWXj/t
         JHK8eUL5sBMFkiK5dz64vZJDZsK1hF9kybnlSUvlmbITELWgyWL8yGyyhYzSYh/yxDZ1
         XWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567146; x=1764171946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=wGacRanIol4IlX//b2K2c1bFVLvKhepkzS0NdzX50EQQNt2BVaRobex/y9xFpenFJ+
         FI45WrY47S6aNE5DUFgfCWsX93DGnYmXVuGe3IlG41veMBszKjNOBwfnL/lpNx5CyLyD
         HIaZTlyc1oSUSA3ll6vJw0gnWfQF06e1Vpv/lS4vMK3QscGlrBmdT/IufAyPOE8shKLC
         mkLOH/7Vl6P8PLkzFdrTcKSjSW5rbC2ef90wpcITYTzqvZueTYp3EhXvmogsoHkg5WX1
         Q/Cy26okZSQ/kSpnDAk+r6GmPH7P1+O8ckPLgrhPWYdFsm1Vhjsr0XOSTrNzVLsp2B7y
         SzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/mGCyH2QfIOX9UBAESpaFMQe1nGp0n+W3Opc24ir7uat+MHFls5csEmxMxRwwXahOzrMe2iGQPuR929ohXXLd@vger.kernel.org
X-Gm-Message-State: AOJu0YwByZzjnHMriedFrzFwndWO19IqFTWd33UyeJeP8gwIcsiOy/dx
	WbNPtxNEe7pwXWcoZRcuehCMJaQKzQZm5tQYVuy7SLIgyXFUQcSPKlUDIbmGghvZTc8=
X-Gm-Gg: ASbGncudcUz4rB3Y22Qw62ZMZKIJdME4tQtsfO4OfwI620AEPiYjPsoW/pDyS29d8eP
	3djhEZJybi35URMBnogEt+q6eN0jSFwR0gMxG2bu73pDaMujJSSqe3JQkLOSf1n15RUHBduHsDU
	Mh43StX39tRwJFrRYADsliXSM2uyADiOmjbCq/FKtnF7ImESYnr/qGPLgZguan64o+wC5NNdPfd
	F+HprYKiTe9uE/qqUp14RpkM3NmsAXQATHlcU4GxCYq3awu6otLmGRqJ9Dfa+wEMQxSS4CcL44w
	T++grspy32a3Df0Xpq53JPJLAmi6yM5BYJLLaMrqwCAspYdKckLO9LqeMv8xHnk22VlPoucdOH6
	CV0Yz1XSVLjqapvjQh9ww64wfyW152kWvdKcsTXfMmmcTFk9pFO0SmvLqXpt7JHeoJFG/mm5jOm
	l9YH+9JcRDGhmGwapDCx0=
X-Google-Smtp-Source: AGHT+IHSn97ivXqqEi+3+TEBhok4L0zKY5jBJq8AwBEmyjMgjDaigOLXet9t8Pqm4XTXHvlHGh5HZw==
X-Received: by 2002:a05:6000:2891:b0:42b:39d0:638d with SMTP id ffacd0b85a97d-42cb1f9e35bmr3506384f8f.28.1763567146421;
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
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
Subject: [PATCH 17/26] sched/core: Annotate runqueues into meminspect
Date: Wed, 19 Nov 2025 17:44:18 +0200
Message-ID: <20251119154427.1033475-18-eugen.hristev@linaro.org>
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

Annotate runqueues into meminspect. Even if these are static, they
are defined percpu, and a later init call will instantiate them for each
cpu. Hence, we cannot annotate them in the usual way, but rather have
to call meminspect API at init time.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f1ebf67b48e2..a68367daddb4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -69,6 +69,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -8792,6 +8793,7 @@ void __init sched_init(void)
 		rq->core_cookie = 0UL;
 #endif
 		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
+		meminspect_lock_register_va(rq, sizeof(*rq));
 	}
 
 	set_load_weight(&init_task, false);
-- 
2.43.0

