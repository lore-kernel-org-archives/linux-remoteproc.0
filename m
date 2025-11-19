Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC82C36B075
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567146; cv=none; b=G55sCO+tsXB3h7XokR+eybWCkfwQmRSYTPxjTAq/Wdrjo4732CRxljoaMAueFiX2NYrqtJLN8tgYYDpfjCDdNHTrUlA1zPZ6f9M+YN8SNWI+gp/kvDtpLyn+vnHDF3hvHoW1K0FWcy+XOwGhWGxNyRf6CyZRDy894FWBByBvGoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567146; c=relaxed/simple;
	bh=JX9G2IddNBochneGYWQCKynmuHEMYdz6GZlhqVo2tUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kR083njQb9G+QQsz23Qd7hoUZQrGwH1+jyFGiJ01UwBt202/YIGJETkdZK32nPqpe7FmU33147fjWlYBT0Tz7QdRhJChoZH1P5foC9fZGQV14HxAzMi3t4yBdFT11FSx9Zu+0y1uKJjXVcdoqRSAvGzmatwzrMbLxFHTo1WCsQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAnSdbFB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAnSdbFB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42bb288c219so3583072f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567139; x=1764171939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=rAnSdbFBCLvJLjGUsRP/QcCxvZOZSBH0Zgq71o4AlrJ42jn5rslMLmFXW2AxVikkjc
         TCFSyFvag+KDqaGb+sGs6y6Xav09Zyp10l3ZPFhA94o2Ri3OzwIj02xzj+m0FuSPn/Gv
         hD1RwrF7bt3oyLRQ5AQJ5JdP2XYKa+DRSBQ8FahHCby8Rmw4HIxn1MEMOVXs7a2B6/2u
         EVKQhhdTnuxBtaFrS4GyTGu+YV6B791L869p/wQHxmNOdi+WqgZOXrqw3s6bGiwy5FTy
         Tw6bwTM4dfJLyCpzNUExW1r8gLRr75kF8oll6wI7RdBr3kTbO/KRsqKSb6aLjhuH5/bX
         l6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567139; x=1764171939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=bSjVhCs17KmIk7WEkZpG6MxO1lrYBWtcpWTwD65Tnknnh5nZyoO6PZ58iGGxcJKq2v
         OmrN+tdjcj5KVfYE4W87QIzSdcAS8550fmbOWAm6dW4scgifqI7wyp5tQ5VkelOjWwIS
         0679w8WYXXqc9IY5hxM2ESxawPBdJj5lhFSnZ+G1HQ/oWOZqmYJaBkLcuhnqbbkM0h3E
         Cq/7zuAJDGkSuDPC8WFS8CSSU8662u1lmaXpKfn8gQQwrBx8J+mHWqFTxQjqE0Np25+j
         iLUwZJSajMligMhIkEP3bCpSeiCR8Ihj+3Me5P9+Zi67+FWnNv81+oE22muQj8KcxVGI
         KPBA==
X-Forwarded-Encrypted: i=1; AJvYcCXmSJXgCgNQ01MRkx85uRMjXeHsRRygsoieFyUyzBkAvQByM2vsOMCMgEYWcs7X8J4s8Fit2roYAOSPQctAbCkz@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdRhGkd3zImHimuNlubHSN0DJ/ihjmCvP0V4KiucnDIsFAT+I
	67yNj+Hcs45n8n107eJFINd4NZMH8MjSwfGR+73bCFT5aiWnaVL79GMKiPIvucZxHJs=
X-Gm-Gg: ASbGnctbT2jIvcrtVwVpvX4yFkhVap2CTJGRaVaGCjAjTiQ9JQ+XgFXEAr6eGTofsRM
	ElLHhZ87jk+HZ/E+R4BJS3bVPxtKkO0O4HtS9WfIhimiuPgHmHK2DYfC8CBHgVRpzlwbncHchGz
	8rFQomcXW+0v/N38zuFR/0AoGwK5DOm3o5KtjcouKRGGIobzP8zBndkyVoeogvbHOibA1lokDSG
	qUGhVcY7J30RCsjFi/ykDVtxfRUydKMh7KhpdFVpvMOufwwYaaD4DOcI+Cv5ZH84B6Un8TNTP79
	rPoFxM2HEJVqdg51Fb2bhG1H5/JSNRvG7PfWU5wwWGahtsp7qzZYRKQpkZ/muc8+EZQB1NjpVjj
	7Q5pWMbqVknBtthIzGDMOlVKm3NytDqn7LjJlZWzQsEay6wTYmNqvMfPO2NN9uzaM5Y22Grs+0C
	f33ikAhAz65BPL+xd9bnEbQZM2UuS4yA==
X-Google-Smtp-Source: AGHT+IEyhedKwAlBM3EiuchJNsF2kJSsWS7yZo6BNIFhuE+C/7ka0URI4Q7HQ+TXxvH0Bkqj0xsuVQ==
X-Received: by 2002:a05:6000:2c11:b0:429:cd3f:f43b with SMTP id ffacd0b85a97d-42b5933e404mr19233459f8f.4.1763567139371;
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
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
Subject: [PATCH 13/26] mm/init-mm: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:14 +0200
Message-ID: <20251119154427.1033475-14-eugen.hristev@linaro.org>
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
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 4600e7605cab..6931549bb7a2 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,7 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +20,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -48,6 +56,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {
-- 
2.43.0

