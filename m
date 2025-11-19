Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869213A1D0F
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567163; cv=none; b=DNeMuudKaJ2GBgZ4VJr6tULjuVE2TWNpxi2nX1WsYAERF7G0GbLMXwIlr8Wa00eDfhOMsV8tll1cWSf+xwDmgSMS4Kg5B2Ff0/hUGjt2TQrd9MfvzECFgkqHp5fg+RYM5FJ3sCtTTFda4B0fvfN3VF6iyWNt770DVT+LAebaGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567163; c=relaxed/simple;
	bh=seLIx9q9vL0GJtrOwhh44Y8oeZ01I2U3Qbuzz6J6f2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVVTkZRv+g9oUDgFzCK8859gO9kuu3a3FqVp2ygHugMGxHZ0OimmrL2d0nKi6ofjeKQPaYzOT3SEFdi2oH16e8bWYojGl37U4VulHiguv021xr1MTXEuXgdUVRwk+1uzsIJTMsl/BX8pYnM2LbbfPaPWz41BDL854aY+x2vLQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlsKOf7C; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlsKOf7C"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3747891f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567153; x=1764171953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7Ucs3kp0oXjJAHNPlew8LSoAGCaHnYy/9pb2BVOQfw=;
        b=OlsKOf7CJM2UCkg8sSzf3D6dnC50mCYotNLiG83mI1qis2cSNEl6iYyMVoNUiPWFtn
         q+XeohqZ2L4g2rfVHlxX/Z74xnezMqq6Q2RDI7kKiJAAVdhgk1bmjDpTEad7w+oD+d5r
         XhwrehKHLA8zA/6PTLm1D8myUX20MDo61BthVNchOC3ajJi+FtetAbFElpDNH0txiQfl
         YkpKzG5UU3whCwYwxvP6bNGvK5NjG96/oE4wLDMc20Z9xA4rAsIdLgPvh/YVk9Ey+l4D
         ICFEIP6vLzLnMBBLHX1AFbnh29b1KM9hSgdIu/yPFwLWWVFyENhMFbVyN3hTLNk7gE9T
         2itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567153; x=1764171953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y7Ucs3kp0oXjJAHNPlew8LSoAGCaHnYy/9pb2BVOQfw=;
        b=matAlvOsm0AK3smAHzlXSGgdEiHZzsi5A3zGLnB8m2Etj5VKJ1b5zCdVf3+oKZ7osi
         4tlqeZrq7KhvrkTXB29FymLcaKvQ+wTFIlT17d6gVEjZfmB871oPwXh0hJ/gk5xPow25
         Pkc0hVxU15fnna3wYNk7CXG9EE7sesH5a0cQk9i1UFq4dB/sIk3FZdiS2g1I3xVASPj2
         K459mqj151Jk/eMqntFIvkLhZftvEpY5xq4kJxrSxvzBTSrtHoG++BlZPR05espcIU5q
         XYGj7qsjVIFW6GLyvhtdqeVKFnlHahFLk7/AvsXCXnZuTStnf8yTeArHnXbY6jot8KhQ
         s4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVojJYl2ayD64/wJ0AvAP91iYNpIBYACGGgOGIKcXByReTd2XEJtwCslXB9LfCmvm5ToCfLvsMHKjVA+omtN3PG@vger.kernel.org
X-Gm-Message-State: AOJu0YwrciyvVBYZGzEi6UtN6YctOwwmgaS6Qv0KIr5c3TCAyv8EnrBt
	B/TA+2k3JQf0y2pG6W3fejcQNtetccA4xk37dtMfr5xdzV5nWAVcqnLUxqDJXbd404o=
