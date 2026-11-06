Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990633;
	b=AOkZ1NiM0KY95dTtbv4RQtZQ7xXbf/qwV7VTZJ8/KqWpkH8pVe/Vky4vg+EZwyVl/Sqi
	 38xRUiAwYx0UeqRMG3+suz+VQoC1IMJOdsiCt6D7vnAOWIx5s112Kd5EMlALV6vfBt3+a
	 ETQ03vye8JX+l9i1R7b6STgE4VCd1tfRkioqSmShhX/zLspCj3ObRXF3YYRVKtHit863g
	 YoGLKBBOX5EfIWxE2x0OonIAEscnqkjgbTjok9TkJrINaeCuFux6Q/T09bUbs2Gsn8JEG
	 wlFE7z/oKcwMrGDljeFAsf2dPGRxEOJijtbLG2SHTMvQGigWiWKMQ5akC0awEkyIMmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
	b=BO249dXum+YGtdK2fkdxPW3gFlhknwIqD93uG4TE8A/0dlDHeZfj75RF2jor4LCKgPMM
	 PVPu/N1gp66wIEcYH7zrerK+BoKJngHagysIZWdXRmGLHmEFScjKWfsPEgc2X5Eha0wzy
	 z4A5aI++NlVvccJ81o/lT1OhtZx0Df9yB98vDRZW4s955GX+p4f5qPC/NRZ+siU1IgNu6
	 ant+nkHQ04wAPpNAIiIHcSFIEsXa+Yk+zQ5dQPfG0sJCW9K4wqilWtVH52pP9qiD1iczm
	 MVFxIrxOaJTGJ9poFOWTBpoo9igpXOjf7Arflfg4MIqPPLYASZnLl+xhIQgv59LefEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLUt8Oox;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F1606D83A
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 18:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07F1606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLUt8Oox
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1588019eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990632; x=1794595432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
        b=hLUt8Oox1wh+RjoZr4soKfhuHh/efc9x9XCcVBYW0QcvUiwa2YY1pL35ARccV2i0o4
         FwF8RyC6rYr0xQx5cEi756PL0wOLo9s+GrN2Lrc4SnZzQfZ2XzrhfY4UWj5erNGeVZjh
         mW671qX5TKHR5fN1JPk1n9a9b4wSnGvjoFPf2rMdO41BSMjTObGWsd2oTxO1jyr2Foy3
         tBkdUavBMTWrVs/SWnNgADkv2nZPYotHLXnszKEJ5WuaaRQ10FSGBcL8+FdmWSUukYEB
         p4uU8/D1M/frnSvLA057OEh+5whQd94RHg5Yzsi/WJvHh35jl35xkNZm/+w9cg7/OXZt
         xqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990632; x=1794595432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
        b=2yLq5aJB+KYm/P0HIoVGq9pMUPI2LfZDjL+82m47yCsWfS/C3RuV20ZCjFY5WXajhv
         1MenckQX1SYORcbYJfp9qcTkaez0KJKpgYroB4iXEoWTTQ48F7MpLx1INfdy/sVi7PVP
         PG+W4mzgwwUkAbU3FyZQ/vhxs/Zos5oGZ5HK+vuiWUlF8NfUiK5oDLFXwxX670IjBSUQ
         p0CoxJE8lGT9ZkHWIbtuyxLf6IddUUjuHE4sO8M/9lZVkkLjH7L9ZR5LykURnLjw2gZt
         50o4LuB/yZhrv3XjOLcoRVovqMXXz0kXMRynWO6S8FkGz4XdnBmceBSlHukkNLWxpP3r
         qquQ==
X-Gm-Message-State: APuU4Z9FK7CaWgCCc4xA9xUmWQB2yuqFapPWeti8bduJHxJBWIjz9q55
	OCmX4kJXSm3yYDWzJn2mmHF57uLF+9/5AezRJlctHXuPdBgQJLP58EsK
X-Gm-Gg: AYBFou0KtxwshuQt5r/UTTILxAIQ+aVfkvpaGI1F0PL6Bkk13lcGM6tFZaRM1mU2AtQ
	n4UrN72DA+KHm7vaFQTg4tDwF9FUeVUGH2/gWNrgXlh4xQJEoklVKDUwSMyEmAlYaUtDiQLNZ/n
	dkVbIRJVGxruq9YJ3V7kMeKanWfI2p+R5mF6JqZZywqr1YoeG3plyHvHdzslWeH+w8uuj56VDCr
	LHJ9XzjzL249e9dqXJwONp4PA73bIksk8nN8m6cuONF2FXsf2jDiQp2Qyjs9E8FQ0IMOF1pQUD7
	yJXWxGd7P2jaNgPotOLbsJK63u4h8y2zL6ny+umxXX/2WYPRryrII+n4l502VldjEXLZAfi794f
	chuaFLuDLza7TlKSwjsMEDuOQbX1JUeXiAnquI6Qv135W71iWkUyXLkwm6MaHgdLdFVhr0o+zgV
	J5xpokFRqbYWhcCc6DX6VSN9+g/+GB+YXsh3NPRQn+tWBfMlQvmEhw5/p9Q36fDWBqTb2tCNrMU
	vG3AnS22+B6vJ8oAbrvti4657ZKE3mWqJj2Ye/8B9e4eEd46rNqPsd+lzMZZ0P8gAGSJDq0+Fpz
	HgZ2cUs3k481IjN3CRSd9PH7TyUq
X-Received: by 2002:a05:693c:839b:10b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-36f76023a00mr5131720eec.25.1793990631801;
        Fri, 06 Nov 2026 10:43:51 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:51 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] remoteproc: qcom: Fix bounds check in wcnss_da_to_va()
Date: Sat,  7 Nov 2026 00:13:11 +0530
Message-ID: <20261106184312.100-5-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

offset is calculated as da - wcnss->mem_reloc and stored in a
32 bit signed int, while da and wcnss->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
wcnss->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < wcnss->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > wcnss->mem_size - offset) so no
intermediate sum can wrap.

Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_wcnss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..d95530e8be71 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -321,10 +321,12 @@ static int wcnss_stop(struct rproc *rproc)
 static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_wcnss *wcnss = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < wcnss->mem_reloc)
+		return NULL;
 	offset = da - wcnss->mem_reloc;
-	if (offset < 0 || offset + len > wcnss->mem_size)
+	if (offset > wcnss->mem_size || len > wcnss->mem_size - offset)
 		return NULL;
 
 	return (__force void *)wcnss->mem_region + offset;
-- 
2.43.0

