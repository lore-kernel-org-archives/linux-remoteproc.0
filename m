Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAE136B05F
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567147; cv=none; b=jnI6jer3PsjWwGuS24pmvv1ZKqbKN+2cFyslRFUirIqeic9+CPgBtiE+C6z5SzpQLNYSuj1oAhfEr0kxNgF4QfTesTEoHxBDgqMn3WBNX8Ko6ScqaWVBKFA6dSY2MDbGG2kDffA8+Rr7DDfet+UQ8yzlAXJBkToaPO7QFELNBxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567147; c=relaxed/simple;
	bh=bdt5n2rAVI8cStNvPmdZt8oM87hfXgPy8mlP/xL4jOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pb7MSc2mohbN43Agaof97jtDOIDrm5Ie2XG7gWGOduJGqIdhYwfeQf8nAjkOpTaTpxJ9OxDVAsen9oawB3mVTVWsn54iDcuc/gyhmZqD1z6j6LdJwepqb7k+cD7Z0Bqzq4+0qVYZKIjCnMEk5MmFvkmaX+reTuLeWDcE/2Vm3+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bz492DHl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bz492DHl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so50231705e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567138; x=1764171938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=bz492DHl5yOzE9yJqimKdlgCFvBmcsPkvDkuBNCriAVZnkeSAqY3nP7LGbyBZvdxbW
         oc2HOPgDgVH18yyt6HjNfvydEL8GIuHXv2Pofai7w1UKXlmII3hPumvCXNOvOePSROSi
         e/2BiBnIWC2n2sNn+FoRECLcoeEkoo+4CnwCEhpQwBpUULBVqNYLT4F1hgITIZqkJLqQ
         bfeKsPz9KlTRqx2ZVlK2A6artCAtJV32H7NQpEOqVUMiDR1uo3umGlgdSfA+RVSV9ygb
         zLmQSslT7dn9MaSqtfyzoxsSoi+0bpd+NdlBvr5Az29P7gmjqheUCt9rGNgINWi3WwuL
         Kn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567138; x=1764171938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=OSFGIloyiUy+rP7V6M9fXhy2RynyH3kpiV0qWdI+NdofRbRqmCXeiqlca6EkPaa7ag
         Y98SgupmDiDhIHj581k8yrJPRxs5sxSuJ8SS0ra1ZZQCT6a2tjV+CeUBdJYsOQZtSFnk
         EK1YIfCHqPhlLgvogrZee9jp5DNFbhYsQD+yDGjl8vRdIL05As7TTdiF51g03LcbVQ5R
         VtY2IF0kFhXp4b5K6fgLVWBnZwzSTPyNYbCnd0TtnhUo1qUayWKrRJP9WFrAMd/luPDn
         sKGmZl3/NQlWWIeP8wQgNAy+4dDdljO+LcHMCfWrxAcfrhq+wnYEIhdelA75rp82RgBT
         Otzg==
X-Forwarded-Encrypted: i=1; AJvYcCU/QLHQxi56Q9A/R5ivGrxKCNtkY/C0s5WqnZrN92ru/aJx1pcy7QZpZqvnYpj5ILZkOyrhRRYN01Nd4hkiLpS6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu9wY26vqIyyG5ibkXWI4ytdEgJHVNvVl/1CEIYsY00iVQSfFK
	pMqFRD7SRqlUZ/yZs9ZiEZMAJmVbaKNyb8C3tPMmrt8wZ92q36+gUO3lZeTbOBH9PEQ=
X-Gm-Gg: ASbGncuLbTegX/CHEqqHnOewqya166Fg53qASuMNZqnB6vFl0WcZARPgoJ9LpyBJvJF
	wugc6N3EvKOiBmXVCoAS7wCF8Ubs6J5JDnY7g5VvWdXFmjKy1D3NqQTYmHNXvxJmihztgEQ3X3h
	v5b0xK2QN7nEcJcNIsoeLqsOYFJtINgh5bW8x0r42R1ZGw148NFh4/DnfsvID7oFdeTK3znh+8T
	bR5UDj7wFgln1/k2X0Go8eCmkUdyESQ3O7jUkPVarLamA8TPfDcYC4sbnMHMwJ25SIp1AS4oseT
	1uMIRefz4UkClwEMX4ekWdWcgoN54HQc3BjdjCdi0EjKtrriTHKoH4nXnL3WnIhmi+QAiSwn/jG
	7RnUrLVTZvKoZpoU32xZOp9+cbLwvTn4jWwuDBquzz2/Jofj/G9rHXCEJX6CU96qFMeIQoUwlKA
	5hU9ji8HAwwMAHPqOcrRTqTzi+YF2mlUQUSn3gQNxw
X-Google-Smtp-Source: AGHT+IH9XA5XKwB+eYd4P52AVjjtUkCjRx7TcK6UtIfvF/aP3IOPVELnIO3YhYk8yezAw62YpuQ83g==
X-Received: by 2002:a5d:64e7:0:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42b593395a0mr22250899f8f.3.1763567137600;
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
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
Subject: [PATCH 12/26] kernel/configs: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:13 +0200
Message-ID: <20251119154427.1033475-13-eugen.hristev@linaro.org>
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

Register kernel_config_data information into inspection table.
Debugging tools look for the start and end markers, so we need to capture
those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..139ecc74bcee 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/meminspect.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
+			     (void *)&kernel_config_data - 8,
+			     &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 
-- 
2.43.0