X-Gm-Gg: ASbGncutg92dIO+TUJLq/8aWt/TsOl+7VfRCSiUs4Z7uoo5zRdAxiOjE6w55HmW+GXo
	7eRpn0KR+YTTyGp5QiKz80cqRf3HMTqqdLU/xnz0USHeKEfVoas3XJKCAsDM9obGSjrXAFAmT7I
	tcycWRvrdVPBVfoBwePFKPcCvYruX5oaS7xYWwymS6Gh+CiGAkW0U0G4l6S8/ujrJbKpHllXrq+
	EsDP25UBrLgvahDq90e1DRBgv0EOh7oEbdhpItmLbMcCVpBNLvCoGbjF2X7TTukIeNhIT9aLyu6
	PFYVjaq55e+UxGhMQizdD06AkMmmkuEzB5JyXCJI+Ty7ZskssUKvlghSIvGri2POLD41i2lyTNM
	MblJ00XOxxn48hGbwM0kOKI7W8zlGgvEokNiRt6scU5TXyh3FhgIMYE3RnItJkbm2rWDN29XxTE
	B4oMNUzNgRj8UUf/EzDSlN4gnyz4S29w==
X-Google-Smtp-Source: AGHT+IFMxVwxw3DtlUhFwveVzixkh9p9iHWd+faYE31GhqiINsGSMiGzAK7z2FWSCj0eS8F6/aaKoQ==
X-Received: by 2002:a05:6000:2510:b0:42b:3e20:f1b4 with SMTP id ffacd0b85a97d-42cb1f1de66mr3206403f8f.5.1763567153508;
        Wed, 19 Nov 2025 07:45:53 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:53 -0800 (PST)
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
Subject: [PATCH 21/26] printk: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:22 +0200
Message-ID: <20251119154427.1033475-22-eugen.hristev@linaro.org>
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
 - prb_descs
 - prb_infos
 - prb
 - prb_data
 - printk_rb_static
 - printk_rb_dynamic

Information on these variables is stored into inspection table.

Register dynamic information into meminspect:
 - new_descs
 - new_infos
 - new_log_buf
This information is being allocated as a memblock, so call
memblock_mark_inspect to mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5aee9ffb16b9..8b5aba2527ac 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -513,10 +514,16 @@ static u32 log_buf_len = __LOG_BUF_LEN;
 #endif
 _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
 		 PRB_AVGBITS, &__log_buf[0]);
+MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
+MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
+MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
 
 static struct printk_ringbuffer printk_rb_dynamic;
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
 
 struct printk_ringbuffer *prb = &printk_rb_static;
+MEMINSPECT_SIMPLE_ENTRY(prb);
 
 /*
  * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
@@ -1190,6 +1197,7 @@ void __init setup_log_buf(int early)
 		       new_log_buf_len);
 		goto out;
 	}
+	memblock_mark_inspect(virt_to_phys(new_log_buf), new_log_buf_len);
 
 	new_descs_size = new_descs_count * sizeof(struct prb_desc);
 	new_descs = memblock_alloc(new_descs_size, LOG_ALIGN);
@@ -1198,6 +1206,7 @@ void __init setup_log_buf(int early)
 		       new_descs_size);
 		goto err_free_log_buf;
 	}
+	memblock_mark_inspect(virt_to_phys(new_descs), new_descs_size);
 
 	new_infos_size = new_descs_count * sizeof(struct printk_info);
 	new_infos = memblock_alloc(new_infos_size, LOG_ALIGN);
@@ -1206,6 +1215,7 @@ void __init setup_log_buf(int early)
 		       new_infos_size);
 		goto err_free_descs;
 	}
+	memblock_mark_inspect(virt_to_phys(new_infos), new_infos_size);
 
 	prb_rec_init_rd(&r, &info, &setup_text_buf[0], sizeof(setup_text_buf));
 
@@ -1258,8 +1268,10 @@ void __init setup_log_buf(int early)
 
 err_free_descs:
 	memblock_free(new_descs, new_descs_size);
+	memblock_clear_inspect(virt_to_phys(new_descs), new_descs_size);
 err_free_log_buf:
 	memblock_free(new_log_buf, new_log_buf_len);
+	memblock_clear_inspect(virt_to_phys(new_log_buf), new_log_buf_len);
 out:
 	print_log_buf_usage_stats();
 }
-- 
2.43.0

